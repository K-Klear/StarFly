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
			recruits = {}
		}
		for x = 1, 4 do
			table.insert(planet.recruits, FCrew.generateCrew())
		end
	else
		planet = {
			price = {
				fuel = 50,
				rations = 20
			},
			region = region,
			recruits = {}
		}
		planet.government = regionStats[region].government[math.random(1, #regionStats[region].government)]
		planet.settlement = regionStats[region].settlement[math.random(1, #regionStats[region].settlement)]
		local recruitsCount = math.random(0, regionStats[region].recruitMax)
		for x = 1, recruitsCount do
			table.insert(planet.recruits, FCrew.generateCrew())
		end
	end
	return planet
end

local function generateMission()

	return mission
end

return F