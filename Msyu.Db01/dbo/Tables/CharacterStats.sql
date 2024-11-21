CREATE TABLE [dbo].[CharacterStats] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [CharacterID]  INT           NOT NULL,
    [Armor]        SMALLINT      NOT NULL,
    [Constition]   SMALLINT      NOT NULL,
    [Strength]     SMALLINT      NOT NULL,
    [Agility]      SMALLINT      NOT NULL,
    [Intelligence] SMALLINT      NOT NULL,
    [Dexterity]    SMALLINT      NOT NULL,
    [Max_Health]   INT           NOT NULL,
    [Max_Stamina]  INT           NOT NULL,
    [Max_Mana]     INT           NOT NULL,
    [CreatedDate]  DATETIME      NULL,
    [LastModDate]  DATETIME      NULL,
    [CreatedUser]  VARCHAR (255) NULL,
    [LastModUser]  VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([CharacterID]) REFERENCES [dbo].[Characters] ([ID])
);


GO
CREATE TRIGGER T_CharacterStats_Update  ON dbo.CharacterStats  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterStats    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.CharacterStats t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_CharacterStats_Insert  ON dbo.CharacterStats  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterStats    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.CharacterStats t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;