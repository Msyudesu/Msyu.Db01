
CREATE PROCEDURE [dbo].[Locations_Select]
    @ID INT = NULL
	, @ContinentID INT = NULL
AS

/******************************

Author:		Msyu
Date:		12/02/2024
Purpose:	

Parameters:	
    @ID
	@ContinentID - Select all by continent

Example:
	exec Locations_Select @ID = 1
	exec Locations_Select @ContinentID = 1

******************************/
BEGIN
    SET NOCOUNT ON;
    
    -- Declare variables for error handling
    DECLARE 
        @ErrorMessage NVARCHAR(MAX)
        , @ErrorSeverity INT
        , @ErrorState INT
        , @user VARCHAR(255)
		, @proc VARCHAR(255)
	    , @date DATETIME

    SET @user = (SELECT SUSER_NAME())
    SET @proc = (SELECT OBJECT_NAME(@@PROCID))
    SET @date = GETDATE()

    -- Start a transaction
    BEGIN TRANSACTION;
    
    BEGIN TRY
		IF @ContinentID IS NOT NULL
			SELECT *
			FROM dbo.Locations as l
			WHERE l.ContinentID = @ContinentID
        ELSE IF @ID IS NOT NULL
			SELECT * 
			FROM dbo.Locations as l
			WHERE l.ID = @ID
		ELSE
			SELECT *
			FROM dbo.Locations
      
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

        -- Log the error or take necessary actions
        exec dbo.DB_ERRORS_Log
	        @Severity		= @ErrorSeverity
	        , @Message		= @ErrorMessage
	        , @State		= @ErrorState
	        , @TimeOfError	= @date
	        , @DbUser		= @user
	        , @StoredProc	= @proc

        -- Raise the error again to be handled by the calling process if needed
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;