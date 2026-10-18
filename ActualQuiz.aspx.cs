using System;
using System.Collections.Generic;
using System.Web.UI;

namespace website
{
    public partial class ActualQuiz : Page
    {
        protected string QuizId { get; set; } = "csharp-oop";

        private class QuizMeta
        {
            public string Title { get; set; }
            public string Badge { get; set; }
        }

        private static readonly Dictionary<string, QuizMeta> QuizHeaders = new Dictionary<string, QuizMeta>(StringComparer.OrdinalIgnoreCase)
        {
            ["csharp-oop"] = new QuizMeta { Title = "C# OOP Fundamentals", Badge = "C#" },
            ["database"] = new QuizMeta { Title = "Database Fundamentals", Badge = "Database" },
            ["java-basics"] = new QuizMeta { Title = "Java Programming Basics", Badge = "Java" },
            ["networking"] = new QuizMeta { Title = "Networking Basics", Badge = "Networking" },
            ["os-fundamentals"] = new QuizMeta { Title = "Operating System Fundamentals", Badge = "OS" },
            ["web-dev"] = new QuizMeta { Title = "HTML, CSS & JavaScript", Badge = "Web Dev" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"]?.Trim();

            if (string.IsNullOrEmpty(id) || !QuizHeaders.TryGetValue(id, out QuizMeta meta))
            {
                id = "csharp-oop";
                meta = QuizHeaders["csharp-oop"];
            }

            QuizId = id;
            litPageTitle.Text = Server.HtmlEncode(meta.Title);
            litTopQuizTitle.Text = Server.HtmlEncode(meta.Title);
            litTopCategoryBadge.Text = Server.HtmlEncode(meta.Badge);
        }
    }
}
