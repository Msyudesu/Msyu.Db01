CREATE TABLE [dbo].[CharacterStatus] (
    [ID]         INT          IDENTITY (1, 1) NOT NULL,
    [CharStatus] VARCHAR (16) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([CharStatus] ASC)
);

