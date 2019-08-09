local EVENTS = {}

local eventList = {
	"nothing",
	"pirates",
	"distress",
	"fire"
}

local list = {}
for key, val in ipairs(eventList) do
	list[val] = {}
end

--[[
Stage types:
"choice" - Displays values from table "values" as well as multiple choices. On player input moves to defined stages.
"dice" - Performs a test using "dice_type" and "dice_difficulty" and moves onto stage defined in "success" or "failure".
"end" - Displays final values and closes the dialog after player clicks "OK".

More to come

--]]

list.distress[1] = {
	stage_type = "dice",
	dice_type = "detect",
	dice_difficulty = 0.4,
	failure = 2,
	success = 3
}

list.distress[2] = {
	stage_type = "end",
	values = {
		title = "An uneventful journey",
		description = "Nothing happened"
	}
}

list.distress[3] = {
	stage_type = "choice",
	values = {
		title = "A distess signal!",
		description = "You have detected an emergency signal from a vessel. Someone may be in trouble. Or they are setting an ambush...",
		choices = {{text = "Investigate", result = 4}, {text = "Ignore it", result = 5}}
	}
}

list.distress[4] = {
	stage_type = "dice",
	dice_type = "flee",
	dice_difficulty = 12,
	failure = 6,
	success = 7
}

list.distress[5] = {
	stage_type = "end",
	values = {
		title = "Not your problem",
		description = "Whoever sent the signal will have to fend for himself."
	}
}

list.distress[6] = {
	stage_type = "end",
	values = {
		title = "Dead vessel",
		description = "There's been an accident but nobody survived."
	}
}

list.distress[7] = {
	stage_type = "end",
	values = {
		title = "A survivor!",
		description = "You rescued a guy from a crippled vesssel."
	},
	effect = "recruit_random"
}



EVENTS.list = list


function EVENTS.getEvent()		-- I think here I will add factors making various events more or less likely
	return "distress"
	--return eventList[math.random(1, #eventList)]
end

return EVENTS