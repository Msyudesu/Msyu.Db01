CREATE TABLE [dbo].[CharacterAppearance] (
    [ID]             INT          IDENTITY (1, 1) NOT NULL,
    [CharacterID]    INT          NOT NULL,
    [CharHeight]     INT          NOT NULL,
    [CharWeight]     INT          NOT NULL,
    [HairStyle]      VARCHAR (32) NOT NULL,
    [HairColor]      VARCHAR (32) NOT NULL,
    [EyeType]        VARCHAR (32) NOT NULL,
    [EyeColor]       VARCHAR (32) NOT NULL,
    [CommonClothing] TEXT         NOT NULL,
    [FormalClothing] TEXT         NOT NULL,
    [UniqueFeatures] TEXT         NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([CharacterID]) REFERENCES [dbo].[Characters] ([ID])
);

