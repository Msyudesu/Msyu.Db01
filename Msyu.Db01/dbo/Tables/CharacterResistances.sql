CREATE TABLE [dbo].[CharacterResistances] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [CharacterID] INT           NOT NULL,
    [Sturdiness]  INT           NOT NULL,
    [Fire]        INT           NOT NULL,
    [Water]       INT           NOT NULL,
    [Air]         INT           NOT NULL,
    [Earth]       INT           NOT NULL,
    [Electrical]  INT           NOT NULL,
    [Dark]        INT           NOT NULL,
    [Light]       INT           NOT NULL,
    [Void]        INT           NOT NULL,
    [Biological]  INT           NOT NULL,
    [CreatedDate] DATETIME      NULL,
    [LastModDate] DATETIME      NULL,
    [CreatedUser] VARCHAR (255) NULL,
    [LastModUser] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([CharacterID]) REFERENCES [dbo].[Characters] ([ID])
);


GO
CREATE TRIGGER T_CharacterResistances_Update  ON dbo.CharacterResistances  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterResistances    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.CharacterResistances t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_CharacterResistances_Insert  ON dbo.CharacterResistances  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterResistances    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.CharacterResistances t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;