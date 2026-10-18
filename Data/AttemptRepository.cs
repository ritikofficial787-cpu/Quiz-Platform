using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using website.Models;

namespace website.Data
{
    public class AttemptRepository
    {
        private readonly string _cs = DatabaseHelper.ConnectionString;

        // ----------------------------------------------------------------
        // SAVE ATTEMPT  (answers graded server-side)
        // ----------------------------------------------------------------
        public int SaveAttempt(int userId, int quizId, List<(int questionId, string selected)> answers,
                               int timeTakenSeconds)
        {
            // Load correct answers from DB — never trust client
            var questions = new QuizRepository().GetQuestions(quizId);
            var correctMap = new Dictionary<int, string>();
            foreach (var q in questions)
                correctMap[q.QuestionId] = q.CorrectOption.Trim().ToUpper();

            int correct = 0;
            foreach (var (qid, sel) in answers)
            {
                if (correctMap.TryGetValue(qid, out string correctOpt) &&
                    string.Equals(sel?.Trim().ToUpper(), correctOpt, StringComparison.Ordinal))
                    correct++;
            }

            int total  = questions.Count;
            int wrong  = total - correct;
            int score  = total > 0 ? (int)Math.Round((double)correct / total * 100) : 0;

            using (var conn = new SqlConnection(_cs))
            {
                conn.Open();
                using (var tx = conn.BeginTransaction())
                {
                    try
                    {
                        const string insertAttempt = @"
                            INSERT INTO [dbo].[QuizAttempts]
                                (UserId,QuizId,Score,TotalQuestions,CorrectAnswers,WrongAnswers,TimeTakenSeconds,AttemptedAt)
                            VALUES (@UserId,@QuizId,@Score,@Total,@Correct,@Wrong,@Time,GETUTCDATE());
                            SELECT CAST(SCOPE_IDENTITY() AS INT);";

                        int attemptId;
                        using (var cmd = new SqlCommand(insertAttempt, conn, tx))
                        {
                            cmd.Parameters.Add("@UserId",  SqlDbType.Int).Value = userId;
                            cmd.Parameters.Add("@QuizId",  SqlDbType.Int).Value = quizId;
                            cmd.Parameters.Add("@Score",   SqlDbType.Int).Value = score;
                            cmd.Parameters.Add("@Total",   SqlDbType.Int).Value = total;
                            cmd.Parameters.Add("@Correct", SqlDbType.Int).Value = correct;
                            cmd.Parameters.Add("@Wrong",   SqlDbType.Int).Value = wrong;
                            cmd.Parameters.Add("@Time",    SqlDbType.Int).Value = timeTakenSeconds;
                            attemptId = Convert.ToInt32(cmd.ExecuteScalar());
                        }

                        const string insertAnswer = @"
                            INSERT INTO [dbo].[UserAnswers] (AttemptId,QuestionId,SelectedOption,IsCorrect)
                            VALUES (@AttemptId,@QuestionId,@Selected,@IsCorrect)";

                        foreach (var (qid, sel) in answers)
                        {
                            bool isCorrect = correctMap.TryGetValue(qid, out string co) &&
                                             string.Equals(sel?.Trim().ToUpper(), co, StringComparison.Ordinal);
                            using (var cmd = new SqlCommand(insertAnswer, conn, tx))
                            {
                                cmd.Parameters.Add("@AttemptId",  SqlDbType.Int).Value    = attemptId;
                                cmd.Parameters.Add("@QuestionId", SqlDbType.Int).Value    = qid;
                                cmd.Parameters.Add("@Selected",   SqlDbType.NChar, 1).Value = (sel ?? "A").Trim().ToUpper();
                                cmd.Parameters.Add("@IsCorrect",  SqlDbType.Bit).Value    = isCorrect;
                                cmd.ExecuteNonQuery();
                            }
                        }

                        tx.Commit();
                        return attemptId;
                    }
                    catch
                    {
                        tx.Rollback();
                        throw;
                    }
                }
            }
        }

        // ----------------------------------------------------------------
        // READ
        // ----------------------------------------------------------------
        public QuizAttempt GetAttemptById(int attemptId)
        {
            const string sql = @"
                SELECT a.AttemptId, a.UserId, a.QuizId, a.Score, a.TotalQuestions,
                       a.CorrectAnswers, a.WrongAnswers, a.TimeTakenSeconds, a.AttemptedAt,
                       q.Title, u.FullName, u.Email
                FROM   [dbo].[QuizAttempts] a
                JOIN   [dbo].[Quizzes] q ON q.QuizId = a.QuizId
                JOIN   [dbo].[Users]   u ON u.UserId = a.UserId
                WHERE  a.AttemptId = @Id";

            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = attemptId;
                conn.Open();
                using (var rdr = cmd.ExecuteReader(CommandBehavior.SingleRow))
                {
                    if (rdr.Read()) return MapAttempt(rdr);
                }
            }
            return null;
        }

        public List<QuizAttempt> GetAttemptsForUser(int userId, int top = 10)
        {
            var list = new List<QuizAttempt>();
            string sql = $@"
                SELECT TOP ({top}) a.AttemptId, a.UserId, a.QuizId, a.Score, a.TotalQuestions,
                       a.CorrectAnswers, a.WrongAnswers, a.TimeTakenSeconds, a.AttemptedAt,
                       q.Title, u.FullName, u.Email
                FROM   [dbo].[QuizAttempts] a
                JOIN   [dbo].[Quizzes] q ON q.QuizId = a.QuizId
                JOIN   [dbo].[Users]   u ON u.UserId = a.UserId
                WHERE  a.UserId = @UserId
                ORDER  BY a.AttemptedAt DESC";

            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;
                conn.Open();
                using (var rdr = cmd.ExecuteReader())
                    while (rdr.Read()) list.Add(MapAttempt(rdr));
            }
            return list;
        }

        public List<QuizAttempt> GetAllAttempts(int top = 50)
        {
            var list = new List<QuizAttempt>();
            string sql = $@"
                SELECT TOP ({top}) a.AttemptId, a.UserId, a.QuizId, a.Score, a.TotalQuestions,
                       a.CorrectAnswers, a.WrongAnswers, a.TimeTakenSeconds, a.AttemptedAt,
                       q.Title, u.FullName, u.Email
                FROM   [dbo].[QuizAttempts] a
                JOIN   [dbo].[Quizzes] q ON q.QuizId = a.QuizId
                JOIN   [dbo].[Users]   u ON u.UserId = a.UserId
                ORDER  BY a.AttemptedAt DESC";

            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                conn.Open();
                using (var rdr = cmd.ExecuteReader())
                    while (rdr.Read()) list.Add(MapAttempt(rdr));
            }
            return list;
        }

        public List<UserAnswer> GetAnswersForAttempt(int attemptId)
        {
            var list = new List<UserAnswer>();
            const string sql = @"
                SELECT ua.UserAnswerId, ua.AttemptId, ua.QuestionId, ua.SelectedOption, ua.IsCorrect,
                       q.QuestionText, q.OptionA, q.OptionB, q.OptionC, q.OptionD, q.CorrectOption, q.Explanation
                FROM   [dbo].[UserAnswers] ua
                JOIN   [dbo].[Questions]   q ON q.QuestionId = ua.QuestionId
                WHERE  ua.AttemptId = @AttemptId
                ORDER  BY ua.UserAnswerId";

            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@AttemptId", SqlDbType.Int).Value = attemptId;
                conn.Open();
                using (var rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        list.Add(new UserAnswer
                        {
                            UserAnswerId   = rdr.GetInt32(0),
                            AttemptId      = rdr.GetInt32(1),
                            QuestionId     = rdr.GetInt32(2),
                            SelectedOption = rdr.GetString(3).Trim(),
                            IsCorrect      = rdr.GetBoolean(4),
                            QuestionText   = rdr.GetString(5),
                            OptionA        = rdr.GetString(6),
                            OptionB        = rdr.GetString(7),
                            OptionC        = rdr.GetString(8),
                            OptionD        = rdr.GetString(9),
                            CorrectOption  = rdr.GetString(10).Trim(),
                            Explanation    = rdr.IsDBNull(11) ? "" : rdr.GetString(11)
                        });
                    }
                }
            }
            return list;
        }

        // ----------------------------------------------------------------
        // DASHBOARD STATS
        // ----------------------------------------------------------------
        public int GetTotalStudents()      => ExecScalar("SELECT COUNT(DISTINCT UserId) FROM [dbo].[QuizAttempts]");
        public int GetTotalAttempts()      => ExecScalar("SELECT COUNT(*) FROM [dbo].[QuizAttempts]");
        public int GetAverageScore()       => ExecScalar("SELECT ISNULL(CAST(AVG(CAST(Score AS FLOAT)) AS INT),0) FROM [dbo].[QuizAttempts]");
        public int GetCompletedForUser(int userId) =>
            ExecScalarParam("SELECT COUNT(*) FROM [dbo].[QuizAttempts] WHERE UserId=@UserId", "@UserId", userId);
        public int GetAverageScoreForUser(int userId) =>
            ExecScalarParam("SELECT ISNULL(CAST(AVG(CAST(Score AS FLOAT)) AS INT),0) FROM [dbo].[QuizAttempts] WHERE UserId=@UserId", "@UserId", userId);

        // ----------------------------------------------------------------
        // HELPERS
        // ----------------------------------------------------------------
        private static QuizAttempt MapAttempt(SqlDataReader r) => new QuizAttempt
        {
            AttemptId        = r.GetInt32(0),
            UserId           = r.GetInt32(1),
            QuizId           = r.GetInt32(2),
            Score            = r.GetInt32(3),
            TotalQuestions   = r.GetInt32(4),
            CorrectAnswers   = r.GetInt32(5),
            WrongAnswers     = r.GetInt32(6),
            TimeTakenSeconds = r.GetInt32(7),
            AttemptedAt      = r.GetDateTime(8),
            QuizTitle        = r.IsDBNull(9)  ? "" : r.GetString(9),
            UserName         = r.IsDBNull(10) ? "" : r.GetString(10),
            UserEmail        = r.IsDBNull(11) ? "" : r.GetString(11)
        };

        private int ExecScalar(string sql)
        {
            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            { conn.Open(); return Convert.ToInt32(cmd.ExecuteScalar()); }
        }

        private int ExecScalarParam(string sql, string paramName, int paramValue)
        {
            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add(paramName, SqlDbType.Int).Value = paramValue;
                conn.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }
}
