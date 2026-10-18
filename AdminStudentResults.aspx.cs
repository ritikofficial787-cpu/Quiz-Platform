using System;
using System.Web.UI;

namespace website
{
    public partial class AdminStudentResults : Page
    {
        protected string AdminName   { get; set; } = "Admin";
        protected string AdminAvatar { get; set; } = "A";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserFullName"] != null && !string.IsNullOrEmpty(Session["UserFullName"].ToString()))
            {
                AdminName = Session["UserFullName"].ToString();
                if (AdminName.Length > 0) AdminAvatar = AdminName.Substring(0, 1).ToUpper();
            }

            // BindResults uses rptResults / litNoResults which are declared in the designer
            // but have no corresponding runat="server" controls in the .aspx markup.
            // The static HTML table rows are rendered directly in the markup instead.
            // Calling BindResults() therefore caused a NullReferenceException at runtime.
            // The static rows provide sufficient demo data; no binding call is needed.
        }
    }
}

