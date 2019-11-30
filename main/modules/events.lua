local DICE = require("main/modules/dice")

local EVENT = {}

local list_space = {
	"distress_signal_true",
	"ambush_pirate",
	"asteroids",
}

local event_list = {[hash("space")] = {}, [hash("orbit")] = {}, [hash("landing")] = {}}

local function get_tags(stage)
	local type, effect, test, diff
	for key, val in ipairs(stage.tags) do
		if string.sub(val, 1, 5) == "test:" then
			test = string.sub(val, 6, -1)
		elseif string.sub(val, 1, 11) == "difficulty:" then
			diff = tonumber(string.sub(val, 12, -1))
		elseif string.sub(val, 1, 7) == "effect:" then
			effect = string.sub(val, 8, -1)
		elseif val == "dice" or val == "end" or val == "choice" then
			type = val
		end
	end
	return type, effect, test, diff
end

local function load_event(event, event_type)
	local data, err = sys.load_resource("/assets/json/"..event..".json")
	if err then pprint(err) end
	data = json.decode(data).passages
	for key, val in ipairs(data) do
		val.position = nil
		val.pid = nil
		local break_char = string.find(val.text, "%[")
		if break_char then val.text = string.sub(val.text, 1, break_char - 1) end
		local type, effect, test, diff = get_tags(val)
		val.stage_type = type
		val.effect = effect
		val.dice_type = test
		val.dice_difficulty = diff
		val.tags = nil
	end
	event_list[event_type][event] = data
end

for key, val in ipairs(list_space) do
	load_event(val, hash("space"))
end

function EVENT.progress(dialog)
	for key, val in pairs(dialog.event.btn) do gui.set_enabled(val, false) end
	local current_stage = EVENT.event[EVENT.stage]
	if current_stage.stage_type == "choice" then
		for num, option in ipairs(current_stage.links) do
			gui.set_text(dialog.event.btn["option"..num], option.name)
			gui.set_enabled(dialog.event.btn["option"..num], true)
		end
		gui.set_text(dialog.event.lbl.title, current_stage.name)
		gui.set_text(dialog.event.lbl.description, current_stage.text)
	elseif current_stage.stage_type == "dice" then
		if DICE.skillCheck(current_stage.dice_type, current_stage.dice_difficulty) then
			EVENT.stage = current_stage.links[1].pid + 0
		else
			EVENT.stage = current_stage.links[2].pid + 0
		end
		EVENT.progress(dialog); return
	elseif current_stage.stage_type == "end" then
		gui.set_text(dialog.event.btn.option3, "OK")
		gui.set_enabled(dialog.event.btn.option3, true)
		gui.set_text(dialog.event.lbl.title, current_stage.name)
		gui.set_text(dialog.event.lbl.description, current_stage.text)
	end
end

function EVENT.getEvent(event_type)		-- I think here I will add factors making various events more or less likely
	local randomizer = {}
	for key, val in pairs(event_list[event_type]) do
		table.insert(randomizer, key)
	end
	return randomizer[math.random(1, #randomizer)]
end

function EVENT.new(event_type)
	EVENT.current = event_list[event_type][EVENT.getEvent(event_type)]
	EVENT.stage = 1
end


return EVENT