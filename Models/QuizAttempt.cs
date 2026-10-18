using System;
using System.Collections.Generic;

namespace website.Models
{
    public class QuizAttempt
    {
        public int    AttemptId        { get; set; }
        public int    UserId           { get; set; }
        public int    QuizId           { get; set; }
        public int    Score            { get; set; }
        public int    TotalQuestions   { get; set; }
        public int    CorrectAnswers   { get; set; }
        public int    WrongAnswers     { get; set; }
        public int    TimeTakenSeconds { get; set; }
        public DateTime AttemptedAt   { get; set; }

        // Joined display data
        public string QuizTitle  { get; set; }
        public string UserName   { get; set; }
        public string UserEmail  { get; set; }

        public List<UserAnswer> Answers { get; set; } = new List<UserAnswer>();
    }

    public class UserAnswer
    {
        public int    UserAnswerId   { get; set; }
        public int    AttemptId      { get; set; }
        public int    QuestionId     { get; set; }
        public string SelectedOption { get; set; }
        public bool   IsCorrect      { get; set; }

        // Joined display data
        public string QuestionText  { get; set; }
        public string OptionA       { get; set; }
        public string OptionB       { get; set; }
        public string OptionC       { get; set; }
        public string OptionD       { get; set; }
        public string CorrectOption { get; set; }
        public string Explanation   { get; set; }
    }
}
