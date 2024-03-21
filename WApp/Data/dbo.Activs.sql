CREATE TABLE [dbo].[Activs]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [CabNumber] NVARCHAR(50) NOT NULL, 
    [DepartmentId] INT NULL,
	CONSTRAINT [FK_Activs_ToDepartments] FOREIGN KEY ([DepartmentId])
	REFERENCES [Departments]([Id]) ON DELETE SET NULL
)
