CREATE TABLE [dbo].[EyeColors] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [EyeColor]         VARCHAR (50)  NOT NULL,
    [RedVal]           SMALLINT      NULL,
    [GreenVal]         SMALLINT      NULL,
    [BlueVal]          SMALLINT      NULL,
    [ColorDescription] VARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME      NULL,
    [LastModDate]      DATETIME      NULL,
    [CreatedUser]      VARCHAR (255) NULL,
    [LastModUser]      VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

