local FCrew = require("main.functionsCrew")

local F = {}

local regionStats = {
	Core = {
		government = {"Federation"},
		recruitMax = 5,
		settlement = {"Megalopolis"}
	},
	Frontier = {
		government = {"Federation", "Rebels", "Independent", "Independent", "Independent"},
		recruitMax = 3,
		settlement = {"Outpost"}
	},
	Rim = {
		government = {"Rebels", "Rebels", "Independent", "Independent"},
		recruitMax = 1,
		settlement = {"Outpost"}
	}
}

local missionStats = {
	target = {"core", "frontier", "rim"},
	type = {"delivery", "smuggling", "passage", "assasination", "espionage"}
}


local function generateMission()
	local mission = {
		target = missionStats.target[math.random(1, #missionStats.target)],
		type = missionStats.type[math.random(1, #missionStats.target)],
		wage = math.random(1, 20) * 100,
	}
	return mission
end

function F.generatePlanet(region, start)
	local planet
	if start then
		planet = {
			price = {
				fuel = 50,
				rations = 20
			},
			region = region,
			settlement = "Outpost",
			government = "Federation",
			recruits = {},
			missions = {}
		}
		for x = 1, 4 do
			table.insert(planet.recruits, FCrew.generateCrew())
		end
		for x = 1, 3 do
			table.insert(planet.missions, generateMission())
		end
	else
		planet = {
			price = {
				fuel = 50,
				rations = 20
			},
			region = region,
			recruits = {},
			missions = {}
		}
		planet.government = regionStats[region].government[math.random(1, #regionStats[region].government)]
		planet.settlement = regionStats[region].settlement[math.random(1, #regionStats[region].settlement)]
		local recruitsCount = math.random(0, regionStats[region].recruitMax)
		for x = 1, recruitsCount do
			table.insert(planet.recruits, FCrew.generateCrew())
		end
		for x = 1, math.random(1, 4) do
			table.insert(planet.missions, generateMission())
		end
	end
	return planet
end


return F