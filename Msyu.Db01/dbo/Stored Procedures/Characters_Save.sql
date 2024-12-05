
CREATE PROCEDURE [dbo].[Characters_Save]
    @ID INT = NULL
    , @FirstName VARCHAR(50)
	, @LastName VARCHAR(50)
AS

/******************************

Author:		Msyu
Date:		12/05/2024
Purpose:	...

Parameters:	
    @ID - 
    @FirstName - 
	@LastName - 

Example:
	exec Characters_Save 
        @ID = 1
        , @Firstname = 'Test'
		, @LastName = 'Test'

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
		INTO #tmpCharacters 
		FROM dbo.Characters AS c
		WHERE c.ID = @ID

		IF @ID IS NULL
			INSERT 
			INTO dbo.Characters(FirstName, LastName) 
			VALUES (@FirstName, @LastName)
		ELSE
			UPDATE dbo.Characters
			SET 
				FirstName = ISNULL(@FirstName, c.FirstName)
				, LastName = ISNULL(@LastName, c.LastName)				
			FROM #tmpCharacters as c
			WHERE dbo.Characters.ID = @ID

      
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