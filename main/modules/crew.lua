math.randomseed(os.time())
math.random(); math.random(); math.random();

local STR = require("main/modules/strings")
local STATS = require("main/modules/stats")
local BRAIN = require("main/modules/brain")

local next_id = 0

local CREW = {list = {}}

local function normal_dist(factor, zeroMean)
	local value = 0
	for x = 1, factor do
		value = value + math.random()
	end
	value = value / factor
	if zeroMean then
		value = math.abs(value - 0.5) * 2
	end
	return value
end

local used_names = {[hash("male")] = {}, [hash("female")] = {}, [hash("both")] = {}}

local goal_list = {
	hash("fun"),
	hash("travel"),
	hash("work"),
	hash("home"),
	hash("running"),
}

function CREW.get_id(crew_id)
	for key, val in ipairs(CREW.list) do
		if val.id == crew_id then return key end
	end
end

function CREW.get_role(role)
	for key, val in ipairs(CREW.list) do
		if val.role == role then
			return val
		end
	end
	return nil
end

function CREW.set_role(crewID, role, replace)
	if replace then
		local current_holder = CREW.get_role(role)
		if current_holder then 
			current_holder.role = hash("role_none")
			msg.post(current_holder.go, hash("set_role"), {role = hash("role_none")})
		end
	end
	CREW.list[crewID].role = role
	CREW.check_issue(hash("no_role"), CREW.list[crewID])
	msg.post(CREW.list[crewID].go, hash("set_role"), {role = role})
end

function CREW.new()
	local skin_colour = {
		vmath.vector4(1, 0.85, 0.67, 1),
		vmath.vector4(0.95, 0.76, 0.49, 1),
		vmath.vector4(0.88, 0.67, 0.41, 1),
		vmath.vector4(0.77, 0.52, 0.26, 1),
		vmath.vector4(0.55, 0.33, 0.14, 1)
	}

	local hair_colour = {
		vmath.vector4(0.33, 0.24, 0.20, 1),
		vmath.vector4(0.57, 0.33, 0.24, 1),
		vmath.vector4(0.55, 0.29, 0.26, 1),
		vmath.vector4(0.70, 0.32, 0.22, 1),
		vmath.vector4(0.65, 0.42, 0.27, 1),
		vmath.vector4(0.72, 0.59, 0.47, 1),
		vmath.vector4(0.87, 0.74, 0.60, 1),
		vmath.vector4(1.00, 0.96, 0.88, 1),
		vmath.vector4(0.86, 0.81, 0.73, 1),
		vmath.vector4(0.84, 0.77, 0.76, 1),
		vmath.vector4(0.72, 0.65, 0.62, 1),
		vmath.vector4(0.44, 0.39, 0.35, 1),
		vmath.vector4(0.17, 0.13, 0.17, 1),
		vmath.vector4(0.04, 0.03, 0.02, 1),
		vmath.vector4(0.2, 0.8, 0.2, 1),
		vmath.vector4(0.15, 0.1, 0.7, 1)
	}

	local eye_colour = {
		vmath.vector4(0.12, 0.28, 0.6, 1),
		vmath.vector4(0.33, 0.13, 0, 1),
		vmath.vector4(0.27, 0.72, 0.29, 1),
		vmath.vector4(0.58, 0.68, 0.71, 1)
	}
	local gender = hash("male")
	if math.random() > 0.5 then gender = hash("female") end
	
	local list = {}
	repeat
		for key in pairs(STR.en.names[gender]) do
			if used_names[gender][key] == nil then
				table.insert(list, {key = key, gender = gender})
			end
		end
		for key in pairs(STR.en.names[hash("both")]) do
			if used_names[hash("both")][key] == nil then
				table.insert(list, {key = key, gender = hash("both")})
			end
		end
		if #list < 1 then
			local name_freed = false
			for key, val in pairs(used_names[gender]) do
				if val == false then
					used_names[gender][key] = nil
					name_freed = true
				end
			end
			for key, val in pairs(used_names[hash("both")]) do
				if val == false then
					used_names[hash("both")][key] = nil
					name_freed = true
				end
			end
			if not name_freed then
				used_names = {[hash("male")] = {}, [hash("female")] = {}, [hash("both")] = {}}
			end
		end
	until #list > 0

	local _ = math.random(1, #list)
	local name = {gender = list[_].gender, key = list[_].key}
	used_names[name.gender][name.key] = false
	
	local face = {
		skin_colour = skin_colour[math.random(1, #skin_colour)],
		eye_colour = eye_colour[math.random(1, #eye_colour)],
		hair_colour =  hair_colour[math.random(1, #hair_colour)],
		clothes_colour = vmath.vector4(math.random(), math.random(), math.random(), 1),
		chin = math.random(1, 3),
		forehead = math.random(1, 2),
		mouth = math.random(1, 4),
		nose = math.random(1, 3),
		eyes = math.random(1, 1),
		iris = math.random(1, 1),
		hair = math.random(1, 4),
		body = math.random(1, 1)
	}
	
	local skills = {
		medic = normal_dist(2, true),
		mech = normal_dist(2, true),
		gunner = normal_dist(2, true),
		comms = normal_dist(2, true),
		pilot = normal_dist(2, true)
	}

	local stats = {
		loyalty = normal_dist(5, true),
		happiness = normal_dist(5),
	}

	local attributes = {
		confidence = normal_dist(2),
		dishonesty = normal_dist(2),
		greed = normal_dist(2),
		secretiveness = normal_dist(2),
		charisma = normal_dist(2),
		smarts = normal_dist(2),
		duty = normal_dist(2),
		boldness = normal_dist(2),
		responsibility = normal_dist(2)
	}

	local knowledge = {
		science = normal_dist(5, true),
		factions = normal_dist(2, true)
	}

	local goal = goal_list[math.random(1, #goal_list)]
	
	
	--[[
	Goals:
	Have a home
	Be a good crew
	Win affection of crewman
	Get to a planet with conditions
	Have a story to tell
	Hide from someone
	
	Forgiveness/grudges
	Anger
	Bounty

	Attitude towards rest of the crew
	Trust
	
	Talents/limitations

	Respects:
	Winners
	Toughness
	Kindness
	Diplomacy
	Authority

	--]]

	return {
		gender = gender, name = name, skills = skills, stats = stats, attributes = attributes,
		knowledge = knowledge, face = face, goal = goal, role = hash("role_none"), wage = 0, money = 0,
		issues = {}
	}
end

function CREW.add(recruit, passenger)
	if not recruit then recruit = CREW.new() end
	if passenger then
		recruit.role = hash("role_passenger")
		recruit.goal = hash("travel")
	end
	next_id = next_id + 1
	recruit.id = next_id
	table.insert(CREW.list, recruit)
	used_names[recruit.name.gender][recruit.name.key] = true
	msg.post("main:/main", "spawn_crew", {crewID = #CREW.list, x = math.random(10, 13), y = 2, z = #CREW.list})
	if not recruit.wage_promised then
		recruit.wage_promised = BRAIN.get_wage(recruit)
	end
	if STATS.wage < recruit.wage_promised then
		recruit.wage = STATS.wage; STATS.wage = 0
	else
		recruit.wage = recruit.wage_promised; STATS.wage = STATS.wage - recruit.wage_promised
	end
end

function CREW.dismiss(crewID)
	msg.post(CREW.list[crewID].go, "dismiss")
	STATS.wage = STATS.wage + CREW.list[crewID].wage
	table.remove(CREW.list, crewID)
end

function CREW.getWage(peep)				-- WIP
	local best = 0
	local secondary = 0
	local skillCount = 0
	for key, val in pairs(peep.skills) do
		skillCount = skillCount + 1
		local eval = val + ((peep.attributes.confidence - 0.5) * 0.4)
		secondary = secondary + eval
		if eval > best then
			best = eval
		end
	end
	secondary = secondary - best
	best = best / 4 + 0.05
	secondary = secondary / (10 * skillCount)
	return best + secondary
end


local function add_issue(issue, crew)
	local urgency = BRAIN.get_issue_urgency(crew, issue)
	local issue_exists = false
	for key, val in ipairs(crew.issues) do
		if val.type == issue then
			val.urgency = urgency; issue_exists = true
			break
		end
	end
	if not issue_exists then
		table.insert(crew.issues, {type = issue, urgency = urgency})
	end
	table.sort(crew.issues, function(a, b) return a.urgency > b.urgency end)
	if BRAIN.get_urgency_level(crew) > 0 then
		msg.post(crew.go, hash("issue_raised"))
	else
		msg.post(crew.go, hash("issue_solved"))
	end
end

local function remove_issue(issue, crew)
	for key, val in ipairs(crew.issues) do
		if val.type == issue then
			table.remove(crew.issues, key)
			if BRAIN.get_urgency_level(crew) == 0 then
				msg.post(crew.go, hash("issue_solved"))
			end
		end
	end
end

function CREW.check_issue(issue, crew)
	if not crew then
		for key, val in ipairs(CREW.list) do
			CREW.check_issue(issue, val)
		end
		return
	elseif not issue then
		local issue_list = {hash("low_wage"), hash("no_role"), hash("no_bunk")}
		for key, val in ipairs(issue_list) do
			CREW.check_issue(val, crew)
		end
	else
		local issue_present = false
		if issue == hash("low_wage") then
			if crew.wage < crew.wage_promised then issue_present = true	end
		elseif issue == hash("no_role") then
			if crew.role == hash("role_none") then
				issue_present = true
			end
		elseif issue == hash("no_bunk") then
			if not crew.bunk then
				issue_present = true
			end
		else
			error("Unknown issue "..issue)
		end
		if issue_present then
			add_issue(issue, crew)
		else
			remove_issue(issue, crew)
		end
	end
end


return CREW