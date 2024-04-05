CREATE PROCEDURE dbo.DivineInstruments_SelectID
    @InstrumentID INT

AS

/******************************

Author:		Msyu
Date:		4/4/2024
Purpose:	Select Divine Instrument by ID

Parameters:	@InstrumentID

Sample:  exec dbo.DivineInstruments_SelectID @InstrumentID = 2

******************************/
BEGIN
    select
		di.InstrumentName
		,di.InstrumentDescription
		,di.ReleaseDeclaration
		,arc.ArchetypeName
		,(CONCAT(ch.FirstName, ' ', ch.LastName))
	from dbo.DivineInstruments as di
		left join dbo.Archetypes as arc on arc.ID = di.InstrumentArchetype
		left join dbo.Characters as ch on ch.ID = di.InstrumentOwner
	where di.ID = @InstrumentID
END