CREATE TABLE [dbo].[Locations] (
    [ID]                  INT          IDENTITY (1, 1) NOT NULL,
    [LocationName]        VARCHAR (32) NOT NULL,
    [LocationDescription] TEXT         NOT NULL,
    [Continent]           INT          NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([Continent]) REFERENCES [dbo].[Continents] ([ID]),
    UNIQUE NONCLUSTERED ([LocationName] ASC)
);

