local CREW = require("main/modules/crew")
local STR = require("main/modules/strings")

local TALK = {}


function TALK.crew_about(id)
	local goal_strings = {
		[hash("home")] = hash("talk_goal_home"),
		[hash("fun")] = hash("talk_goal_fun"),
		[hash("travel")] = hash("talk_goal_travel"),
		[hash("work")] = hash("talk_goal_work"),
		[hash("running")] = hash("talk_goal_running")
	}
	local crew = CREW.list[id]
	return {
		hash("talk_greeting"), " ",
		hash("talk_my_name_is"), " ",
		STR.en.names[crew.name.gender][crew.name.key], ".\n\n", goal_strings[crew.goal]
	}
end

return TALK