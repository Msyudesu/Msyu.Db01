CREATE TABLE [dbo].[Continents] (
    [ID]                   INT           IDENTITY (1, 1) NOT NULL,
    [ContinentName]        VARCHAR (32)  NOT NULL,
    [ContinentDescription] VARCHAR (MAX) NOT NULL,
    [CreatedDate]          DATETIME      NULL,
    [LastModDate]          DATETIME      NULL,
    [CreatedUser]          VARCHAR (255) NULL,
    [LastModUser]          VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([ContinentName] ASC)
);


GO

CREATE TRIGGER T_Continents_Update
ON dbo.Continents
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Continents
    SET 
        LastModDate = GETDATE(),
        LastModUser = SYSTEM_USER
    FROM 
        dbo.Continents c
    INNER JOIN 
        INSERTED I ON c.ID = I.ID;

    -- Replace PrimaryKeyColumn with the actual primary key of your table
END;
GO
CREATE TRIGGER T_Continents_Insert
ON dbo.Continents
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Continents
    SET 
        CreatedDate = GETDATE(),
        CreatedUser = SYSTEM_USER
    FROM 
        dbo.Continents c
    INNER JOIN 
        INSERTED I ON c.ID = I.ID;

    -- Replace PrimaryKeyColumn with the actual primary key of your table
END;