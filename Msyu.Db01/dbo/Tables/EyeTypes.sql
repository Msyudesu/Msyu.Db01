CREATE TABLE [dbo].[EyeTypes] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [EyeName]        VARCHAR (50)  NULL,
    [EyeDescription] VARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME      NULL,
    [LastModDate]    DATETIME      NULL,
    [CreatedUser]    VARCHAR (255) NULL,
    [LastModUser]    VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE TRIGGER T_EyeTypes_Update  ON dbo.EyeTypes  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE EyeTypes    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.EyeTypes t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_EyeTypes_Insert  ON dbo.EyeTypes  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE EyeTypes    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.EyeTypes t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;