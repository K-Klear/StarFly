local CREW = require("main/modules/crew")

local PLANET = {current = {}}

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
	type = {hash("delivery"), hash("smuggling"), hash("passage"), hash("assasination"), hash("espionage")}
}

local settlement_stats = {
	[hash("megalopolis")] = {
		wealth_max = 1.5,
		wealth_min = 1.2
	},
	[hash("city")] = {
		wealth_max = 1.3,
		wealth_min = 0.7
	},
	[hash("outpost")] = {
		wealth_max = 0.8,
		wealth_min = 0.5
	}
}


local function new_mission()
	local mission = {
		region = mission_stats.target[math.random(1, #mission_stats.target)],
		type = mission_stats.type[math.random(1, #mission_stats.target)],
		wage = math.random(1, 20) * 100,
	}
	return mission
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
			jobs = {}
		}
		for x = 1, 5 do
			table.insert(planet.recruits, 1, CREW.new())
		end
		for x = 1, 3 do
			table.insert(planet.jobs, new_mission())
		end
	else
		planet = {
			price = {
				fuel = 50,
				rations = 20
			},
			region = region,
			recruits = {},
			jobs = {}
		}
		planet.government = region_stats[region].government[math.random(1, #region_stats[region].government)]
		planet.settlement = region_stats[region].settlement[math.random(1, #region_stats[region].settlement)]
		local recruit_count = math.random(0, region_stats[region].recruit_max)
		for x = 1, recruit_count do
			table.insert(planet.recruits, 1, CREW.new())
		end
		for x = 1, math.random(1, 4) do
			table.insert(planet.jobs, new_mission())
		end
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
	
	planet.wealth = math.random() * (settlement_stats[planet.settlement].wealth_max - settlement_stats[planet.settlement].wealth_min) + settlement_stats[planet.settlement].wealth_min
	for key, peep in ipairs(planet.recruits) do
		local desperation = math.random() * (goal_stats[peep.goal].desperation_max - goal_stats[peep.goal].desperation_min) + goal_stats[peep.goal].desperation_min
		peep.desperation = math.min(desperation * planet.wealth, 1)
	end
	PLANET.current = planet
end

PLANET.new(hash("frontier"), true)

return PLANET