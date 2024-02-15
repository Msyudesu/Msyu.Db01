CREATE TABLE [dbo].[Factions] (
    [ID]                 INT          IDENTITY (1, 1) NOT NULL,
    [FactionName]        VARCHAR (64) NOT NULL,
    [FactionDescription] TEXT         NOT NULL,
    [HomeLocation]       INT          NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([HomeLocation]) REFERENCES [dbo].[Locations] ([ID]),
    UNIQUE NONCLUSTERED ([FactionName] ASC)
);

