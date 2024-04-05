CREATE PROCEDURE dbo.DivineInstruments_SelectAll
    
AS

/******************************

Author:		Msyu
Date:		4/4/2024
Purpose:	Select all Divine Instruments

Parameters:	None

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
END