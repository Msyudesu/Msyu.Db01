CREATE TABLE [dbo].[Continents] (
    [ID]                   INT          IDENTITY (1, 1) NOT NULL,
    [ContinentName]        VARCHAR (32) NOT NULL,
    [ContinentDescription] TEXT         NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([ContinentName] ASC)
);

