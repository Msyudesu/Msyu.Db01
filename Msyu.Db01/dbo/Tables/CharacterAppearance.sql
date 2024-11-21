CREATE TABLE [dbo].[CharacterAppearance] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [CharacterID]    INT           NOT NULL,
    [CharHeight]     INT           NOT NULL,
    [CharWeight]     INT           NOT NULL,
    [HairStyleID]    INT           NOT NULL,
    [HairColorID]    INT           NOT NULL,
    [EyeTypeID]      INT           NOT NULL,
    [EyeColorID]     INT           NOT NULL,
    [CommonClothing] VARCHAR (MAX) NOT NULL,
    [FormalClothing] VARCHAR (MAX) NOT NULL,
    [UniqueFeatures] VARCHAR (MAX) NOT NULL,
    [CreatedDate]    DATETIME      NULL,
    [LastModDate]    DATETIME      NULL,
    [CreatedUser]    VARCHAR (255) NULL,
    [LastModUser]    VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([CharacterID]) REFERENCES [dbo].[Characters] ([ID]),
    FOREIGN KEY ([EyeColorID]) REFERENCES [dbo].[EyeColors] ([ID]),
    FOREIGN KEY ([EyeTypeID]) REFERENCES [dbo].[EyeTypes] ([ID]),
    FOREIGN KEY ([HairColorID]) REFERENCES [dbo].[HairColors] ([ID]),
    FOREIGN KEY ([HairStyleID]) REFERENCES [dbo].[HairStyles] ([ID])
);


GO
CREATE TRIGGER T_CharacterAppearance_Update  ON dbo.CharacterAppearance  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterAppearance    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.CharacterAppearance t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_CharacterAppearance_Insert  ON dbo.CharacterAppearance  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE CharacterAppearance    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.CharacterAppearance t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;