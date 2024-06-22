CREATE TABLE [dbo].[HairStyles] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [StyleName]        VARCHAR (50)  NULL,
    [StyleDescription] VARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME      NULL,
    [LastModDate]      DATETIME      NULL,
    [CreatedUser]      VARCHAR (255) NULL,
    [LastModUser]      VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

