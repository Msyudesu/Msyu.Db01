CREATE TABLE [dbo].[HairColors] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [HairColor]        VARCHAR (50)  NOT NULL,
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
CREATE TRIGGER T_HairColors_Update  ON dbo.HairColors  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE HairColors    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.HairColors t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_HairColors_Insert  ON dbo.HairColors  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE HairColors    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.HairColors t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;