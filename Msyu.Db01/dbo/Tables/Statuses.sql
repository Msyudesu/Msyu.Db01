CREATE TABLE [dbo].[Statuses] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [CharacterStatus]   VARCHAR (32)  NOT NULL,
    [StatusDescription] VARCHAR (MAX) NULL,
    [CreatedDate]       DATETIME      NULL,
    [LastModDate]       DATETIME      NULL,
    [CreatedUser]       VARCHAR (255) NULL,
    [LastModUser]       VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([CharacterStatus] ASC)
);


GO
CREATE TRIGGER T_Statuses_Update  ON dbo.Statuses  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE Statuses    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.Statuses t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_Statuses_Insert  ON dbo.Statuses  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE Statuses    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.Statuses t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;