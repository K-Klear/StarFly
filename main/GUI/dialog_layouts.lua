local LAY = {
	[hash("main")] = {
		elements = {
			{
				id = hash("buy"),
				type = hash("button_main"),
				position_x = -3,
				position_y = 0,
				props = {
					label = hash("buy"),
					callback = hash("buy_pressed"),
					enabled = true
				},
			},
			{
				id = hash("repair"),
				type = hash("button_main"),
				position_x = -2,
				position_y = 0,
				props = {
					label = hash("repair"),
					callback = hash("repair_pressed"),
					enabled = true
				},
			},
			{
				id = hash("upgrade"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 0,
				props = {
					label = hash("upgrade"),
					callback = hash("upgrade_pressed"),
					enabled = true
				},
			},
			{
				id = hash("recruit"),
				type = hash("button_main"),
				position_x = 0,
				position_y = 0,
				props = {
					label = hash("recruit"),
					callback = hash("recruit_pressed"),
					enabled = true
				},
			},
			{
				id = hash("crew"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 0,
				props = {
					label = hash("crew"),
					callback = hash("crew_pressed"),
					enabled = true
				},
			},
			{
				id = hash("jobs"),
				type = hash("button_main"),
				position_x = 2,
				position_y = 0,
				props = {
					label = hash("jobs"),
					callback = hash("jobs_pressed"),
					enabled = true
				},
			},
			{
				id = hash("travel"),
				type = hash("button_main"),
				position_x = 3,
				position_y = 0,
				props = {
					label = hash("travel"),
					callback = hash("travel_pressed"),
					enabled = true
				},
			},
		}
	},
	
	[hash("buy")] = {},
	[hash("repair")] = {},
	[hash("upgrade")] = {},
	[hash("recruit")] = {},
	[hash("crew")] = {
		close_button = true,
		background = true,
		elements = {
			{
				type = hash("label"),
				position_x = -2.5,
				position_y = 1,
				text = hash("crew_name")
			},
			{
				type = hash("label"),
				position_x = -1.5,
				position_y = 1,
				text = hash("crew_role")
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 1,
				text = hash("crew_wage")
			},
			{
				repeating = {"CREW", "list"},
				type = hash("icon_face"),
				position_x = -3.1,
				position_y = 2,
				scale = vmath.vector3(2, 2, 2)
			},
			{
				repeating = {"CREW", "list"},
				type = hash("label"),
				position_x = -2.5,
				position_y = 2,
				text = ("name_string")
			},
			{
				repeating = {"CREW", "list"},
				type = hash("label"),
				position_x = -1.5,
				position_y = 2,
				text = ("role")
			},
			{
				repeating = {"CREW", "list"},
				type = hash("button_tiny"),
				position_x = -0.8,
				position_y = 2,
				props = {
					label = hash("crew_plus"),
					callback = hash("crew_wage_plus"),
					enabled = true
				},
			},
			{
				repeating = {"CREW", "list"},
				type = hash("label"),
				position_x = -0.5,
				position_y = 2,
				text = ("wage")
			},
			{
				repeating = {"CREW", "list"},
				type = hash("button_tiny"),
				position_x = -0.2,
				position_y = 2,
				props = {
					label = hash("crew_minus"),
					callback = hash("crew_wage_minus"),
					enabled = true
				},
			},
			{
				repeating = {"CREW", "list"},
				type = hash("button_main"),
				position_x = 0.5,
				position_y = 2,
				props = {
					label = hash("crew_background"),
					callback = hash("crew_background"),
					enabled = true
				},
			},
			{
				repeating = {"CREW", "list"},
				type = hash("button_main"),
				position_x = 1.5,
				position_y = 2,
				props = {
					label = hash("crew_skills"),
					callback = hash("crew_skills"),
					enabled = true
				},
			},
			{
				repeating = {"CREW", "list"},
				type = hash("button_main"),
				position_x = 2.5,
				position_y = 2,
				props = {
					label = hash("crew_dismiss"),
					callback = hash("crew_dismiss"),
					enabled = true
				},
			},
		}
	},
	[hash("jobs")] = {
		close_button = true,
		background = true,
		elements = {
			{
				type = hash("label"),
				position_x = -1.5,
				position_y = 1,
				text = hash("jobs_type")
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 1,
				text = hash("jobs_region")
			},
			{
				type = hash("label"),
				position_x = 0.5,
				position_y = 1,
				text = hash("jobs_wage")
			},
			{
				repeating = {"PLANET", "current", "jobs"},
				type = hash("label"),
				position_x = -1.5,
				position_y = 2,
				text = ("type")
			},
			{
				repeating = {"PLANET", "current", "jobs"},
				type = hash("label"),
				position_x = -0.5,
				position_y = 2,
				text = ("region")
			},
			{
				repeating = {"PLANET", "current", "jobs"},
				type = hash("label"),
				position_x = 0.5,
				position_y = 2,
				text = ("wage")
			},
			{
				repeating = {"PLANET", "current", "jobs"},
				type = hash("button_main"),
				position_x = 1.5,
				position_y = 2,
				props = {
					label = hash("jobs_accept"),
					callback = hash("jobs_accept"),
					enabled = true
				},
			},
		}
	},
	[hash("travel")] = {
		close_button = true,
		background = true,
		elements = {
			{
				id = hash("explore_core"),
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
				id = hash("explore_frontier"),
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
				id = hash("explore_rim"),
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
				id = hash("core"),
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
				id = hash("frontier"),
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
				id = hash("rim"),
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

	[hash("error")] = {
		close_button = true,
		background = true,
		elements = {
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 1,
				props = {
					label = hash("error_ok"),
					callback = hash("close"),
					enabled = true
				},
			},
		}
	}
}

return LAY