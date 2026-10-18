using System;
using System.Web.UI;

namespace website
{
    public partial class Profile : Page
    {
        public string StudentName { get; set; } = "Aarav Sharma";
        public string StudentEmail { get; set; } = "abc@gmail.com";
        public string StudentInitials { get; set; } = "AS";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserFullName"] != null && !string.IsNullOrWhiteSpace(Session["UserFullName"].ToString()))
            {
                StudentName = Session["UserFullName"].ToString();
            }

            if (Session["UserEmail"] != null && !string.IsNullOrWhiteSpace(Session["UserEmail"].ToString()))
            {
                StudentEmail = Session["UserEmail"].ToString();
            }

            var parts = StudentName.Trim().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length >= 2)
            {
                StudentInitials = ("" + parts[0][0] + parts[1][0]).ToUpper();
            }
            else if (parts.Length == 1 && parts[0].Length > 0)
            {
                StudentInitials = parts[0].Substring(0, Math.Min(2, parts[0].Length)).ToUpper();
            }
        }
    }
}
