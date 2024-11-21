CREATE TABLE [dbo].[EyeColors] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [EyeColor]         VARCHAR (50)  NOT NULL,
    [RedVal]           SMALLINT      NULL,
    [GreenVal]         SMALLINT      NULL,
    [BlueVal]          SMALLINT      NULL,
    [ColorDescription] VARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME      NULL,
    [LastModDate]      DATETIME      NULL,
    [CreatedUser]      VARCHAR (255) NULL,
    [LastModUser]      VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE TRIGGER T_EyeColors_Update  ON dbo.EyeColors  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE EyeColors    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.EyeColors t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_EyeColors_Insert  ON dbo.EyeColors  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE EyeColors    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.EyeColors t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;