CREATE TABLE [dbo].[Locations] (
    [ID]                  INT           IDENTITY (1, 1) NOT NULL,
    [ContinentID]         INT           NULL,
    [LocationName]        VARCHAR (32)  NOT NULL,
    [LocationDescription] VARCHAR (MAX) NOT NULL,
    [CreatedDate]         DATETIME      NULL,
    [LastModDate]         DATETIME      NULL,
    [CreatedUser]         VARCHAR (255) NULL,
    [LastModUser]         VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([ContinentID]) REFERENCES [dbo].[Continents] ([ID]),
    UNIQUE NONCLUSTERED ([LocationName] ASC)
);


GO
CREATE TRIGGER T_Locations_Update  ON dbo.Locations  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE Locations    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.Locations t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_Locations_Insert  ON dbo.Locations  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE Locations    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.Locations t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;