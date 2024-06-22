CREATE TABLE [dbo].[Continents] (
    [ID]                   INT           IDENTITY (1, 1) NOT NULL,
    [ContinentName]        VARCHAR (32)  NOT NULL,
    [ContinentDescription] VARCHAR (MAX) NOT NULL,
    [CreatedDate]          DATETIME      NULL,
    [LastModDate]          DATETIME      NULL,
    [CreatedUser]          VARCHAR (255) NULL,
    [LastModUser]          VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([ContinentName] ASC)
);



