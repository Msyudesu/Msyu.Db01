CREATE TABLE [dbo].[DB_ERRORS] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [ErrorSeverity] VARCHAR (MAX) NULL,
    [ErrorMessage]  VARCHAR (MAX) NULL,
    [ErrorState]    VARCHAR (MAX) NULL,
    [TimeOfError]   DATETIME      NULL,
    [DbUser]        VARCHAR (255) NULL,
    [StoredProc]    VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

