---------------------------------
-- Lua function library
-- Copyright (c) 2024 trippedBit
---------------------------------

import "math"
import "string"

FL = {}  -- Table for common function

---------------------------------------------------------------------------------
-- Shows the provided string, NOT a string from user_strings.xml
-- text: String, e.g. "Hi there"
--		 No length limitation but the string will be split in chunks of 9 chars.
-- headerID: Optional header ID to show from user_strings.xml.
--			 The header must provided 9 replacements. 
---------------------------------------------------------------------------------
FL.ShowDynamicString = function(text, headerID)
	local length = string.length(text)
	local displaysNeeded = lua.tonumber(math.ceil(length / 9.0))
	
	local startIndex = 0
	local endIndex = 9
	if length < endIndex then
		endIndex = length
	end

	for part = 1, displaysNeeded do
		local stringTable = {}
		for i = startIndex, endIndex - 1 do
			local currentChar = string.substr(text, i, 1)
			if currentChar >= "0" and currentChar <= "9" then
				stringTable[i+1] = "ID_NUM_"..currentChar
			elseif currentChar >= "A" and currentChar <= "Z" then
				stringTable[i+1] = "ID_CHAR_"..currentChar
			elseif currentChar >= "a" and currentChar <= "z" then
				stringTable[i+1] = "ID_CHAR_LOWER_"..string.toupper(currentChar)
			elseif currentChar == " " then
				stringTable[i+1] = "ID_CHAR_SPACE"
			elseif currentChar == "." then
				stringTable[i+1] = "ID_CHAR_PERIOD"
			elseif currentChar == "!" then
				stringTable[i+1] = "ID_CHAR_EXCLAMATION_MARK"
			elseif currentChar == "?" then
				stringTable[i+1] = "ID_CHAR_QUESTION_MARK"
			end
		end

		stringTableSize = lua.sizeof(stringTable)
		if stringTableSize < 9 then
			for i = stringTableSize + 1, 9 do
				stringTable[i] = ""
			end
		end

		if headerID == nil or headerID == "" then
			NGUI.ShowInfoText({
				Text = "ID_STRING_DYNAMIC",
				Replace = stringTable
			})
		else
			NGUI.ShowInfoText({
				Text = headerID,
				Replace = stringTable
			})
		end

		if length > startIndex + 9 then
			startIndex = startIndex + 9
		end

		if length >= endIndex + 9 then
			endIndex = endIndex + 9
		elseif length > endIndex and length < endIndex + 9 then
			endIndex = length
		end
	end

	return nil
end

---------------------------------------------------------------------------------
-- Shows the length of the provided string, NOT a string from user_strings.xml
-- text: String, e.g. "Hi there"
---------------------------------------------------------------------------------
FL.ShowStringLenth = function(text)
	local length = string.length(text)
	local lengthTable = {}

	if length <= 9 then
		lengthTable = {"ID_NUM_"..length}
	else
		local lengthString = lua.tostring(length)
		FL.ShowDynamicString(lengthString, "ID_STRING_LENGTH")
	end

	return nil
end