using System;
using System.Collections.Generic;
using System.Web.UI;

namespace website
{
    public partial class QuizDetails : Page
    {
        protected string DifficultyCssClass { get; set; } = "ql-diff-medium";
        protected string CurrentQuizId { get; set; } = "csharp-oop";

        private class QuizInfo
        {
            public string Title { get; set; }
            public string Subtitle { get; set; }
            public string Category { get; set; }
            public string QuestionCount { get; set; }
            public string Duration { get; set; }
            public string Difficulty { get; set; }
            public string DifficultyCss { get; set; }
            public string Description { get; set; }
            public string[] Topics { get; set; }
        }

        private static readonly Dictionary<string, QuizInfo> QuizCatalog = new Dictionary<string, QuizInfo>(StringComparer.OrdinalIgnoreCase)
        {
            ["csharp-oop"] = new QuizInfo
            {
                Title = "C# OOP Fundamentals",
                Subtitle = "Test your understanding of Object-Oriented Programming in C#.",
                Category = "C# Programming",
                QuestionCount = "15 Questions",
                Duration = "20 Minutes",
                Difficulty = "Medium",
                DifficultyCss = "ql-diff-medium",
                Description = "Test your knowledge of classes, objects, inheritance and polymorphism.",
                Topics = new[] { "Classes & Objects", "Inheritance", "Polymorphism", "Encapsulation" }
            },
            ["database"] = new QuizInfo
            {
                Title = "Database Fundamentals",
                Subtitle = "Test your understanding of relational database design and SQL querying.",
                Category = "Database Systems",
                QuestionCount = "20 Questions",
                Duration = "25 Minutes",
                Difficulty = "Easy",
                DifficultyCss = "ql-diff-easy",
                Description = "SQL, normalization, keys and database concepts.",
                Topics = new[] { "Relational Schemas", "SQL Queries", "Normalization (1NF-3NF)", "Primary & Foreign Keys" }
            },
            ["java-basics"] = new QuizInfo
            {
                Title = "Java Programming Basics",
                Subtitle = "Test your understanding of core Java syntax and OOP principles.",
                Category = "Java Programming",
                QuestionCount = "15 Questions",
                Duration = "20 Minutes",
                Difficulty = "Medium",
                DifficultyCss = "ql-diff-medium",
                Description = "Java syntax, OOP and programming concepts.",
                Topics = new[] { "Variables & Data Types", "Control Statements", "OOP Principles", "JVM & Memory Layout" }
            },
            ["networking"] = new QuizInfo
            {
                Title = "Networking Basics",
                Subtitle = "Test your knowledge of networking protocols, layers, and architectures.",
                Category = "Computer Networks",
                QuestionCount = "20 Questions",
                Duration = "25 Minutes",
                Difficulty = "Hard",
                DifficultyCss = "ql-diff-hard",
                Description = "OSI model, TCP/IP and networking fundamentals.",
                Topics = new[] { "OSI 7 Layers", "TCP vs UDP", "IP Subnetting", "DNS & HTTP/HTTPS" }
            },
            ["os-fundamentals"] = new QuizInfo
            {
                Title = "Operating System Fundamentals",
                Subtitle = "Test your understanding of operating system architectures and processes.",
                Category = "Operating Systems",
                QuestionCount = "15 Questions",
                Duration = "20 Minutes",
                Difficulty = "Medium",
                DifficultyCss = "ql-diff-medium",
                Description = "Processes, memory management and scheduling.",
                Topics = new[] { "Process Scheduling", "Deadlock Conditions", "Virtual Memory & Paging", "Threads & Synchronization" }
            },
            ["web-dev"] = new QuizInfo
            {
                Title = "HTML, CSS & JavaScript",
                Subtitle = "Test your understanding of modern frontend web technologies.",
                Category = "Web Development",
                QuestionCount = "20 Questions",
                Duration = "25 Minutes",
                Difficulty = "Easy",
                DifficultyCss = "ql-diff-easy",
                Description = "Practice modern web development fundamentals.",
                Topics = new[] { "Semantic HTML5", "CSS Layout & Flexbox", "DOM Manipulation", "Modern JavaScript (ES6+)" }
            }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadQuizData();
            }
        }

        private void LoadQuizData()
        {
            string quizId = Request.QueryString["id"]?.Trim();

            // Safe server-side validation against allowed catalog keys
            if (string.IsNullOrEmpty(quizId) || !QuizCatalog.TryGetValue(quizId, out QuizInfo quiz))
            {
                // Default fallback to csharp-oop
                quizId = "csharp-oop";
                quiz = QuizCatalog["csharp-oop"];
            }

            CurrentQuizId = quizId;

            litPageTitle.Text = Server.HtmlEncode(quiz.Title);
            litQuizTitle.Text = Server.HtmlEncode(quiz.Title);
            litQuizSubtitle.Text = Server.HtmlEncode(quiz.Subtitle);
            litQuizCategory.Text = Server.HtmlEncode(quiz.Category);
            litQuestionCount.Text = Server.HtmlEncode(quiz.QuestionCount);
            litEstimatedDuration.Text = Server.HtmlEncode(quiz.Duration);
            litDifficultyLevel.Text = Server.HtmlEncode(quiz.Difficulty);
            DifficultyCssClass = quiz.DifficultyCss;
            litDetailedDescription.Text = Server.HtmlEncode(quiz.Description);

            litModalCategory.Text = Server.HtmlEncode(quiz.Category);
            litModalQuizTitle.Text = Server.HtmlEncode(quiz.Title);

            rptTopics.DataSource = quiz.Topics;
            rptTopics.DataBind();
        }
    }
}
