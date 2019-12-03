local CREW = require("main/modules/crew")
local STR = require("main/modules/strings")

local TALK = {}


function TALK.crew_about(id)
	return {
		hash("talk_greeting"), " ",
		hash("talk_my_name_is"), " ",
		STR.en.names[CREW.list[id].name.gender][CREW.list[id].name.key], ".",
	}
end

return TALK