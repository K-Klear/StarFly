local LAY = {
	[hash("buy")] = {},
	[hash("repair")] = {},
	[hash("upgrade")] = {},
	[hash("recruit")] = {},
	[hash("crew")] = {},
	[hash("jobs")] = {},
	[hash("travel")] = {
		close_button = true,
		elements = {
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 1,
				props = {
					label = hash("travel_explore"),
					callback = hash("travel_explore_core"),
					enabled = true
				},
			},
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 2,
				props = {
					label = hash("travel_explore"),
					callback = hash("travel_explore_frontier"),
					enabled = true
				},
			},
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 3,
				props = {
					label = hash("travel_explore"),
					callback = hash("travel_explore_rim"),
					enabled = true
				},
			},
			{
				type = hash("button_main"),
				position_x = 1,
				position_y = 1,
				props = {
					label = hash("travel_mission"),
					callback = hash("travel_mission_core"),
					enabled = false
				},
			},
			{
				type = hash("button_main"),
				position_x = 1,
				position_y = 2,
				props = {
					label = hash("travel_mission"),
					callback = hash("travel_mission_frontier"),
					enabled = false
				},
			},
			{
				type = hash("button_main"),
				position_x = 1,
				position_y = 3,
				props = {
					label = hash("travel_mission"),
					callback = hash("travel_mission_rim"),
					enabled = false
				},
			},
			{
				type = hash("label"),
				position_x = -1,
				position_y = 1,
				text = hash("travel_core")
			},
			{
				type = hash("label"),
				position_x = -1,
				position_y = 2,
				text = hash("travel_frontier")
			},
			{
				type = hash("label"),
				position_x = -1,
				position_y = 3,
				text = hash("travel_rim")
			},
		}
	},
}

return LAY