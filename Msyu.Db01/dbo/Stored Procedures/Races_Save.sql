
CREATE PROCEDURE [dbo].[Races_Save]
    @ID INT = NULL
    , @FactionID INT = NULL
	, @RaceName VARCHAR(32) = NULL
	, @RaceDescription VARCHAR(MAX) = NULL
AS

/******************************

Author:		Msyu
Date:		12/04/2024
Purpose:	...

Parameters:	
    @ID - 
    @FactionID - 

Example:
	exec Races_Save 
        @ID = 
        , @FactionID = 

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
		INTO #tmpRaces
		FROM dbo.Races as r
		WHERE r.ID=@ID

		IF @ID IS NULL
			INSERT 
			INTO dbo.Races(FactionID, RaceName, RaceDescription) 
			VALUES (@FactionID, @RaceName, @RaceDescription)
		ELSE
			UPDATE dbo.Races
			SET 
				FactionID = ISNULL(@FactionID, r.FactionID)
				, RaceName = ISNULL(@RaceName, r.RaceName)
				, RaceDescription = ISNULL(@RaceDescription, r.RaceDescription)
			FROM #tmpRaces as r
			WHERE dbo.Races.ID = @ID
      
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