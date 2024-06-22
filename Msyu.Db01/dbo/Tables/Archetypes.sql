CREATE TABLE [dbo].[Archetypes] (
    [ID]                   INT           IDENTITY (1, 1) NOT NULL,
    [ArchetypeName]        VARCHAR (32)  NOT NULL,
    [ArchetypeDescription] VARCHAR (MAX) NOT NULL,
    [CreatedDate]          DATETIME      NULL,
    [LastModDate]          DATETIME      NULL,
    [CreatedUser]          VARCHAR (255) NULL,
    [LastModUser]          VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([ArchetypeName] ASC)
);



