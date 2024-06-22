CREATE TABLE [dbo].[Characters] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]   VARCHAR (50)  NOT NULL,
    [LastName]    VARCHAR (50)  NOT NULL,
    [CreatedDate] DATETIME      NULL,
    [LastModDate] DATETIME      NULL,
    [CreatedUser] VARCHAR (255) NULL,
    [LastModUser] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);



