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
	target = {"Core", "Frontier", "Rim"},
	type = {"Delivery", "Smuggling", "Passage", "Assasination", "Espionage"}
}


local function generateMission()
	local mission = {
		target = missionStats.target[math.random(1, #missionStats.target)],
		type = missionStats.type[math.random(1, #missionStats.target)],
		wage = math.random(1, 20) * 100,
	}
	return mission
end

local function get_skillfulness(peep)
	local skillfulness = 0
	for key, val in pairs(peep.skills) do
		local eval = val + ((peep.attributes.confidence - 0.5) * 0.4)
		if eval < 0.2 then

		elseif eval < 0.6 then
			skillfulness = skillfulness + 1
		else
			skillfulness = skillfulness + 3
		end
	end
	return math.min(1, skillfulness / 10)
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
		for x = 1, 5 do
			table.insert(planet.recruits, 1, FCrew.generateCrew())
			planet.recruits[1].skillfulness = get_skillfulness(planet.recruits[1])
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
			table.insert(planet.recruits, 1, FCrew.generateCrew())
			planet.recruits[1].skillfulness = get_skillfulness(planet.recruits[1])
		end
		for x = 1, math.random(1, 4) do
			table.insert(planet.missions, generateMission())
		end
	end
	return planet
end


return F