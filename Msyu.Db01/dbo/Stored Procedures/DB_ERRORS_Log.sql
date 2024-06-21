CREATE PROCEDURE [dbo].[DB_ERRORS_Log]
	@Severity		VARCHAR(MAX)
	, @Message		VARCHAR(MAX)    
    , @State		VARCHAR(MAX)
	, @TimeOfError	DATETIME
	, @DbUser		VARCHAR(255)
	, @StoredProc	VARCHAR(255)
AS

/******************************

Author:		Msyu
Date:		06/20/2024
Purpose:	Error Log for Stored Procedures

Parameters:	
	@Severity			VARCHAR(MAX)
	, @Message			VARCHAR(MAX)    
    , @State			VARCHAR(MAX)
	, @TimeOfError		DATETIME
	, @DbUser			VARCHAR
	, @StoredProc		VARCHAR

Example:
	exec [dbo].[DB_ERRORS_Log]
		, @Severity			=	@ErrorSeverity
		, @Message			=	@ErrorMessage
		, @State			=	@ErrorState
		, @TimeOfError		=	GETDATE()
		, @DbUser			=	SUSER_NAME()
		, @StoredProc		=	OBJECT_NAME(@@PROCID)

******************************/
BEGIN
    SET NOCOUNT ON;
    
    -- Declare variables for error handling
    DECLARE @ErrorMessage	NVARCHAR(4000),
            @ErrorSeverity	INT,
            @ErrorState		INT;

    -- Start a transaction
    BEGIN TRANSACTION;
    
    BEGIN TRY
        INSERT INTO dbo.DB_ERRORS (
			ErrorSeverity
			, ErrorMessage
			, ErrorState
			, TimeOfError
			, DbUser
			, StoredProc
		)
		VALUES (
			@Severity
			, @Message
			, @State
			, ISNULL(@TimeOfError, GETDATE())
			, @DbUser
			, @StoredProc
			)

        -- If everything is successful, commit the transaction
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurs
        ROLLBACK TRANSACTION;

        -- Retrieve error information
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;