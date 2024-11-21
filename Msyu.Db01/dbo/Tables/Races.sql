CREATE TABLE [dbo].[Races] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [FactionID]       INT           NULL,
    [RaceName]        VARCHAR (32)  NOT NULL,
    [RaceDescription] VARCHAR (MAX) NOT NULL,
    [CreatedDate]     DATETIME      NULL,
    [LastModDate]     DATETIME      NULL,
    [CreatedUser]     VARCHAR (255) NULL,
    [LastModUser]     VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([FactionID]) REFERENCES [dbo].[Factions] ([ID]),
    UNIQUE NONCLUSTERED ([RaceName] ASC)
);


GO
CREATE TRIGGER T_Races_Update  ON dbo.Races  AFTER UPDATE  AS  BEGIN       SET NOCOUNT ON;        UPDATE Races    SET        LastModDate = GETDATE()        , LastModUser = SYSTEM_USER    FROM        dbo.Races t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;
GO
CREATE TRIGGER T_Races_Insert  ON dbo.Races  AFTER INSERT  AS  BEGIN       SET NOCOUNT ON;        UPDATE Races    SET        CreatedDate = GETDATE()        , CreatedUser = SYSTEM_USER    FROM        dbo.Races t    INNER JOIN        INSERTED I ON t.ID = I.ID;END;