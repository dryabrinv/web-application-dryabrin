﻿CREATE TABLE [dbo].[Lifecycles]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Opened] DATETIME NOT NULL, 
    [Distributed] DATETIME NULL, 
    [Proccesing] DATETIME NULL, 
    [Checking] DATETIME NULL, 
    [Closed] DATETIME NULL
)

