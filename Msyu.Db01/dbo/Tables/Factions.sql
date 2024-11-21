CREATE TABLE [dbo].[Factions] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [LocationID]         INT           NULL,
    [FactionName]        VARCHAR (64)  NOT NULL,
    [FactionDescription] VARCHAR (MAX) NOT NULL,
    [CreatedDate]        DATETIME      NULL,
    [LastModDate]        DATETIME      NULL,
    [CreatedUser]        VARCHAR (255) NULL,
    [LastModUser]        VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([LocationID]) REFERENCES [dbo].[Locations] ([ID]),
    UNIQUE NONCLUSTERED ([FactionName] ASC)
);


GO
CREATE TRIGGER T_Factions_Update  ON dbo.Factions  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE Factions    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.Factions t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_Factions_Insert  ON dbo.Factions  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE Factions    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.Factions t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;