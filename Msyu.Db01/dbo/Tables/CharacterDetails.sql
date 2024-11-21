CREATE TABLE [dbo].[CharacterDetails] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [ChararcterID]  INT           NOT NULL,
    [CharStatus]    INT           NOT NULL,
    [CharHistory]   VARCHAR (MAX) NOT NULL,
    [FightingStyle] VARCHAR (MAX) NOT NULL,
    [Personality]   VARCHAR (MAX) NOT NULL,
    [CreatedDate]   DATETIME      NULL,
    [LastModDate]   DATETIME      NULL,
    [CreatedUser]   VARCHAR (255) NULL,
    [LastModUser]   VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([ChararcterID]) REFERENCES [dbo].[Characters] ([ID]),
    FOREIGN KEY ([CharStatus]) REFERENCES [dbo].[Statuses] ([ID])
);


GO
CREATE TRIGGER T_CharacterDetails_Update  ON dbo.CharacterDetails  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterDetails    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.CharacterDetails t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_CharacterDetails_Insert  ON dbo.CharacterDetails  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterDetails    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.CharacterDetails t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;