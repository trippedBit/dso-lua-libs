---------------------------------
-- Debugging lua library
-- Copyright (c) 2023 trippedBit
---------------------------------

import "string"

DL = {}  -- Table for this lib

---------------------------------------------------------------------------------
-- Shows the provided message as info text (top center) if debug mode is enabled.
-- pText: String ID in user_strings.res
-- pReplacement: Table of replacement string IDs in user_strings.res
---------------------------------------------------------------------------------
DL.ShowMessage = function(pText, pReplacement)
	if "true" == MissionLib.GetChapterState("DebugModeSwitchENABLE", 1) then
		if (pReplacement ~= nil) then
			NGUI.ShowInfoText({
				Text = pText,
				Replace = pReplacement
			})
		else
			NGUI.ShowInfoText({Text = pText})
		end
	end
	return nil
end

---------------------------------------------------------------------------------
-- Returns varToCheck's data type as string.
-- varToCheck: Parameter to check
---------------------------------------------------------------------------------
DL.GetType = function(varToCheck)
	local dataType = lua.type(varToCheck)
	return string.toupper(dataType)
end

---------------------------------------------------------------------------------
-- Shows the datatype of the provided game logic string.
-- sLogicData: Game logic string, e.g. "Logic.PlayerShip"
---------------------------------------------------------------------------------
DL.ShowDataType = function(sLogicData)
	local logicData = get(sLogicData)
	local dataType = DL.GetType(logicData)

	NGUI.ShowInfoText({
		Text = "ID_DATATYPE",
		Replace = { "ID_DATATYPE_"..dataType }
	})
	return nil
end