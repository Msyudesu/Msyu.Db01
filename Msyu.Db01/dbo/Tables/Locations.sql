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



