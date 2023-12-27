---------------------------------
-- Debugging lua library
-- Copyright (c) 2023 trippedBit
---------------------------------

---------------------------------------------------------------------------------
-- Shows the provided message as info text (top center) if debug mode is enabled.
-- pText: String ID in user_strings.res
---------------------------------------------------------------------------------
DebugMessage = function(pText)
	if "true" == MissionLib.GetChapterState("DebugModeSwitchENABLE", 1) then
		NGUI.ShowInfoText({Text=pText})
	end
	return nil
end