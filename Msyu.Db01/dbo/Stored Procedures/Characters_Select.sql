
CREATE PROCEDURE [dbo].[Characters_Select]
    @CharacterID INT = NULL
AS

/******************************

Author:		Msyu
Date:		02/14/2024
Purpose:	Retrieve characters, either all or by ID

Parameters:	
    @CharacterID - ID

Example:
	exec Characters_Select 
        @CharacterID = 1

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
        IF @CharacterID IS NOT NULL
			BEGIN
				SELECT
					(CONCAT(ch.FirstName, ' ', ch.LastName)) as 'Name'
					,ch.Age
					,ch.DateOfBirth
					,ch.Gender
					,ch.CharHistory as 'History'
					,ch.FightingStyle
					,ch.Personality
					,f.FactionName as 'Faction'
					,r.RaceName as 'Race'
					,chapp.CharHeight as 'Height',chapp.CharWeight as 'Weight',chapp.HairColor ,chapp.HairStyle, chapp.EyeType, chapp.EyeColor, chapp.CommonClothing, chapp.FormalClothing, chapp.UniqueFeatures
					,stat.Strength, stat.Constitution, stat.Dexterity, stat.Agility, stat.Armor, stat.Intelligence, stat.Max_Health, stat.Max_Mana, stat.Max_Stamina
					,stat.Air_Resistance, stat.Biological_Resistance, stat.Dark_Resistance, stat.Earth_Resistance, stat.Electrical_Resistance, stat.Fire_Resistance, stat.Light_Resistance, stat.Void_Resistance, stat.Water_Resistance
				FROM dbo.Characters as ch
					LEFT JOIN dbo.CharacterAppearance as chapp on chapp.CharacterID = ch.ID
					LEFT JOIN dbo.CharacterStats as stat on stat.CharacterID = ch.ID
					LEFT JOIN dbo.Factions as f on f.ID = ch.Faction
					LEFT JOIN dbo.Races as r on r.ID = ch.Race
					LEFT JOIN dbo.Archetypes as arc on arc.ID = ch.Archetype
				WHERE ch.ID = @CharacterID
			END
		ELSE
			BEGIN
				SELECT
					(CONCAT(ch.FirstName, ' ', ch.LastName)) as 'Name'
					,ch.Age
					,ch.DateOfBirth
					,ch.Gender
					,ch.CharHistory as 'History'
					,ch.FightingStyle
					,ch.Personality
					,f.FactionName as 'Faction'
					,r.RaceName as 'Race'
					,chapp.CharHeight as 'Height',chapp.CharWeight as 'Weight',chapp.HairColor ,chapp.HairStyle, chapp.EyeType, chapp.EyeColor, chapp.CommonClothing, chapp.FormalClothing, chapp.UniqueFeatures
					,stat.Strength, stat.Constitution, stat.Dexterity, stat.Agility, stat.Armor, stat.Intelligence, stat.Max_Health, stat.Max_Mana, stat.Max_Stamina
					,stat.Air_Resistance, stat.Biological_Resistance, stat.Dark_Resistance, stat.Earth_Resistance, stat.Electrical_Resistance, stat.Fire_Resistance, stat.Light_Resistance, stat.Void_Resistance, stat.Water_Resistance
				FROM dbo.Characters as ch
					LEFT JOIN dbo.CharacterAppearance as chapp on chapp.CharacterID = ch.ID
					LEFT JOIN dbo.CharacterStats as stat on stat.CharacterID = ch.ID
					LEFT JOIN dbo.Factions as f on f.ID = ch.Faction
					LEFT JOIN dbo.Races as r on r.ID = ch.Race
					LEFT JOIN dbo.Archetypes as arc on arc.ID = ch.Archetype
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