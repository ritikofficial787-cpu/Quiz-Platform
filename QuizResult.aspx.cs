using System;
using System.Web.UI;

namespace website
{
    public partial class QuizResult : Page
    {
        protected string QuizId { get; set; } = "csharp-oop";

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"]?.Trim();
            if (!string.IsNullOrEmpty(id))
            {
                QuizId = Server.HtmlEncode(id);
            }
        }
    }
}
