CREATE TABLE [dbo].[CharacterAbilities] (
    [ID]          INT IDENTITY (1, 1) NOT NULL,
    [AbilityID]   INT NULL,
    [CharacterID] INT NOT NULL,
    [AbilityRank] INT DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([AbilityID]) REFERENCES [dbo].[Abilities] ([ID]),
    FOREIGN KEY ([CharacterID]) REFERENCES [dbo].[Characters] ([ID])
);

