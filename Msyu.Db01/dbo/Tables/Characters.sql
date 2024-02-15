CREATE TABLE [dbo].[Characters] (
    [ID]            INT          IDENTITY (1, 1) NOT NULL,
    [FirstName]     VARCHAR (32) NOT NULL,
    [LastName]      VARCHAR (32) NOT NULL,
    [Age]           INT          NOT NULL,
    [DateOfBirth]   VARCHAR (32) NOT NULL,
    [Gender]        VARCHAR (8)  NOT NULL,
    [CharStatus]    INT          NOT NULL,
    [CharHistory]   TEXT         NOT NULL,
    [FightingStyle] TEXT         NOT NULL,
    [Personality]   TEXT         NOT NULL,
    [Faction]       INT          NULL,
    [Race]          INT          NOT NULL,
    [Archetype]     INT          NULL,
    [Attributes]    INT          NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([Archetype]) REFERENCES [dbo].[Archetypes] ([ID]),
    FOREIGN KEY ([Attributes]) REFERENCES [dbo].[CharacterStats] ([ID]),
    FOREIGN KEY ([CharStatus]) REFERENCES [dbo].[CharacterStatus] ([ID]),
    FOREIGN KEY ([Faction]) REFERENCES [dbo].[Factions] ([ID]),
    FOREIGN KEY ([Race]) REFERENCES [dbo].[Races] ([ID])
);

