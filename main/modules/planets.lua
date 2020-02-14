local CREW = require("main/modules/crew")
local STR = require("main/modules/strings")

local PLANET = {current = 1, list = {}}

local used_names = {}
local next_id = 1

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
	[hash("megalopolis")] = {
		wealth_max = 1.5,
		wealth_min = 1.2,
		recruit_max = 6
	},
	[hash("city")] = {
		wealth_max = 1.3,
		wealth_min = 0.7,
		recruit_max = 4
	},
	[hash("outpost")] = {
		wealth_max = 0.8,
		wealth_min = 0.5,
		recruit_max = 2
	}
}

function PLANET.add_jobs(planet)
	local function get_job_wages(job)
		local data = {
			[hash("delivery")] = {
				base = 500,
				per_one = 100,
				
			},
			[hash("passage")] = {
				base = 750,
				per_one = 200,
			},
		}
		local wage = data[job.type].base + data[job.type].per_one * job.amount
		return wage
	end
	
	if planet.jobs > 0 then
		local count = planet.jobs
		planet.jobs = {}
		for x = 1, count do
			local region = mission_stats.target[math.random(1, #mission_stats.target)]
			table.insert(planet.jobs, {
				region = region,
				type = mission_stats.type[math.random(1, #mission_stats.type)],
				planet = PLANET.new(region)
			})
			local job = planet.jobs[#planet.jobs]
			if job.type == hash("delivery") then
				job.amount = math.random(1, 5)
			elseif job.type == hash("passage") then
				job.amount = math.random(1, 3)
			end
			job.wage = get_job_wages(job)
		end
	end
end


function PLANET.new(region, start)
	local planet
	if start then
		planet = {
			price = {
				fuel = 50,
				rations = 20
			},
			region = region,
			settlement = hash("outpost"),
			government = hash("federation"),
			recruits = {},
			jobs = 3,
		}
		for x = 1, 5 do
			table.insert(planet.recruits, 1, CREW.new())
		end
		PLANET.add_jobs(planet)
	else
		planet = {
			price = {
				fuel = 50,
				rations = 20
			},
			region = region,
			recruits = {},
			jobs = math.random(1, 4)
		}
		planet.government = region_stats[region].government[math.random(1, #region_stats[region].government)]
		planet.settlement = region_stats[region].settlement[math.random(1, #region_stats[region].settlement)]
		local recruit_count = math.random(0, region_stats[region].recruit_max)
		for x = 1, recruit_count do
			table.insert(planet.recruits, 1, CREW.new())
		end
	end

	local list = {}
	repeat
		for key in pairs(STR.en.planets) do
			if used_names[key] == nil then
				table.insert(list, key)
			end
		end
		if #list < 1 then used_name = {} end
	until #list > 0

	local _ = math.random(1, #list)
	planet.name = list[_]; used_names[planet.name] = true

	local goal_stats = {
		[hash("fun")] = {
			desperation_max = 1.3,
			desperation_min = 0.7
		},
		[hash("travel")] = {
			desperation_max = 1.3,
			desperation_min = 0.7
		},
		[hash("work")] = {
			desperation_max = 1.1,
			desperation_min = 0.2
		},
		[hash("home")] = {
			desperation_max = 1.1,
			desperation_min = 0.2
		},
		[hash("running")] = {
			desperation_max = 0.8,
			desperation_min = 0
		}
	}
	planet.wealth = math.random() * (settlement_stats[planet.settlement].wealth_max - settlement_stats[planet.settlement].wealth_min) + settlement_stats[planet.settlement].wealth_min
	for key, peep in ipairs(planet.recruits) do
		local desperation = math.random() * (goal_stats[peep.goal].desperation_max - goal_stats[peep.goal].desperation_min) + goal_stats[peep.goal].desperation_min
		peep.desperation = math.min(desperation * planet.wealth, 1)
	end
	return planet
end

local goal_stats = {
	[hash("fun")] = {
		desperation_max = 1.3,
		desperation_min = 0.7
	},
	[hash("travel")] = {
		desperation_max = 1.3,
		desperation_min = 0.7
	},
	[hash("work")] = {
		desperation_max = 1.1,
		desperation_min = 0.2
	},
	[hash("home")] = {
		desperation_max = 1.1,
		desperation_min = 0.2
	},
	[hash("running")] = {
		desperation_max = 0.8,
		desperation_min = 0
	}
}

local get_stat = {}

local function get_random(table)
	return table[math.random(1, #table)]
end

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
	return get_random(region_stats[PLANET.get(id, "region")].government)
end

function get_stat.settlement(id)
	return get_random(region_stats[PLANET.get(id, "region")].settlement)
end

function get_stat.recruits(id)
	local recruit_count = math.random(0, settlement_stats[PLANET.get(id, "settlement")].recruit_max)
	local recruits = {}
	for x = 1, recruit_count do
		table.insert(recruits, CREW.new())
	end
	return recruits
end

function get_stat.wealth(id)
	return math.random() * (settlement_stats[PLANET.get(id, "settlement")].wealth_max - settlement_stats[PLANET.get(id, "settlement")].wealth_min) + settlement_stats[PLANET.get(id, "settlement")].wealth_min
end

function PLANET.get(id, stat)
	if PLANET.list[id][stat] then
		return PLANET.list[id][stat]
	else
		local new_stat = get_stat[stat](id)
		PLANET.list[id][stat] = new_stat
		return new_stat
	end
end

--[[
for key, peep in ipairs(planet.recruits) do
	local desperation = math.random() * (goal_stats[peep.goal].desperation_max - goal_stats[peep.goal].desperation_min) + goal_stats[peep.goal].desperation_min
	peep.desperation = math.min(desperation * planet.wealth, 1)
end
--]]


PLANET.list[1] = {}
PLANET.list[1].name = PLANET.get(1, "name")
PLANET.list[1].region = hash("frontier")
PLANET.list[1].government = PLANET.get(1, "government")
PLANET.list[1].settlement = PLANET.get(1, "settlement")
--PLANET.list[1].jobs = 3
--PLANET.list[1].price = {fuel = 50, rations = 20}
PLANET.list[1].recruits = {[1] = CREW.new(), [2] = CREW.new(), [3] = CREW.new(), [4] = CREW.new()}
PLANET.list[1].wealth = PLANET.get(1, "wealth")


for key, val in pairs(PLANET.list[1]) do
	print(key, val)
end


PLANET.current = PLANET.new(hash("frontier"), true)

return PLANET