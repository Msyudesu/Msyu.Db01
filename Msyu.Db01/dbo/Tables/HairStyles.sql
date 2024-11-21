CREATE TABLE [dbo].[HairStyles] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [StyleName]        VARCHAR (50)  NULL,
    [StyleDescription] VARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME      NULL,
    [LastModDate]      DATETIME      NULL,
    [CreatedUser]      VARCHAR (255) NULL,
    [LastModUser]      VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE TRIGGER T_HairStyles_Update  ON dbo.HairStyles  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE HairStyles    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.HairStyles t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_HairStyles_Insert  ON dbo.HairStyles  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE HairStyles    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.HairStyles t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;