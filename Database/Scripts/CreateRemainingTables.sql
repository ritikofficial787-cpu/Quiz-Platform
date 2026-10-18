-- ============================================================================
-- QuizLearn: Remaining Tables Creation Script
-- Target: App_Data/Database1.mdf (SQL Server LocalDB)
-- Safe: All statements use IF NOT EXISTS — will not drop or modify existing data
-- ============================================================================

-- ============================================================================
-- 1. StudentProfiles
-- ============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentProfiles]') AND type = N'U')
BEGIN
    CREATE TABLE [dbo].[StudentProfiles] (
        [ProfileId]      INT            IDENTITY (1, 1) NOT NULL,
        [UserId]         INT            NOT NULL,
        [EducationLevel] NVARCHAR (100) NULL,
        [CollegeSchool]  NVARCHAR (200) NULL,
        [Course]         NVARCHAR (150) NULL,
        [StudyYear]      NVARCHAR (50)  NULL,
        [Subjects]       NVARCHAR (MAX) NULL,
        [UpdatedAt]      DATETIME       CONSTRAINT [DF_StudentProfiles_UpdatedAt] DEFAULT (GETUTCDATE()) NOT NULL,
        CONSTRAINT [PK_StudentProfiles]      PRIMARY KEY CLUSTERED ([ProfileId] ASC),
        CONSTRAINT [UQ_StudentProfiles_User] UNIQUE NONCLUSTERED ([UserId] ASC),
        CONSTRAINT [FK_StudentProfiles_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId])
    );
    PRINT 'Table [dbo].[StudentProfiles] created.';
END
ELSE
    PRINT 'Table [dbo].[StudentProfiles] already exists.';
GO

-- ============================================================================
-- 2. Quizzes
-- ============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quizzes]') AND type = N'U')
BEGIN
    CREATE TABLE [dbo].[Quizzes] (
        [QuizId]          INT            IDENTITY (1, 1) NOT NULL,
        [Title]           NVARCHAR (200) NOT NULL,
        [Subject]         NVARCHAR (100) NULL,
        [Difficulty]      NVARCHAR (20)  NULL,
        [DurationMinutes] INT            NOT NULL CONSTRAINT [DF_Quizzes_Duration] DEFAULT (20),
        [TotalQuestions]  INT            NOT NULL CONSTRAINT [DF_Quizzes_TotalQ]   DEFAULT (0),
        [IsActive]        BIT            NOT NULL CONSTRAINT [DF_Quizzes_IsActive] DEFAULT (1),
        [CreatedAt]       DATETIME       NOT NULL CONSTRAINT [DF_Quizzes_CreatedAt] DEFAULT (GETUTCDATE()),
        CONSTRAINT [PK_Quizzes] PRIMARY KEY CLUSTERED ([QuizId] ASC)
    );
    PRINT 'Table [dbo].[Quizzes] created.';
END
ELSE
    PRINT 'Table [dbo].[Quizzes] already exists.';
GO

-- ============================================================================
-- 3. Questions
-- ============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Questions]') AND type = N'U')
BEGIN
    CREATE TABLE [dbo].[Questions] (
        [QuestionId]   INT            IDENTITY (1, 1) NOT NULL,
        [QuizId]       INT            NOT NULL,
        [QuestionText] NVARCHAR (MAX) NOT NULL,
        [OptionA]      NVARCHAR (500) NOT NULL,
        [OptionB]      NVARCHAR (500) NOT NULL,
        [OptionC]      NVARCHAR (500) NOT NULL,
        [OptionD]      NVARCHAR (500) NOT NULL,
        [CorrectOption] NCHAR (1)     NOT NULL,
        [Explanation]  NVARCHAR (MAX) NULL,
        CONSTRAINT [PK_Questions]        PRIMARY KEY CLUSTERED ([QuestionId] ASC),
        CONSTRAINT [FK_Questions_Quiz]   FOREIGN KEY ([QuizId]) REFERENCES [dbo].[Quizzes] ([QuizId]) ON DELETE CASCADE,
        CONSTRAINT [CK_Questions_Opt]    CHECK ([CorrectOption] IN (N'A', N'B', N'C', N'D'))
    );
    PRINT 'Table [dbo].[Questions] created.';
END
ELSE
    PRINT 'Table [dbo].[Questions] already exists.';
GO

-- ============================================================================
-- 4. QuizAttempts
-- ============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuizAttempts]') AND type = N'U')
BEGIN
    CREATE TABLE [dbo].[QuizAttempts] (
        [AttemptId]        INT      IDENTITY (1, 1) NOT NULL,
        [UserId]           INT      NOT NULL,
        [QuizId]           INT      NOT NULL,
        [Score]            INT      NOT NULL CONSTRAINT [DF_Attempts_Score]   DEFAULT (0),
        [TotalQuestions]   INT      NOT NULL CONSTRAINT [DF_Attempts_TotalQ]  DEFAULT (0),
        [CorrectAnswers]   INT      NOT NULL CONSTRAINT [DF_Attempts_Correct] DEFAULT (0),
        [WrongAnswers]     INT      NOT NULL CONSTRAINT [DF_Attempts_Wrong]   DEFAULT (0),
        [TimeTakenSeconds] INT      NOT NULL CONSTRAINT [DF_Attempts_Time]    DEFAULT (0),
        [AttemptedAt]      DATETIME NOT NULL CONSTRAINT [DF_Attempts_At]      DEFAULT (GETUTCDATE()),
        CONSTRAINT [PK_QuizAttempts]       PRIMARY KEY CLUSTERED ([AttemptId] ASC),
        CONSTRAINT [FK_Attempts_User]      FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]  ([UserId]),
        CONSTRAINT [FK_Attempts_Quiz]      FOREIGN KEY ([QuizId]) REFERENCES [dbo].[Quizzes]([QuizId])
    );
    PRINT 'Table [dbo].[QuizAttempts] created.';
END
ELSE
    PRINT 'Table [dbo].[QuizAttempts] already exists.';
GO

-- ============================================================================
-- 5. UserAnswers
-- ============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAnswers]') AND type = N'U')
BEGIN
    CREATE TABLE [dbo].[UserAnswers] (
        [UserAnswerId]   INT     IDENTITY (1, 1) NOT NULL,
        [AttemptId]      INT     NOT NULL,
        [QuestionId]     INT     NOT NULL,
        [SelectedOption] NCHAR(1) NOT NULL,
        [IsCorrect]      BIT     NOT NULL CONSTRAINT [DF_UA_IsCorrect] DEFAULT (0),
        CONSTRAINT [PK_UserAnswers]        PRIMARY KEY CLUSTERED ([UserAnswerId] ASC),
        CONSTRAINT [FK_UA_Attempt]         FOREIGN KEY ([AttemptId])  REFERENCES [dbo].[QuizAttempts]([AttemptId]) ON DELETE CASCADE,
        CONSTRAINT [FK_UA_Question]        FOREIGN KEY ([QuestionId]) REFERENCES [dbo].[Questions]   ([QuestionId]),
        CONSTRAINT [CK_UA_SelectedOption]  CHECK ([SelectedOption] IN (N'A', N'B', N'C', N'D'))
    );
    PRINT 'Table [dbo].[UserAnswers] created.';
END
ELSE
    PRINT 'Table [dbo].[UserAnswers] already exists.';
GO

PRINT 'QuizLearn schema setup complete.';
