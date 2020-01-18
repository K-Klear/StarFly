local STATS = {
	money = 1000,
	food = 20,
	fuel = 5,
	max_crew = 9,
	max_food = 20,
	max_fuel = 5,
	jobs = {[hash("core")] = {}, [hash("frontier")] = {}, [hash("rim")] = {}},
	wage = 100,
	destination = {type = hash("core"), target = hash("rim"), time = 150}
}

return STATS