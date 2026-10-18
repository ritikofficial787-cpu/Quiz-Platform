using System;
using System.Web.UI;
using website.Data;

namespace website
{
    public partial class AdminDashboard : Page
    {
        protected string AdminName   { get; set; } = "Admin";
        protected string AdminAvatar { get; set; } = "A";

        protected int StatStudents { get; set; }
        protected int StatQuizzes  { get; set; }
        protected int StatAttempts { get; set; }
        protected int StatAvgScore { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserFullName"] != null && !string.IsNullOrEmpty(Session["UserFullName"].ToString()))
            {
                AdminName = Session["UserFullName"].ToString();
                if (AdminName.Length > 0) AdminAvatar = AdminName.Substring(0, 1).ToUpper();
            }

            if (!IsPostBack) LoadStats();
        }

        private void LoadStats()
        {
            try
            {
                var ar = new AttemptRepository();
                var qr = new QuizRepository();
                StatStudents = ar.GetTotalStudents();
                StatQuizzes  = qr.GetTotalQuizzes();
                StatAttempts = ar.GetTotalAttempts();
                StatAvgScore = ar.GetAverageScore();
            }
            catch { /* Stats remain 0 if DB unreachable */ }
        }
    }
}

