local LAY = {
	[hash("infobox")] = {
		background = true,
		elements = {
			{
				id = hash("info_region"),
				type = hash("label"),
				position_x = -0.9,
				position_y = 0.2,
				text = {"PLANET", "current", "region"}
			},
			{
				id = hash("info_government"),
				type = hash("label"),
				position_x = 0,
				position_y = 0.2,
				text = {"PLANET", "current", "government"}
			},
			{
				id = hash("info_settlement"),
				type = hash("label"),
				position_x = 0.9,
				position_y = 0.2,
				text = {"PLANET", "current", "settlement"}
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 1,
				text = hash("info_fuel")
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 2,
				text = hash("info_food")
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 3,
				text = hash("info_money")
			},
			{
				id == hash("info_fuel"),
				type = hash("label"),
				position_x = 0.5,
				position_y = 1,
				text = {"STATS", "fuel"}
			},
			{
				id = hash("info_food"),
				type = hash("label"),
				position_x = 0.5,
				position_y = 2,
				text = {"STATS", "food"}
			},
			{
				id = hash("info_money"),
				type = hash("label"),
				position_x = 0.5,
				position_y = 3,
				text = {"STATS", "money"}
			},
		}
	},
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
					enabled = false
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
					enabled = false
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
	[hash("main_space")] = {
		elements = {
			{
				id = hash("crew"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 0,
				props = {
					label = hash("crew"),
					callback = hash("crew_pressed"),
					enabled = true
				},
			},
			{
				id = hash("continue"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 0,
				props = {
					label = hash("continue"),
					callback = hash("continue_pressed"),
					enabled = true
				},
			},
		}
	},
	[hash("main_orbit")] = {
		elements = {
			{
				id = hash("crew"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 0,
				props = {
					label = hash("crew"),
					callback = hash("crew_pressed"),
					enabled = true
				},
			},
			{
				id = hash("continue"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 0,
				props = {
					label = hash("land"),
					callback = hash("land_pressed"),
					enabled = true
				},
			},
		}
	},
	[hash("buy")] = {},
	[hash("repair")] = {},
	[hash("upgrade")] = {},
	[hash("recruit")] = {
		close_button = true,
		background = true,
		elements = {
			{
				repeating = {"PLANET", "current", "recruits"},
				type = hash("icon_face"),
				position_x = -1.6,
				position_y = 1,
				scale = vmath.vector3(2, 2, 2)
			},
			{
				repeating = {"PLANET", "current", "recruits"},
				type = hash("label"),
				position_x = -1,
				position_y = 1,
				text = "name_string"
			},
			{
				id = hash("recruit_talk"),
				repeating = {"PLANET", "current", "recruits"},
				type = hash("button_main"),
				position_x = 0,
				position_y = 1,
				props = {
					label =  hash("recruit_talk"),
					callback = hash("recruit_talk"),
					enabled = true
				},
			},
			{
				id = hash("recruit_hire"),
				repeating = {"PLANET", "current", "recruits"},
				type = hash("button_main"),
				position_x = 1,
				position_y = 1,
				props = {
					label =  hash("recruit_hire"),
					callback = hash("recruit_hire"),
					enabled = true
				},
			},
		}
	},
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
				type = hash("label"),
				position_x = 1.5,
				position_y = 1,
				text = hash("crew_earnings")
			},
			{
				type = hash("label"),
				position_x = 2.5,
				position_y = 1,
				text = {"STATS", "wage"}
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
				text = "name_string"
			},
			{
				id = hash("crew_role"),
				repeating = {"CREW", "list"},
				type = hash("button_main"),
				position_x = -1.5,
				position_y = 2,
				props = {
					label = "role",
					callback = hash("crew_role"),
					enabled = true
				},
			},
			{
				id = hash("crew_wage_plus"),
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
				id = hash("crew_wage_minus"),
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
				id = hash("crew_background"),
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
				id = hash("crew_skills"),
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
				id = hash("crew_dismiss"),
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
	[hash("crew_role")] = {
		close_button = true,
		background = true,
		elements = {
			{
				id = hash("crew_role_pilot"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 1,
				props = {
					label = hash("role_pilot"),
					callback = hash("crew_role_pilot"),
					enabled = true
				},
			},
			{
				id = hash("crew_role_engineer"),
				type = hash("button_main"),
				position_x = 0,
				position_y = 1,
				props = {
					label = hash("role_engineer"),
					callback = hash("crew_role_engineer"),
					enabled = true
				},
			},
			{
				id = hash("crew_role_comms"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 1,
				props = {
					label = hash("role_comms"),
					callback = hash("crew_role_comms"),
					enabled = true
				},
			},
			{
				id = hash("crew_role_medic"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 2,
				props = {
					label = hash("role_medic"),
					callback = hash("crew_role_medic"),
					enabled = true
				},
			},
			{
				id = hash("crew_role_gunner"),
				type = hash("button_main"),
				position_x = 0,
				position_y = 2,
				props = {
					label = hash("role_gunner"),
					callback = hash("crew_role_gunner"),
					enabled = true
				},
			},
			{
				id = hash("crew_role_none"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 2,
				props = {
					label = hash("role_none"),
					callback = hash("crew_role_none"),
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
	[hash("event")] = {
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