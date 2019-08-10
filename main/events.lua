local DICE = require("main.dice")

local EVENTS = {}

local eventList = {
	"distress",
	"pirates",
	
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

More to come, maybe

--]]

list.pirates[1] = {
	stage_type = "dice",
	dice_type = "detect",
	dice_difficulty = 0.8,
	failure = 2,
	success = 3
}

list.pirates[2] = {
	stage_type = "choice",
	title = "Pirate ambush!",
	description = "A pirate ship got the drop on you. You'll have to fight.",
	choices = {}
}
list.pirates[2].choices[2] = {text = "Fight!", result = 6}

list.pirates[3] = {
	stage_type = "choice",
	title = "Pirate ambush!",
	description = "A pirate ship was ready to ambush you, but your comms officer managed to detect them in time, giving you a chance to flee.",
	choices = {}
}
list.pirates[3].choices[1] = {text = "Fight!", result = 6}
list.pirates[3].choices[3] = {text = "Flee", result = 4}

list.pirates[4] = {
	stage_type = "dice",
	dice_type = "flee",
	dice_difficulty = 11,
	failure = 7,
	success = 5
}

list.pirates[5] = {
	stage_type = "end",
	title = "You're evaded the ambush",
	description = "Firing your engine at full power, you soon leave the pirate ambush far behind you."
}

list.pirates[6] = {
	stage_type = "dice",
	dice_type = "shoot",
	dice_difficulty = 1,
	failure = 7,
	success = 8
}

list.pirates[7] = {
	stage_type = "end",
	title = "The pirates hit you hard",
	description = "Unable to outrun or outgun the pirates, your ship takes heavy damage. Damage hasn't been implemented yet, though. Lucky bastard."
}

list.pirates[8] = {
	stage_type = "end",
	title = "Victory!",
	description = "The pirate ship explodes violently and is no more. Congratulations! You're safe now."
}

list.distress[1] = {
	stage_type = "dice",
	dice_type = "detect",
	dice_difficulty = 0.4,
	failure = 2,
	success = 3
}

list.distress[2] = {
	stage_type = "end",
	title = "An uneventful journey",
	description = "Nothing of importance happened."
}

list.distress[3] = {
	stage_type = "choice",
	title = "A distess signal!",
	description = "You have detected an emergency signal from a vessel. Someone may be in trouble. Or they are setting an ambush...",
	choices = {}
}
list.distress[3].choices[1] = {text = "Investigate", result = 4}
list.distress[3].choices[3] = {text = "Ignore it", result = 5}

list.distress[4] = {
	stage_type = "dice",
	dice_type = "luck",
	dice_difficulty = 0.5,
	failure = 6,
	success = 7
}

list.distress[5] = {
	stage_type = "end",
	title = "Not your problem",
	description = "Whoever sent the signal will have to fend for himself."
}

list.distress[6] = {
	stage_type = "end",
	title = "Dead vessel",
	description = "There's nothing you can do to help here. There are no survivors and nothing of value."
}

list.distress[7] = {
	stage_type = "end",
	title = "A survivor!",
	description = "You find a damaged vessel and rescue one of its crew. They agree to join you.",
	effect = "recruit_random"
}


EVENTS.list = list


function EVENTS.progress(dialog)
	local finished = false
	for key, val in pairs(dialog.event.btn) do gui.set_enabled(val, false) end
	repeat
		if EVENTS.event[EVENTS.stage].stage_type == "choice" then
			for num, table in pairs(EVENTS.event[EVENTS.stage].choices) do
				gui.set_text(dialog.event.btn["option"..num], table.text)
				gui.set_enabled(dialog.event.btn["option"..num], true)
			end
			gui.set_text(dialog.event.lbl.title, EVENTS.event[EVENTS.stage].title)
			gui.set_text(dialog.event.lbl.description, EVENTS.event[EVENTS.stage].description)
			finished = true
		elseif EVENTS.event[EVENTS.stage].stage_type == "dice" then
			if DICE.skillCheck(EVENTS.event[EVENTS.stage].dice_type, EVENTS.event[EVENTS.stage].dice_difficulty) then
				EVENTS.stage = EVENTS.event[EVENTS.stage].success
			else
				EVENTS.stage = EVENTS.event[EVENTS.stage].failure
			end
		elseif EVENTS.event[EVENTS.stage].stage_type == "end" then
			gui.set_text(dialog.event.btn.option2, "OK")
			gui.set_enabled(dialog.event.btn.option2, true)
			gui.set_text(dialog.event.lbl.title, EVENTS.event[EVENTS.stage].title)
			gui.set_text(dialog.event.lbl.description, EVENTS.event[EVENTS.stage].description)
			finished = true
		end
	until finished
end

function EVENTS.getEvent()		-- I think here I will add factors making various events more or less likely
	return eventList[math.random(1, #eventList)]
end

return EVENTS