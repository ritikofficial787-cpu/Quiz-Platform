using System;

namespace website.Models
{
    public class Quiz
    {
        public int    QuizId          { get; set; }
        public string Title           { get; set; }
        public string Subject         { get; set; }
        public string Difficulty      { get; set; }
        public int    DurationMinutes { get; set; }
        public int    TotalQuestions  { get; set; }
        public bool   IsActive        { get; set; }
        public DateTime CreatedAt     { get; set; }
    }
}
