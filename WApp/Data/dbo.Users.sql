CREATE TABLE [dbo].[Users]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [Login] NVARCHAR(50) NOT NULL, 
    [Password] NVARCHAR(50) NOT NULL, 
    [Position] NVARCHAR(50) NOT NULL, 
    [DepartmentId] INT NULL, 
    [RoleId] INT NOT NULL,
	CONSTRAINT [FK_Users_ToRoles] FOREIGN KEY ([RoleId]) REFERENCES [Roles]([Id]),
	CONSTRAINT [FK_Users_ToDepartments] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments]([Id]) ON DELETE SET NULL
)
