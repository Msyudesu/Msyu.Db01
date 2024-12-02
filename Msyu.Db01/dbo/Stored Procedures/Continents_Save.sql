
CREATE PROCEDURE [dbo].[Continents_Save]
    @ID	INT = NULL,
	@ContinentName VARCHAR(32) = NULL,
    @ContinentDescription VARCHAR(MAX) = NULL
AS

/******************************

Author:		Msyu
Date:		11/21/2024
Purpose:	Insert or update continents

Parameters:	
    @ID						- Continent ID, if left NULL, will insert.
	@ContinentName			- Name of the continent, must be unique
    @ContinentDescription	- Descriptive information about the continent

Example:
	exec Continents_Save 
        @ContinentName = 'Ven Gebyr'
        , @ContinentDescription = 'The first continent discovered by man'

		exec Continents_Save 
		@ID = 1        
        , @ContinentDescription = 'The first continent discovered by man.'

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
		INTO #tmpContinents
		FROM dbo.Continents as c
		WHERE c.ID=@ID
        
		IF @ID IS NULL
			INSERT 
			INTO dbo.Continents (ContinentName, ContinentDescription) 
			VALUES (@ContinentName, @ContinentDescription)
		ELSE
			UPDATE dbo.Continents
			SET 
				ContinentName = ISNULL(@ContinentName, c.ContinentName)
				, ContinentDescription = ISNULL(@ContinentDescription, c.ContinentDescription)
			FROM #tmpContinents as c
			WHERE dbo.Continents.ID = @ID
			
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