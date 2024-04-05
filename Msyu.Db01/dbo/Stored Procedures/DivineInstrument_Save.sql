CREATE PROCEDURE [dbo].[DivineInstrument_Save] 
    @InstrumentID			INT = NULL
	,@InstrumentName		VARCHAR(64) = NULL
	,@InstrumentDescription TEXT = NULL
	,@ReleaseDeclaration	TEXT = NULL
	,@ReleaseDescription	TEXT = NULL
	,@InstrumentArchetype	INT = NULL
	,@InstrumentOwner		INT = NULL
AS

/******************************

Author:		Msyu
Date:		4/4/2024
Purpose:	Select Divine Instrument by ID	

Parameters:	Save new or Update existing (By ID) Divine Instrument

Example: 
	New Instrument
	exec dbo.DivineInstrument_Save
	,@InstrumentName=
	,@InstrumentDescription=
	,@ReleaseDeclaration=
	,@ReleaseDescription=
	,@InstrumentArchetype=
	,@InstrumentOwner=

	Update Description
	exec dbo.DivineInstrument_Save
	@InstrumentID=
	,@InstrumentDescription=

******************************/
BEGIN
   BEGIN
    IF @InstrumentID IS NOT NULL
		BEGIN
			SELECT * 
			INTO #tmpInstruments
			FROM dbo.DivineInstruments as di 
			WHERE di.ID=@InstrumentID
			
			UPDATE dbo.DivineInstruments
			SET
			InstrumentName			=	ISNULL(@InstrumentName, temp.InstrumentName)
			,InstrumentDescription	=	ISNULL(@InstrumentDescription, temp.InstrumentDescription)
			,ReleaseDeclaration		=	ISNULL(@ReleaseDeclaration, temp.ReleaseDeclaration)
			,ReleaseDescription		=	ISNULL(@ReleaseDescription, temp.ReleaseDescription)
			,InstrumentArchetype	=	ISNULL(@InstrumentArchetype, temp.InstrumentArchetype)
			,InstrumentOwner		=	ISNULL(@InstrumentOwner, temp.InstrumentOwner)
			FROM #tmpInstruments as temp
			WHERE dbo.DivineInstruments.ID = @InstrumentID
		END 
	ELSE
		BEGIN
			INSERT INTO dbo.DivineInstruments 
				(
				InstrumentName			
				,InstrumentDescription	
				,ReleaseDeclaration		
				,ReleaseDescription		
				,InstrumentArchetype	
				,InstrumentOwner		
				)
				VALUES
				(
				@InstrumentName			
				,@InstrumentDescription	
				,@ReleaseDeclaration		
				,@ReleaseDescription		
				,@InstrumentArchetype	
				,@InstrumentOwner
				)

		END
	END
END