using System;
using System.Web.UI;
using website.Data;

namespace website
{
    public partial class AdminManageQuizzes : Page
    {
        protected string AdminName   { get; set; } = "Admin";
        protected string AdminAvatar { get; set; } = "A";

        private readonly QuizRepository _quizRepo = new QuizRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserFullName"] != null && !string.IsNullOrEmpty(Session["UserFullName"].ToString()))
            {
                AdminName = Session["UserFullName"].ToString();
                if (AdminName.Length > 0) AdminAvatar = AdminName.Substring(0, 1).ToUpper();
            }

            // Handle action requests
            string action  = Request.QueryString["action"];
            string idParam = Request.QueryString["qid"];
            int quizId;
            if (!string.IsNullOrEmpty(action) && int.TryParse(idParam, out quizId) && quizId > 0)
            {
                if (action == "delete")  _quizRepo.DeleteQuiz(quizId);
                if (action == "activate")   _quizRepo.SetActive(quizId, true);
                if (action == "deactivate") _quizRepo.SetActive(quizId, false);
                Response.Redirect("~/AdminManageQuizzes.aspx", endResponse: true);
                return;
            }

            if (!IsPostBack) BindQuizList();
        }

        private void BindQuizList()
        {
            try
            {
                var quizzes = _quizRepo.GetAllQuizzes(activeOnly: false);
                rptQuizzes.DataSource = quizzes;
                rptQuizzes.DataBind();
                litNoQuizzes.Visible = (quizzes.Count == 0);
            }
            catch
            {
                litNoQuizzes.Visible = true;
            }
        }
    }
}

