-- ============================================================================
-- QuizLearn: Users Table Creation Script
-- Target Database: App_Data/Database1.mdf (SQL Server LocalDB)
-- Description: Idempotent script to create the Users table for QuizLearn auth.
-- ============================================================================

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Users] (
        [UserId]       INT            IDENTITY (1, 1) NOT NULL,
        [FullName]     NVARCHAR (100) NOT NULL,
        [Email]        NVARCHAR (256) NOT NULL,
        [PasswordHash] NVARCHAR (255) NOT NULL,
        [CreatedAt]    DATETIME       CONSTRAINT [DF_Users_CreatedAt] DEFAULT (GETUTCDATE()) NOT NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserId] ASC),
        CONSTRAINT [UQ_Users_Email] UNIQUE NONCLUSTERED ([Email] ASC)
    );

    PRINT 'Table [dbo].[Users] created successfully.';
END
ELSE
BEGIN
    PRINT 'Table [dbo].[Users] already exists.';
END
GO
