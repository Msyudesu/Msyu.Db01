CREATE TABLE [dbo].[Characters] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]   VARCHAR (50)  NOT NULL,
    [LastName]    VARCHAR (50)  NOT NULL,
    [CreatedDate] DATETIME      NULL,
    [LastModDate] DATETIME      NULL,
    [CreatedUser] VARCHAR (255) NULL,
    [LastModUser] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE TRIGGER T_Characters_Update  ON dbo.Characters  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE Characters    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.Characters t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_Characters_Insert  ON dbo.Characters  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE Characters    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.Characters t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;