CREATE TABLE [dbo].[Abilities] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [ArchetypeID]        INT           NULL,
    [Archetype2ID]       INT           NULL,
    [AbilityName]        VARCHAR (64)  NOT NULL,
    [AbilityDescription] VARCHAR (MAX) NOT NULL,
    [BaseDamage]         INT           NOT NULL,
    [BaseManaCost]       INT           NOT NULL,
    [CreatedDate]        DATETIME      NULL,
    [LastModDate]        DATETIME      NULL,
    [CreatedUser]        VARCHAR (255) NULL,
    [LastModUser]        VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([Archetype2ID]) REFERENCES [dbo].[Archetypes] ([ID]),
    FOREIGN KEY ([ArchetypeID]) REFERENCES [dbo].[Archetypes] ([ID]),
    UNIQUE NONCLUSTERED ([AbilityName] ASC)
);



