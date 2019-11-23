local STR = {
	en = {
		ui = {
			button = {
				[hash("")] = "",
				
				[hash("buy")] = "BUY",
				[hash("repair")] = "REPAIR",
				[hash("upgrade")] = "UPGRADE",
				[hash("recruit")] = "RECRUIT",
				[hash("crew")] = "CREW",
				[hash("jobs")] = "JOBS",
				[hash("travel")] = "TRAVEL",

				[hash("jobs_accept")] = "ACCEPT",

				[hash("travel_explore")] = "EXPLORE",
				[hash("travel_mission")] = "MISSION",

				[hash("error_ok")] = "OK",
			},
			dialog_title = {
				[hash("buy")] = "BUY",
				[hash("repair")] = "REPAIR",
				[hash("upgrade")] = "UPGRADE",
				[hash("recruit")] = "RECRUIT",
				[hash("crew")] = "CREW",
				[hash("jobs")] = "AVAILABLE JOBS",
				[hash("travel")] = "TRAVEL",

				[hash("error_no_fuel")] = "You don't have enough fuel!",
				[hash("error_no_food")] = "You don't have enough rations!",
				[hash("error_no_pilot")] = "You must assign a pilot!",
			},
			label = {
				[hash("jobs_type")] = "TYPE",
				[hash("jobs_region")] = "REGION",
				[hash("jobs_wage")] = "WAGE",
				
				[hash("travel_core")] = "CORE WORLDS",
				[hash("travel_frontier")] = "FRONTIER",
				[hash("travel_rim")] = "OUTER RIM",

			}
		}
	}
}

return STR