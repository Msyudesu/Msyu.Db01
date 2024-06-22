CREATE TABLE [dbo].[CharacterResistances] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Sturdiness]  INT           NOT NULL,
    [Fire]        INT           NOT NULL,
    [Water]       INT           NOT NULL,
    [Air]         INT           NOT NULL,
    [Earth]       INT           NOT NULL,
    [Electrical]  INT           NOT NULL,
    [Dark]        INT           NOT NULL,
    [Light]       INT           NOT NULL,
    [Void]        INT           NOT NULL,
    [Biological]  INT           NOT NULL,
    [CreatedDate] DATETIME      NULL,
    [LastModDate] DATETIME      NULL,
    [CreatedUser] VARCHAR (255) NULL,
    [LastModUser] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

