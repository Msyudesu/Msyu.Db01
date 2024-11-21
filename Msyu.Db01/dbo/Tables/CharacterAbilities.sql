CREATE TABLE [dbo].[CharacterAbilities] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [AbilityID]   INT           NULL,
    [CharacterID] INT           NOT NULL,
    [AbilityRank] INT           DEFAULT ((1)) NOT NULL,
    [CreatedDate] DATETIME      NULL,
    [LastModDate] DATETIME      NULL,
    [CreatedUser] VARCHAR (255) NULL,
    [LastModUser] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([AbilityID]) REFERENCES [dbo].[Abilities] ([ID]),
    FOREIGN KEY ([CharacterID]) REFERENCES [dbo].[Characters] ([ID])
);


GO
CREATE TRIGGER T_CharacterAbilities_Update  ON dbo.CharacterAbilities  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterAbilities    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.CharacterAbilities t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_CharacterAbilities_Insert  ON dbo.CharacterAbilities  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterAbilities    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.CharacterAbilities t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;