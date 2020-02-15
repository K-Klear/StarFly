local CREW = require("main/modules/crew")
local STR = require("main/modules/strings")

local PLANET = {current_id = 1, list = {}}

local used_names = {}

local region_stats = {
	[hash("core")] = {
		government = {hash("federation")},
		recruit_max = 5,
		settlement = {hash("megalopolis"), hash("city")}
	},
	[hash("frontier")] = {
		government = {hash("federation"), hash("rebels"), hash("independent"), hash("independent"), hash("independent")},
		recruit_max = 3,
		settlement = {hash("city"), hash("outpost")}
	},
	[hash("rim")] = {
		government = {hash("rebels"), hash("rebels"), hash("independent"), hash("independent")},
		recruit_max = 1,
		settlement = {hash("outpost")}
	}
}

local mission_stats = {
	target = {hash("core"), hash("frontier"), hash("rim")},
	type = {hash("delivery"), hash("passage")}--, hash("assasination"), hash("espionage"), hash("smuggling")}
}

local settlement_stats = {
	[hash("megalopolis")] = {wealth_max = 1.5, wealth_min = 1.2, recruit_max = 6},
	[hash("city")] = {wealth_max = 1.3, wealth_min = 0.7, recruit_max = 4},
	[hash("outpost")] = {wealth_max = 0.8, wealth_min = 0.5, recruit_max = 2}
}

function PLANET.new_planet(table)
	table = table or {}
	local id = 0
	repeat id = id + 1 until not PLANET.list[id]
	PLANET.list[id] = {}
	for key, val in pairs(table) do
		PLANET.list[id][key] = val
	end
	return id
end

local function get_random(table)
	return table[math.random(1, #table)]
end

local get_stat = {}

function get_stat.name(id)
	local list = {}
	repeat
		for key in pairs(STR.en.planets) do
			if used_names[key] == nil then
				table.insert(list, key)
			end
		end
		if #list < 1 then used_names = {} end
	until #list > 0
	local _ = math.random(1, #list)
	used_names[list[_]] = true
	return list[_]
end

function get_stat.region(id)
	local regions = {hash("core"), hash("frontier"), hash("rim")}
	return get_random(regions)
end

function get_stat.government(id)
	return get_random(region_stats[PLANET.get("region", id)].government)
end

function get_stat.settlement(id)
	return get_random(region_stats[PLANET.get("region", id)].settlement)
end

function get_stat.recruits(id)
	local goal_stats = {
		[hash("fun")] = {desperation_max = 1.3, desperation_min = 0.7},
		[hash("travel")] = {desperation_max = 1.3, desperation_min = 0.7},
		[hash("work")] = {desperation_max = 1.1, desperation_min = 0.2},
		[hash("home")] = {desperation_max = 1.1, desperation_min = 0.2},
		[hash("running")] = {desperation_max = 0.8,desperation_min = 0}
	}
	local recruit_count = math.random(0, settlement_stats[PLANET.get("settlement", id)].recruit_max)
	local recruits = {}
	for x = 1, recruit_count do
		table.insert(recruits, CREW.new())
	end
	for key, peep in ipairs(recruits) do
		local desperation = math.random() * (goal_stats[peep.goal].desperation_max - goal_stats[peep.goal].desperation_min) + goal_stats[peep.goal].desperation_min
		peep.desperation = math.min(desperation * PLANET.get("wealth", id), 1)
	end
	return recruits
end

function get_stat.wealth(id)
	return math.random() * (settlement_stats[PLANET.get("settlement", id)].wealth_max - settlement_stats[PLANET.get("settlement", id)].wealth_min) + settlement_stats[PLANET.get("settlement", id)].wealth_min
end

function get_stat.jobs(id)
	local job_data = {
		[hash("delivery")] = {wage_base = 500, wage_per_unit = 100, units_max = 6},
		[hash("passage")] = {wage_base = 750, wage_per_unit = 200, units_max = 3},
		type = {hash("delivery"), hash("passage")}--, hash("assasination"), hash("espionage"), hash("smuggling")}
	}
	local job_count = math.random(1, 4)
	local jobs = {}
	for x = 1, job_count do
		jobs[x] = {}
		jobs[x].planet_id = PLANET.new_planet()
		jobs[x].type = get_random(job_data.type)
		jobs[x].units = math.random(1, job_data[jobs[x].type].units_max)
		jobs[x].wage = job_data[jobs[x].type].wage_base + job_data[jobs[x].type].wage_per_unit * jobs[x].units
		jobs[x].region = PLANET.get("region", jobs[x].planet_id)
	end
	return jobs
end

function get_stat.sky_colour(id)
	local red = math.random() / 2
	local green = math.random()
	local blue = math.random() / 2 + 0.5
	local alpha = math.random() / 2 + 0.5
	return vmath.vector4(red, green, blue, alpha)
end

function get_stat.price_fuel(id)
	return math.random(1, 5) * 250
end

function get_stat.price_food(id)
	return math.random(1, 5) * 25
end

function PLANET.get(stat, id)
	id = id or PLANET.current_id
	if PLANET.list[id][stat] then
		return PLANET.list[id][stat]
	else
		local new_stat = get_stat[stat](id)
		PLANET.list[id][stat] = new_stat
		return new_stat
	end
end

PLANET.new_planet({region = hash("frontier"), recruits = {[1] = CREW.new(), [2] = CREW.new(), [3] = CREW.new(), [4] = CREW.new()}})

return PLANET