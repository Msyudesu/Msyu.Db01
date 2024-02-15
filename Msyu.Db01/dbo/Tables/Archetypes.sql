CREATE TABLE [dbo].[Archetypes] (
    [ID]                   INT          IDENTITY (1, 1) NOT NULL,
    [ArchetypeName]        VARCHAR (32) NOT NULL,
    [ArchetypeDescription] TEXT         NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([ArchetypeName] ASC)
);

