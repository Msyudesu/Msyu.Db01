CREATE PROCEDURE dbo.Characters_SelectID
    @CharacterID int = 0 
AS
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
		,stat.Strength, stat.Constition, stat.Dexterity, stat.Agility, stat.Armor, stat.Intelligence, stat.Max_Health, stat.Max_Mana, stat.Max_Stamina
		,stat.Air_Resistance, stat.Biological_Resistance, stat.Dark_Resistance, stat.Earth_Resistance, stat.Electrical_Resistance, stat.Fire_Resistance, stat.Light_Resistance, stat.Void_Resistance, stat.Water_Resistance
	FROM dbo.Characters as ch
		LEFT JOIN dbo.CharacterAppearance as chapp on chapp.CharacterID = ch.ID
		LEFT JOIN dbo.CharacterStats as stat on stat.CharacterID = ch.ID
		LEFT JOIN dbo.Factions as f on f.ID = ch.Faction
		LEFT JOIN dbo.Races as r on r.ID = ch.Race
		LEFT JOIN dbo.Archetypes as arc on arc.ID = ch.Archetype
	WHERE ch.ID = @CharacterID

END