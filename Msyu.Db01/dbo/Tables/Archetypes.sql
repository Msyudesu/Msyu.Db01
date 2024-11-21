CREATE TABLE [dbo].[Archetypes] (
    [ID]                   INT           IDENTITY (1, 1) NOT NULL,
    [ArchetypeName]        VARCHAR (32)  NOT NULL,
    [ArchetypeDescription] VARCHAR (MAX) NOT NULL,
    [CreatedDate]          DATETIME      NULL,
    [LastModDate]          DATETIME      NULL,
    [CreatedUser]          VARCHAR (255) NULL,
    [LastModUser]          VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([ArchetypeName] ASC)
);


GO
CREATE TRIGGER T_Archetypes_Update  ON dbo.Archetypes  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE Archetypes    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.Archetypes t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_Archetypes_Insert  ON dbo.Archetypes  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE Archetypes    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.Archetypes t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;