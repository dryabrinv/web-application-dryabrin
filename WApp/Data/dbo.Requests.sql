CREATE TABLE [dbo].[Requests] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50)  NOT NULL,
    [Description] NVARCHAR (200) NULL,
    [Comment]     NVARCHAR (200) NULL,
    [Status]      INT            NOT NULL,
    [Priority]    INT            NOT NULL,
    [ActivId]     INT            NULL,
    [File]        NVARCHAR (200) NULL,
    [CategoryId]  INT            NULL,
    [UserId]      INT            NULL,
    [ExecutorId]  INT            NULL,
    [LifecycleId] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Requests_ToCategories] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([Id]) ON DELETE SET NULL,
    CONSTRAINT [FK_Requests_ToUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE SET NULL,
    CONSTRAINT [FK_Requests_ToLifecycles] FOREIGN KEY ([LifecycleId]) REFERENCES [dbo].[Lifecycles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Requests_ToActivs] FOREIGN KEY ([ActivId]) REFERENCES [dbo].[Activs] ([Id]) ON DELETE SET NULL
);
 
GO
 
CREATE TRIGGER [dbo].[Trigger_Requests]
    ON [dbo].[Users]
    FOR DELETE
    AS
    BEGIN
       UPDATE Requests SET ExecutorId = NULL
     WHERE Requests.ExecutorId IN (SELECT [Id] FROM [deleted]);
    END
 
GO
 
CREATE TRIGGER [dbo].[Trigger_Requests2]
    ON [dbo].[Users]
    FOR UPDATE
    AS
    BEGIN
        UPDATE Requests SET ExecutorId = NULL
     WHERE Requests.ExecutorId IN (SELECT [Id] FROM [inserted]) AND (SELECT [Name] FROM Roles WHERE Id=(SELECT [RoleId] FROM [inserted])) <> 'Исполнитель';
    END

