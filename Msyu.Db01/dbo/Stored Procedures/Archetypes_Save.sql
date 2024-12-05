CREATE PROCEDURE [dbo].[Archetypes_Save]
    @ID INT = NULL
    , @ArchetypeName VARCHAR(32)
	, @ArchetypeDescription VARCHAR(MAX)
AS

/******************************

Author:		Msyu
Date:		12/05/2024
Purpose:	...

Parameters:	
    @ID - 
    , @ArchetypeName - 
	, @ArchetypeDescription -

Example:
	exec Archetypes_Save 
        @ID = 1
        , @ArchetypeName = 'Test'
		, @ArchetypeDescription = 'Test'

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
		INTO #tmpArchetypes
		FROM dbo.Archetypes as a
		WHERE a.ID=@ID
        
		IF @ID IS NULL
			INSERT 
			INTO dbo.Archetypes(ArchetypeName, ArchetypeDescription) 
			VALUES (@ArchetypeName, @ArchetypeDescription)
		ELSE
			UPDATE dbo.Archetypes
			SET 
				ArchetypeName = ISNULL(@ArchetypeName, a.ArchetypeName)
				, ArchetypeDescription = ISNULL(@ArchetypeDescription, a.ArchetypeDescription)
			FROM #tmpArchetypes as a
			WHERE dbo.Archetypes.ID = @ID
      
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