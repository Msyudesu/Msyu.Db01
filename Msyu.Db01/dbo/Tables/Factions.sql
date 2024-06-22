CREATE TABLE [dbo].[Factions] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [LocationID]         INT           NULL,
    [FactionName]        VARCHAR (64)  NOT NULL,
    [FactionDescription] VARCHAR (MAX) NOT NULL,
    [CreatedDate]        DATETIME      NULL,
    [LastModDate]        DATETIME      NULL,
    [CreatedUser]        VARCHAR (255) NULL,
    [LastModUser]        VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([LocationID]) REFERENCES [dbo].[Locations] ([ID]),
    UNIQUE NONCLUSTERED ([FactionName] ASC)
);



