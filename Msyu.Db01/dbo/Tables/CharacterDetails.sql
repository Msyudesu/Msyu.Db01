CREATE TABLE [dbo].[CharacterDetails] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [ChararcterID]  INT           NOT NULL,
    [CharStatus]    INT           NOT NULL,
    [CharHistory]   VARCHAR (MAX) NOT NULL,
    [FightingStyle] VARCHAR (MAX) NOT NULL,
    [Personality]   VARCHAR (MAX) NOT NULL,
    [CreatedDate]   DATETIME      NULL,
    [LastModDate]   DATETIME      NULL,
    [CreatedUser]   VARCHAR (255) NULL,
    [LastModUser]   VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([ChararcterID]) REFERENCES [dbo].[Characters] ([ID]),
    FOREIGN KEY ([CharStatus]) REFERENCES [dbo].[Statuses] ([ID])
);

