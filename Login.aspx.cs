using System;
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Web.UI;
using website.Data;
using website.Models;
using website.Security;

namespace website
{
    public partial class Login : Page
    {
        private readonly UserRepository _userRepository = new UserRepository();

        protected string MessageCssClass { get; set; } = "ql-auth-alert-danger";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Handle explicit logout before checking authentication
            if (string.Equals(Request.QueryString["logout"], "true", StringComparison.OrdinalIgnoreCase))
            {
                FormsAuthentication.SignOut();
                Session.Clear();
                Session.Abandon();

                // Explicitly expire the forms authentication cookie
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    var expiredCookie = new System.Web.HttpCookie(FormsAuthentication.FormsCookieName, "")
                    {
                        Expires = DateTime.Now.AddDays(-1),
                        Path = FormsAuthentication.FormsCookiePath
                    };
                    Response.Cookies.Add(expiredCookie);
                }

                ShowSuccessMessage("You have been signed out successfully.");
                return;
            }

            if (!IsPostBack)
            {
                pnlMessage.Visible = false;

                // Handle post-registration arrival banner
                if (string.Equals(Request.QueryString["registered"], "true", StringComparison.OrdinalIgnoreCase))
                {
                    ShowSuccessMessage("Account created successfully! Please enter your credentials to log in.");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Page.Validate("LoginValidationGroup");
            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text?.Trim() ?? string.Empty;
            string password = txtPassword.Text ?? string.Empty;

            // Strict Server-Side Validation
            if (string.IsNullOrWhiteSpace(email))
            {
                ShowErrorMessage("Please enter your email address.");
                return;
            }

            var emailRegex = new Regex(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
            if (!emailRegex.IsMatch(email))
            {
                ShowErrorMessage("Please enter a valid email address.");
                return;
            }

            if (string.IsNullOrEmpty(password))
            {
                ShowErrorMessage("Please enter your password.");
                return;
            }

            // Special Admin login check (Frontend / No DB required)
            if (string.Equals(email, "Ritik@gmail.com", StringComparison.OrdinalIgnoreCase) && password == "123456")
            {
                Session["UserId"] = 9999;
                Session["UserFullName"] = "Admin Ritik";
                Session["UserEmail"] = "Ritik@gmail.com";
                Session["IsAdmin"] = true;
                Session["UserRole"] = "Admin";

                FormsAuthentication.SetAuthCookie("Ritik@gmail.com", chkRememberMe.Checked);
                Response.Redirect("~/AdminDashboard.aspx", endResponse: true);
                return;
            }

            // Special User login check (Frontend / No DB required)
            if (string.Equals(email, "abc@gmail.com", StringComparison.OrdinalIgnoreCase) && password == "123456")
            {
                Session["UserId"] = 1001;
                Session["UserFullName"] = "Learner";
                Session["UserEmail"] = "abc@gmail.com";
                Session["IsAdmin"] = false;
                Session["UserRole"] = "Student";

                FormsAuthentication.SetAuthCookie("abc@gmail.com", chkRememberMe.Checked);
                Response.Redirect("~/StudentDashboard.aspx", endResponse: true);
                return;
            }

            try
            {
                // Retrieve user using parameterized SQL
                User user = _userRepository.GetUserByEmail(email);

                // Generic error to avoid account enumeration attacks
                const string genericErrorMessage = "Invalid email or password.";

                if (user == null)
                {
                    ShowErrorMessage(genericErrorMessage);
                    return;
                }

                // Verify candidate password against PBKDF2 hash
                bool isPasswordValid = PasswordHasher.VerifyHashedPassword(user.PasswordHash, password);

                if (!isPasswordValid)
                {
                    ShowErrorMessage(genericErrorMessage);
                    return;
                }

                // Session-based credentials storage
                Session["UserId"] = user.UserId;
                Session["UserFullName"] = user.FullName;
                Session["UserEmail"] = user.Email;

                // Forms Authentication Ticket Creation
                bool rememberMe = chkRememberMe.Checked;
                FormsAuthentication.SetAuthCookie(user.Email, rememberMe);

                // Safe URL redirection
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (!string.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
                {
                    Response.Redirect(returnUrl, endResponse: true);
                }
                else
                {
                    Response.Redirect("~/Dashboard.aspx", endResponse: true);
                }
            }
            catch (System.Threading.ThreadAbortException)
            {
                // Normal ASP.NET response redirection behavior
            }
            catch (Exception)
            {
                // Safe generic error handling without exposing database or system exceptions
                ShowErrorMessage("An error occurred while processing your request. Please try again.");
            }
        }

        private void ShowErrorMessage(string message)
        {
            MessageCssClass = "ql-auth-alert-danger";
            lblMessage.Text = message;
            pnlMessage.Visible = true;
        }

        private void ShowSuccessMessage(string message)
        {
            MessageCssClass = "ql-auth-alert-success";
            lblMessage.Text = message;
            pnlMessage.Visible = true;
        }

        private bool IsLocalUrl(string url)
        {
            if (string.IsNullOrEmpty(url)) return false;

            return (url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\')))
                || (url.Length > 1 && url[0] == '~' && url[1] == '/');
        }
    }
}
