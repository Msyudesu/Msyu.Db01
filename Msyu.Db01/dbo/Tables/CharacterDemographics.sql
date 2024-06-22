CREATE TABLE [dbo].[CharacterDemographics] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [ChararcterID] INT           NOT NULL,
    [FactionID]    INT           NULL,
    [RaceID]       INT           NOT NULL,
    [ArchetypeID]  INT           NULL,
    [Age]          INT           NOT NULL,
    [DateOfBirth]  VARCHAR (32)  NOT NULL,
    [Gender]       VARCHAR (8)   NOT NULL,
    [CreatedDate]  DATETIME      NULL,
    [LastModDate]  DATETIME      NULL,
    [CreatedUser]  VARCHAR (255) NULL,
    [LastModUser]  VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([ArchetypeID]) REFERENCES [dbo].[Archetypes] ([ID]),
    FOREIGN KEY ([ChararcterID]) REFERENCES [dbo].[Characters] ([ID]),
    FOREIGN KEY ([FactionID]) REFERENCES [dbo].[Factions] ([ID]),
    FOREIGN KEY ([RaceID]) REFERENCES [dbo].[Races] ([ID])
);

