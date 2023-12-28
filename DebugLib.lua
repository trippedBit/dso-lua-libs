---------------------------------
-- Debugging lua library
-- Copyright (c) 2023 trippedBit
---------------------------------

---------------------------------------------------------------------------------
-- Shows the provided message as info text (top center) if debug mode is enabled.
-- pText: String ID in user_strings.res
-- pReplacement: Replacement string ID in user_strings.res
---------------------------------------------------------------------------------
DebugMessage = function(pText, pReplacement)
	if "true" == MissionLib.GetChapterState("DebugModeSwitchENABLE", 1) then
		if (pReplacement ~= nil) then
			NGUI.ShowInfoText({
				Text = pText,
				Replace = {pReplacement}})
		else
			NGUI.ShowInfoText({Text = pText})
		end
	end
	return nil
end