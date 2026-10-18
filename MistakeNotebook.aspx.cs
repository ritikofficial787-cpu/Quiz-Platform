using System;
using System.Web.UI;

namespace website
{
    public partial class MistakeNotebook : Page
    {
        protected string StudentName { get; set; } = "Aarav Sharma";
        protected string StudentInitials { get; set; } = "AS";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserFullName"] != null && !string.IsNullOrEmpty(Session["UserFullName"].ToString()))
            {
                StudentName = Session["UserFullName"].ToString();
                string[] parts = StudentName.Trim().Split(' ');
                if (parts.Length >= 2 && parts[0].Length > 0 && parts[1].Length > 0)
                {
                    StudentInitials = $"{parts[0][0]}{parts[1][0]}".ToUpper();
                }
                else if (parts.Length == 1 && parts[0].Length >= 2)
                {
                    StudentInitials = parts[0].Substring(0, 2).ToUpper();
                }
            }
        }
    }
}
