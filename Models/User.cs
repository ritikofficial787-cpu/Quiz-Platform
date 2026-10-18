using System;

namespace website.Models
{
    /// <summary>
    /// Represents an authenticated learner/user account within QuizLearn.
    /// </summary>
    public class User
    {
        public int UserId { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
