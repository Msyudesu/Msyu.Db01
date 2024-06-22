CREATE TABLE [dbo].[Races] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [FactionID]       INT           NULL,
    [RaceName]        VARCHAR (32)  NOT NULL,
    [RaceDescription] VARCHAR (MAX) NOT NULL,
    [CreatedDate]     DATETIME      NULL,
    [LastModDate]     DATETIME      NULL,
    [CreatedUser]     VARCHAR (255) NULL,
    [LastModUser]     VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([FactionID]) REFERENCES [dbo].[Factions] ([ID]),
    UNIQUE NONCLUSTERED ([RaceName] ASC)
);



