CREATE TABLE [dbo].[CharacterAppearance] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [CharacterID]    INT           NOT NULL,
    [CharHeight]     INT           NOT NULL,
    [CharWeight]     INT           NOT NULL,
    [HairStyle]      INT           NOT NULL,
    [HairColor]      INT           NOT NULL,
    [EyeType]        INT           NOT NULL,
    [EyeColor]       INT           NOT NULL,
    [CommonClothing] VARCHAR (MAX) NOT NULL,
    [FormalClothing] VARCHAR (MAX) NOT NULL,
    [UniqueFeatures] VARCHAR (MAX) NOT NULL,
    [CreatedDate]    DATETIME      NULL,
    [LastModDate]    DATETIME      NULL,
    [CreatedUser]    VARCHAR (255) NULL,
    [LastModUser]    VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([CharacterID]) REFERENCES [dbo].[Characters] ([ID]),
    FOREIGN KEY ([EyeColor]) REFERENCES [dbo].[EyeColors] ([ID]),
    FOREIGN KEY ([EyeType]) REFERENCES [dbo].[EyeTypes] ([ID]),
    FOREIGN KEY ([HairColor]) REFERENCES [dbo].[HairColors] ([ID]),
    FOREIGN KEY ([HairStyle]) REFERENCES [dbo].[HairStyles] ([ID])
);



