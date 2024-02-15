CREATE PROCEDURE dbo.CharacterStats_Save
	@CharacterID			int = NULL
    ,@Armor					smallint = NULL
	,@Constitution			smallint = NULL
	,@Strength				smallint = NULL
	,@Agility				smallint = NULL
	,@Intelligence			smallint = NULL
	,@Dexterity				smallint = NULL
	,@Max_Health			int = NULL
	,@Max_Stamina			int	= NULL
	,@Max_Mana				int	= NULL
	,@Sturdiness			int	= NULL
	,@Fire_Resistance		int	= NULL
	,@Water_Resistance		int	= NULL
	,@Air_Resistance		int	= NULL
	,@Earth_Resistance		int	= NULL
	,@Electrical_Resistance	int	= NULL
	,@Dark_Resistance		int	= NULL
	,@Light_Resistance		int	= NULL
	,@Void_Resistance		int	= NULL
	,@Biological_Resistance	int	= NULL
AS

/******************************

Author:		Msyu
Date:		02-14-2024
Purpose:	Save character attributes (existing or new) 

Parameters:	

******************************/
BEGIN
    IF @CharacterID IS NOT NULL
		BEGIN
			SELECT * 
			INTO #tmpStats
			FROM dbo.CharacterStats as cs 
			WHERE cs.CharacterID=@CharacterID
			
			UPDATE dbo.CharacterStats
			SET	
			CharacterID			=	@CharacterID			
			,Armor					=	ISNULL(@Armor, st.Armor)			
			,Constitution			=	ISNULL(@Constitution, st.Constitution)				
			,Strength				=	ISNULL(@Strength, st.Strength)
			,Agility				=	ISNULL(@Agility, st.Agility)
			,Intelligence			=	ISNULL(@Intelligence, st.Intelligence)		
			,Dexterity				=	ISNULL(@Dexterity, st.Dexterity)
			,Max_Health				=	ISNULL(@Max_Health, st.Max_Health)
			,Max_Stamina			=	ISNULL(@Max_Stamina, st.Max_Stamina)
			,Max_Mana				=	ISNULL(@Max_Mana, st.Max_Mana)
			,Sturdiness				=	ISNULL(@Sturdiness, st.Sturdiness)
			,Fire_Resistance		=	ISNULL(@Fire_Resistance, st.Fire_Resistance)
			,Water_Resistance		=	ISNULL(@Water_Resistance, st.Water_Resistance)
			,Air_Resistance			=	ISNULL(@Air_Resistance, st.Air_Resistance)
			,Earth_Resistance		=	ISNULL(@Earth_Resistance, st.Earth_Resistance)
			,Electrical_Resistance	=	ISNULL(@Electrical_Resistance, st.Electrical_Resistance)
			,Dark_Resistance		=	ISNULL(@Dark_Resistance, st.Dark_Resistance)
			,Light_Resistance		=	ISNULL(@Light_Resistance, st.Light_Resistance)
			,Void_Resistance		=	ISNULL(@Void_Resistance, st.Void_Resistance)
			,Biological_Resistance	=	ISNULL(@Biological_Resistance, st.Biological_Resistance)
			FROM #tmpStats as st
			WHERE dbo.CharacterStats.CharacterID = @CharacterID
		END 
	ELSE
		BEGIN
			INSERT INTO dbo.CharacterStats 
				(CharacterID						
				,Armor					
				,Constitution			
				,Strength				
				,Agility				
				,Intelligence			
				,Dexterity				
				,Max_Health				
				,Max_Stamina			
				,Max_Mana				
				,Sturdiness				
				,Fire_Resistance		
				,Water_Resistance		
				,Air_Resistance			
				,Earth_Resistance		
				,Electrical_Resistance
				,Dark_Resistance		
				,Light_Resistance		
				,Void_Resistance		
				,Biological_Resistance)
				VALUES(@CharacterID			
					   ,@Armor					
					   ,@Constitution			
					   ,@Strength				
					   ,@Agility				
					   ,@Intelligence			
					   ,@Dexterity				
					   ,@Max_Health			
					   ,@Max_Stamina			
					   ,@Max_Mana				
					   ,@Sturdiness			
					   ,@Fire_Resistance		
					   ,@Water_Resistance		
					   ,@Air_Resistance		
					   ,@Earth_Resistance		
					   ,@Electrical_Resistance
					   ,@Dark_Resistance		
					   ,@Light_Resistance		
					   ,@Void_Resistance		
					   ,@Biological_Resistance)

		END
	END