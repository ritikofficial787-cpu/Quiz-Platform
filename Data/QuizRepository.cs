using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using website.Models;

namespace website.Data
{
    public class QuizRepository
    {
        private readonly string _cs = DatabaseHelper.ConnectionString;

        // ----------------------------------------------------------------
        // READ
        // ----------------------------------------------------------------
        public List<Quiz> GetAllQuizzes(bool activeOnly = false)
        {
            var list = new List<Quiz>();
            string sql = activeOnly
                ? "SELECT QuizId,Title,Subject,Difficulty,DurationMinutes,TotalQuestions,IsActive,CreatedAt FROM [dbo].[Quizzes] WHERE IsActive=1 ORDER BY CreatedAt DESC"
                : "SELECT QuizId,Title,Subject,Difficulty,DurationMinutes,TotalQuestions,IsActive,CreatedAt FROM [dbo].[Quizzes] ORDER BY CreatedAt DESC";

            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                conn.Open();
                using (var rdr = cmd.ExecuteReader())
                    while (rdr.Read()) list.Add(MapQuiz(rdr));
            }
            return list;
        }

        public Quiz GetQuizById(int quizId)
        {
            const string sql = "SELECT QuizId,Title,Subject,Difficulty,DurationMinutes,TotalQuestions,IsActive,CreatedAt FROM [dbo].[Quizzes] WHERE QuizId=@Id";
            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = quizId;
                conn.Open();
                using (var rdr = cmd.ExecuteReader(CommandBehavior.SingleRow))
                    return rdr.Read() ? MapQuiz(rdr) : null;
            }
        }

        public List<Question> GetQuestions(int quizId)
        {
            var list = new List<Question>();
            const string sql = "SELECT QuestionId,QuizId,QuestionText,OptionA,OptionB,OptionC,OptionD,CorrectOption,Explanation FROM [dbo].[Questions] WHERE QuizId=@QuizId";
            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@QuizId", SqlDbType.Int).Value = quizId;
                conn.Open();
                using (var rdr = cmd.ExecuteReader())
                    while (rdr.Read()) list.Add(MapQuestion(rdr));
            }
            return list;
        }

        // ----------------------------------------------------------------
        // WRITE  (quiz + questions in one transaction)
        // ----------------------------------------------------------------
        public int SaveQuizWithQuestions(Quiz quiz, List<Question> questions)
        {
            if (quiz == null) throw new ArgumentNullException(nameof(quiz));

            using (var conn = new SqlConnection(_cs))
            {
                conn.Open();
                using (var tx = conn.BeginTransaction())
                {
                    try
                    {
                        // Insert quiz header
                        const string insertQuiz = @"
                            INSERT INTO [dbo].[Quizzes]
                                (Title, Subject, Difficulty, DurationMinutes, TotalQuestions, IsActive, CreatedAt)
                            VALUES
                                (@Title, @Subject, @Difficulty, @Duration, @TotalQ, 1, GETUTCDATE());
                            SELECT CAST(SCOPE_IDENTITY() AS INT);";

                        int quizId;
                        using (var cmd = new SqlCommand(insertQuiz, conn, tx))
                        {
                            cmd.Parameters.Add("@Title",     SqlDbType.NVarChar, 200).Value = quiz.Title.Trim();
                            cmd.Parameters.Add("@Subject",   SqlDbType.NVarChar, 100).Value = (object)quiz.Subject ?? DBNull.Value;
                            cmd.Parameters.Add("@Difficulty",SqlDbType.NVarChar,  20).Value = (object)quiz.Difficulty ?? DBNull.Value;
                            cmd.Parameters.Add("@Duration",  SqlDbType.Int).Value           = quiz.DurationMinutes;
                            cmd.Parameters.Add("@TotalQ",    SqlDbType.Int).Value           = questions.Count;
                            quizId = Convert.ToInt32(cmd.ExecuteScalar());
                        }

                        // Insert questions
                        const string insertQ = @"
                            INSERT INTO [dbo].[Questions]
                                (QuizId,QuestionText,OptionA,OptionB,OptionC,OptionD,CorrectOption,Explanation)
                            VALUES
                                (@QuizId,@QText,@A,@B,@C,@D,@Correct,@Exp)";

                        foreach (var q in questions)
                        {
                            using (var cmd = new SqlCommand(insertQ, conn, tx))
                            {
                                cmd.Parameters.Add("@QuizId",  SqlDbType.Int).Value           = quizId;
                                cmd.Parameters.Add("@QText",   SqlDbType.NVarChar, -1).Value  = (q.QuestionText ?? "").Trim();
                                cmd.Parameters.Add("@A",       SqlDbType.NVarChar, 500).Value = (q.OptionA ?? "").Trim();
                                cmd.Parameters.Add("@B",       SqlDbType.NVarChar, 500).Value = (q.OptionB ?? "").Trim();
                                cmd.Parameters.Add("@C",       SqlDbType.NVarChar, 500).Value = (q.OptionC ?? "").Trim();
                                cmd.Parameters.Add("@D",       SqlDbType.NVarChar, 500).Value = (q.OptionD ?? "").Trim();
                                cmd.Parameters.Add("@Correct", SqlDbType.NChar,    1).Value   = (q.CorrectOption ?? "A").ToUpper();
                                cmd.Parameters.Add("@Exp",     SqlDbType.NVarChar, -1).Value  = (object)q.Explanation ?? DBNull.Value;
                                cmd.ExecuteNonQuery();
                            }
                        }

                        tx.Commit();
                        return quizId;
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
        // MANAGE
        // ----------------------------------------------------------------
        public void SetActive(int quizId, bool isActive)
        {
            const string sql = "UPDATE [dbo].[Quizzes] SET IsActive=@Active WHERE QuizId=@Id";
            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Active", SqlDbType.Bit).Value = isActive;
                cmd.Parameters.Add("@Id",     SqlDbType.Int).Value = quizId;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void DeleteQuiz(int quizId)
        {
            // FK ON DELETE CASCADE removes Questions automatically
            const string sql = "DELETE FROM [dbo].[Quizzes] WHERE QuizId=@Id";
            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Id", SqlDbType.Int).Value = quizId;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // ----------------------------------------------------------------
        // STATS
        // ----------------------------------------------------------------
        public int GetTotalQuizzes()
        {
            return ExecuteScalarInt("SELECT COUNT(*) FROM [dbo].[Quizzes]");
        }

        // ----------------------------------------------------------------
        // HELPERS
        // ----------------------------------------------------------------
        private static Quiz MapQuiz(SqlDataReader r) => new Quiz
        {
            QuizId          = r.GetInt32(0),
            Title           = r.GetString(1),
            Subject         = r.IsDBNull(2) ? "" : r.GetString(2),
            Difficulty      = r.IsDBNull(3) ? "" : r.GetString(3),
            DurationMinutes = r.GetInt32(4),
            TotalQuestions  = r.GetInt32(5),
            IsActive        = r.GetBoolean(6),
            CreatedAt       = r.GetDateTime(7)
        };

        private static Question MapQuestion(SqlDataReader r) => new Question
        {
            QuestionId    = r.GetInt32(0),
            QuizId        = r.GetInt32(1),
            QuestionText  = r.GetString(2),
            OptionA       = r.GetString(3),
            OptionB       = r.GetString(4),
            OptionC       = r.GetString(5),
            OptionD       = r.GetString(6),
            CorrectOption = r.GetString(7).Trim(),
            Explanation   = r.IsDBNull(8) ? "" : r.GetString(8)
        };

        private int ExecuteScalarInt(string sql)
        {
            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                conn.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }
}
