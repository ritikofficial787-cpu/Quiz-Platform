using System;
using System.Web.Security;
using System.Web.UI;
using website.Data;
using website.Models;

namespace website
{
    public partial class Dashboard : Page
    {
        private readonly UserRepository _userRepository = new UserRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Server-side authentication verification
            if (!User.Identity.IsAuthenticated && Session["UserId"] == null)
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl), endResponse: true);
                return;
            }

            if (!IsPostBack)
            {
                LoadLearnerProfile();
            }
        }

        private void LoadLearnerProfile()
        {
            string fullName = Session["UserFullName"] as string;
            string email = Session["UserEmail"] as string ?? User.Identity.Name;

            // If session expired or missing, fetch from database using FormsAuthentication Identity Name
            if (string.IsNullOrEmpty(fullName) && !string.IsNullOrEmpty(email))
            {
                User user = _userRepository.GetUserByEmail(email);
                if (user != null)
                {
                    fullName = user.FullName;
                    Session["UserId"] = user.UserId;
                    Session["UserFullName"] = user.FullName;
                    Session["UserEmail"] = user.Email;
                }
            }

            litUserName.Text = Server.HtmlEncode(string.IsNullOrEmpty(fullName) ? "Learner" : fullName);
            litUserEmail.Text = Server.HtmlEncode(string.IsNullOrEmpty(email) ? "Student" : email);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Full session cleanup and ticket expiration
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/Login.aspx?logout=true", endResponse: true);
        }
    }
}
