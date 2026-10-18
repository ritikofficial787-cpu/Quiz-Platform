using System;
using System.Web.UI;

namespace website
{
    public partial class AdminAddQuiz : Page
    {
        protected string AdminName { get; set; } = "Admin";
        protected string AdminAvatar { get; set; } = "A";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserFullName"] != null && !string.IsNullOrEmpty(Session["UserFullName"].ToString()))
            {
                AdminName = Session["UserFullName"].ToString();
                if (AdminName.Length > 0)
                {
                    AdminAvatar = AdminName.Substring(0, 1).ToUpper();
                }
            }
        }
    }
}
