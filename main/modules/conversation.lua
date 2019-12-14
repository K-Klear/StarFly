local CREW = require("main/modules/crew")
local STR = require("main/modules/strings")

local TALK = {}

local talk_list = {"recruitment"}

local talks = {}

local function get_tags(stage)
	local type, effect, test, diff
	for key, val in ipairs(stage.tags) do
		if string.sub(val, 1, 5) == "test:" then
			test = string.sub(val, 6, -1)
		elseif string.sub(val, 1, 11) == "difficulty:" then
			diff = tonumber(string.sub(val, 12, -1))
		elseif string.sub(val, 1, 7) == "effect:" then
			effect = hash(string.sub(val, 8, -1))
		elseif val == "dice" or val == "end" or val == "choice" then
			type = val
		end
	end
	return type, effect, test, diff
end

local function load_talk(talk)
	local data, err = sys.load_resource("/assets/json/conversations/"..talk..".json")
	if err then pprint(err) end
	data = json.decode(data).passages
	for key, val in ipairs(data) do
		val.position = nil
		val.pid = nil
		local break_char = string.find(val.text, "%[")
		if break_char then val.text = string.sub(val.text, 1, break_char - 1) end
		if val.text ~= "" then val.text = hash(talk.."/"..val.text) end
		local type, effect, test, diff = get_tags(val)
		val.stage_type = type
		val.effect = effect
		val.dice_type = test
		val.dice_difficulty = diff
		val.tags = nil
		if val.links then
			for k, v in ipairs(val.links) do
				if v.name ~= "" then v.text = hash(talk.."/link/"..v.name) end
				v.name = nil; v.link = nil
				v.stage = tonumber(v.pid); v.pid = nil
			end
		end
	end
	talk_list[talk] = data
	pprint(data)
end

for key, val in ipairs(talk_list) do
	load_talk(val)
end


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

local function get_skills(crew)
	local levels = {}
	for x = 1, 7 do table.insert(levels, {}) end
	for key, val in pairs(crew.skills) do
		local eval = val + ((crew.attributes.confidence - 0.5) * 0.4)
		if eval < 0 then eval = 0 elseif eval > 1 then eval = 1 end
		if eval < 0.1 then
			table.insert(levels[1], key)
		elseif eval < 0.2 then
			table.insert(levels[2], key)
		elseif eval < 0.35 then
			table.insert(levels[3], key)
		elseif eval < 0.5 then
			table.insert(levels[4], key)
		elseif eval < 0.6 then
			table.insert(levels[5], key)
		elseif eval < 0.9 then
			table.insert(levels[6], key)
		else
			table.insert(levels[7], key)
		end
	end
	return levels
end

function TALK.crew_skills(id)
	local crew = CREW.list[id]
	local skill_levels = get_skills(crew)
	local qualifier = {hash("talk_qualifier_none"), hash("talk_qualifier_terrible"), hash("talk_qualifier_poor"),
	hash("talk_qualifier_average"), hash("talk_qualifier_good"), hash("talk_qualifier_great"), hash("talk_qualifier_top")}
	local role = {pilot = hash("talk_role_pilot"), mech = hash("talk_role_mech"), medic = hash("talk_role_medic"),
	gunner = hash("talk_role_gunner"), comms = hash("talk_role_comms")}
	local return_value = {}
	
	for level = 7, 1, -1 do
		if #skill_levels[level] > 0 then
			table.insert(return_value, hash("talk_I"))
			table.insert(return_value, qualifier[level])
			local count = #skill_levels[level]
			for key, val in ipairs(skill_levels[level]) do
				table.insert(return_value, " ")
				table.insert(return_value, role[val])
				if count == 1 then
					table.insert(return_value, ". ")	
				elseif count == 2 then
					table.insert(return_value, hash("talk_and"))
				else
					table.insert(return_value, ",")
				end
				count = count - 1 
			end
		end
	end
	return return_value
end

return TALK