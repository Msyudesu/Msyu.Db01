CREATE TABLE [dbo].[DivineInstruments] (
    [ID]                    INT           IDENTITY (1, 1) NOT NULL,
    [ArchetypeID]           INT           NULL,
    [CharacterID]           INT           NULL,
    [InstrumentName]        VARCHAR (64)  NOT NULL,
    [InstrumentDescription] VARCHAR (MAX) NOT NULL,
    [ReleaseDeclaration]    VARCHAR (MAX) NOT NULL,
    [ReleaseDescription]    VARCHAR (MAX) NOT NULL,
    [CreatedDate]           DATETIME      NULL,
    [LastModDate]           DATETIME      NULL,
    [CreatedUser]           VARCHAR (255) NULL,
    [LastModUser]           VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([ArchetypeID]) REFERENCES [dbo].[Archetypes] ([ID]),
    FOREIGN KEY ([CharacterID]) REFERENCES [dbo].[Characters] ([ID]),
    UNIQUE NONCLUSTERED ([InstrumentName] ASC)
);



