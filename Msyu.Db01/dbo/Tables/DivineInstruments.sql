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


GO
CREATE TRIGGER T_DivineInstruments_Update  ON dbo.DivineInstruments  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE DivineInstruments    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.DivineInstruments t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_DivineInstruments_Insert  ON dbo.DivineInstruments  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE DivineInstruments    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.DivineInstruments t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;