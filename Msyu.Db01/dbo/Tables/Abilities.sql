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


GO
CREATE TRIGGER T_Abilities_Update  ON dbo.Abilities  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE Abilities    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.Abilities t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_Abilities_Insert  ON dbo.Abilities  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE Abilities    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.Abilities t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;