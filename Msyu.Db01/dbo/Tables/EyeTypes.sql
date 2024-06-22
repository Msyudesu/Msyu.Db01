CREATE TABLE [dbo].[EyeTypes] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [EyeName]        VARCHAR (50)  NULL,
    [EyeDescription] VARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME      NULL,
    [LastModDate]    DATETIME      NULL,
    [CreatedUser]    VARCHAR (255) NULL,
    [LastModUser]    VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

