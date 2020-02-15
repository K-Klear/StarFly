local STATS = {
	money = 1000,
	max_crew = 9,
	jobs = {[hash("core")] = {}, [hash("frontier")] = {}, [hash("rim")] = {}},
	wage = 100,
	destination = {},
	location = hash("landed"),
	leave_duration_default = 20000
}

return STATS