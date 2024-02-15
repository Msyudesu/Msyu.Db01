CREATE TABLE [dbo].[DivineInstruments] (
    [ID]                    INT          IDENTITY (1, 1) NOT NULL,
    [InstrumentName]        VARCHAR (64) NOT NULL,
    [InstrumentDescription] TEXT         NOT NULL,
    [ReleaseDeclaration]    TEXT         NOT NULL,
    [ReleaseDescription]    TEXT         NOT NULL,
    [InstrumentArchetype]   INT          NULL,
    [InstrumentOwner]       INT          NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([InstrumentArchetype]) REFERENCES [dbo].[Archetypes] ([ID]),
    FOREIGN KEY ([InstrumentOwner]) REFERENCES [dbo].[Characters] ([ID]),
    UNIQUE NONCLUSTERED ([InstrumentName] ASC)
);

