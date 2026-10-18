using System;
using System.Data;
using System.Data.SqlClient;

namespace website.Data
{
    public class ProfileRepository
    {
        private readonly string _cs = DatabaseHelper.ConnectionString;

        public void SaveOrUpdateProfile(int userId, string educationLevel, string collegeSchool,
                                        string course, string studyYear, string subjectsCsv)
        {
            const string sql = @"
                IF EXISTS (SELECT 1 FROM [dbo].[StudentProfiles] WHERE UserId=@UserId)
                    UPDATE [dbo].[StudentProfiles]
                    SET EducationLevel=@Edu, CollegeSchool=@College, Course=@Course,
                        StudyYear=@Year, Subjects=@Subjects, UpdatedAt=GETUTCDATE()
                    WHERE UserId=@UserId
                ELSE
                    INSERT INTO [dbo].[StudentProfiles]
                        (UserId, EducationLevel, CollegeSchool, Course, StudyYear, Subjects, UpdatedAt)
                    VALUES (@UserId, @Edu, @College, @Course, @Year, @Subjects, GETUTCDATE())";

            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@UserId",   SqlDbType.Int).Value           = userId;
                cmd.Parameters.Add("@Edu",      SqlDbType.NVarChar, 100).Value = (object)educationLevel ?? DBNull.Value;
                cmd.Parameters.Add("@College",  SqlDbType.NVarChar, 200).Value = (object)collegeSchool ?? DBNull.Value;
                cmd.Parameters.Add("@Course",   SqlDbType.NVarChar, 150).Value = (object)course ?? DBNull.Value;
                cmd.Parameters.Add("@Year",     SqlDbType.NVarChar,  50).Value = (object)studyYear ?? DBNull.Value;
                cmd.Parameters.Add("@Subjects", SqlDbType.NVarChar,  -1).Value = (object)subjectsCsv ?? DBNull.Value;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public (string edu, string college, string course, string year, string subjects) GetProfile(int userId)
        {
            const string sql = @"
                SELECT EducationLevel, CollegeSchool, Course, StudyYear, Subjects
                FROM [dbo].[StudentProfiles] WHERE UserId=@UserId";

            using (var conn = new SqlConnection(_cs))
            using (var cmd  = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;
                conn.Open();
                using (var rdr = cmd.ExecuteReader(CommandBehavior.SingleRow))
                {
                    if (rdr.Read())
                    {
                        return (
                            rdr.IsDBNull(0) ? "" : rdr.GetString(0),
                            rdr.IsDBNull(1) ? "" : rdr.GetString(1),
                            rdr.IsDBNull(2) ? "" : rdr.GetString(2),
                            rdr.IsDBNull(3) ? "" : rdr.GetString(3),
                            rdr.IsDBNull(4) ? "" : rdr.GetString(4)
                        );
                    }
                }
            }
            return ("", "", "", "", "");
        }
    }
}
