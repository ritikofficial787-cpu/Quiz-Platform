using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using website.Models;

namespace website.Data
{
    /// <summary>
    /// Handles database operations for QuizLearn user accounts using parameterized SQL queries.
    /// </summary>
    public class UserRepository
    {
        private readonly string _connectionString;

        public UserRepository()
        {
            var connSettings = ConfigurationManager.ConnectionStrings["DefaultConnection"];
            if (connSettings == null || string.IsNullOrWhiteSpace(connSettings.ConnectionString))
            {
                throw new InvalidOperationException("DefaultConnection connection string is missing from Web.config.");
            }
            _connectionString = connSettings.ConnectionString;
        }

        public UserRepository(string connectionString)
        {
            _connectionString = connectionString ?? throw new ArgumentNullException(nameof(connectionString));
        }

        /// <summary>
        /// Checks whether a user with the specified email already exists.
        /// </summary>
        public bool UserExists(string email)
        {
            if (string.IsNullOrWhiteSpace(email)) return false;

            const string sql = "SELECT COUNT(1) FROM [dbo].[Users] WHERE LOWER([Email]) = LOWER(@Email);";

            using (var conn = new SqlConnection(_connectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 256).Value = email.Trim();
                conn.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return count > 0;
            }
        }

        /// <summary>
        /// Creates a new user record.
        /// Returns the new UserId on success, or -1 if the email is already registered.
        /// </summary>
        public int CreateUser(string fullName, string email, string passwordHash)
        {
            if (string.IsNullOrWhiteSpace(fullName)) throw new ArgumentException("Full name is required.", nameof(fullName));
            if (string.IsNullOrWhiteSpace(email)) throw new ArgumentException("Email is required.", nameof(email));
            if (string.IsNullOrWhiteSpace(passwordHash)) throw new ArgumentException("Password hash is required.", nameof(passwordHash));

            const string sql = @"
                IF EXISTS (SELECT 1 FROM [dbo].[Users] WHERE LOWER([Email]) = LOWER(@Email))
                BEGIN
                    SELECT -1;
                END
                ELSE
                BEGIN
                    INSERT INTO [dbo].[Users] ([FullName], [Email], [PasswordHash], [CreatedAt])
                    VALUES (@FullName, LOWER(@Email), @PasswordHash, GETUTCDATE());
                    SELECT CAST(SCOPE_IDENTITY() AS INT);
                END";

            using (var conn = new SqlConnection(_connectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 100).Value = fullName.Trim();
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 256).Value = email.Trim();
                cmd.Parameters.Add("@PasswordHash", SqlDbType.NVarChar, 255).Value = passwordHash;

                conn.Open();
                object result = cmd.ExecuteScalar();
                return result != null && result != DBNull.Value ? Convert.ToInt32(result) : -1;
            }
        }

        /// <summary>
        /// Retrieves a user by their email address. Returns null if not found.
        /// </summary>
        public User GetUserByEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email)) return null;

            const string sql = @"
                SELECT [UserId], [FullName], [Email], [PasswordHash], [CreatedAt]
                FROM [dbo].[Users]
                WHERE LOWER([Email]) = LOWER(@Email);";

            using (var conn = new SqlConnection(_connectionString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 256).Value = email.Trim();
                conn.Open();

                using (var reader = cmd.ExecuteReader(CommandBehavior.SingleRow))
                {
                    if (reader.Read())
                    {
                        return new User
                        {
                            UserId = reader.GetInt32(0),
                            FullName = reader.GetString(1),
                            Email = reader.GetString(2),
                            PasswordHash = reader.GetString(3),
                            CreatedAt = reader.GetDateTime(4)
                        };
                    }
                }
            }

            return null;
        }
    }
}
