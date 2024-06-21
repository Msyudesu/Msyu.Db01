
CREATE PROCEDURE [dbo].[DivineInstruments_Select]
    @InstrumentID INT = NULL
AS

/******************************

Author:		Msyu
Date:		06/20/2024
Purpose:	Select All Divine Instruments or One by ID

Parameters:	
    @InstrumentID - ID

Example:
	exec DivineInstruments_Select 
        @InstrumentID = 1

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
        IF @InstrumentID IS NOT NULL
		BEGIN
			SELECT
				di.InstrumentName
				,di.InstrumentDescription
				,di.ReleaseDeclaration
				,arc.ArchetypeName
				,(CONCAT(ch.FirstName, ' ', ch.LastName))
			FROM dbo.DivineInstruments as di
				left join dbo.Archetypes as arc on arc.ID = di.InstrumentArchetype
				left join dbo.Characters as ch on ch.ID = di.InstrumentOwner
			WHERE di.ID = @InstrumentID
		END
		ELSE
		BEGIN
			SELECT
				di.InstrumentName
				,di.InstrumentDescription
				,di.ReleaseDeclaration
				,arc.ArchetypeName
				,(CONCAT(ch.FirstName, ' ', ch.LastName))
			FROM dbo.DivineInstruments as di
				LEFT JOIN dbo.Archetypes as arc on arc.ID = di.InstrumentArchetype
				LEFT JOIN dbo.Characters as ch on ch.ID = di.InstrumentOwner
		END
      
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