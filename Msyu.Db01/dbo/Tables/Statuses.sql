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

