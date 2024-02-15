CREATE TABLE [dbo].[Abilities] (
    [ID]                        INT          IDENTITY (1, 1) NOT NULL,
    [AbilityName]               VARCHAR (64) NOT NULL,
    [AbilityDescription]        TEXT         NOT NULL,
    [BaseDamage]                INT          NOT NULL,
    [BaseManaCost]              INT          NOT NULL,
    [AbilityArchetype]          INT          NULL,
    [AbilitySecondaryArchetype] INT          NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([AbilityArchetype]) REFERENCES [dbo].[Archetypes] ([ID]),
    FOREIGN KEY ([AbilitySecondaryArchetype]) REFERENCES [dbo].[Archetypes] ([ID]),
    UNIQUE NONCLUSTERED ([AbilityName] ASC)
);

