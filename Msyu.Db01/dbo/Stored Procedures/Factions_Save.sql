
CREATE PROCEDURE [dbo].[Factions_Save]
    @ID INT = NULL
	, @LocationID INT = NULL
    , @FactionName VARCHAR(64) = NULL
	, @FactionDescription VARCHAR(MAX) = NULL
AS

/******************************

Author:		Msyu
Date:		12/04/2024
Purpose:	...

Parameters:	
    @ID - 
    @FactionName - 
	@FactionDescription - 

Example:
	exec Factions_Save 
        @ID = 1
        ,  @FactionName = 'test'
		, @FactionDescription = 'test'

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
        SELECT *
		INTO #tmpFactions
		FROM dbo.Factions as f
		WHERE f.ID=@ID

		IF @ID IS NULL
			INSERT 
			INTO dbo.Factions(LocationID, FactionName, FactionDescription) 
			VALUES (@LocationID, @FactionName, @FactionDescription)
		ELSE
			UPDATE dbo.Factions
			SET 
				LocationID = ISNULL(@LocationID, f.LocationID)
				, FactionName = ISNULL(@FactionName, f.FactionName)
				, FactionDescription = ISNULL(@FactionDescription, f.FactionDescription)
			FROM #tmpFactions as f
			WHERE dbo.Factions.ID = @ID
      
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