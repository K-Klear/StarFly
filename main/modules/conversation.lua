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