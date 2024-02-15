CREATE TABLE [dbo].[Races] (
    [ID]              INT          IDENTITY (1, 1) NOT NULL,
    [RaceName]        VARCHAR (32) NOT NULL,
    [RaceDescription] TEXT         NOT NULL,
    [RaceHomeFaction] INT          NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([RaceHomeFaction]) REFERENCES [dbo].[Factions] ([ID]),
    UNIQUE NONCLUSTERED ([RaceName] ASC)
);

