local FCrew = require("main.functionsCrew")

local F = {}

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

	end
	return planet
end

return F