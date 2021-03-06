local EVENT = require("main/modules/events")
local PLANET = require("main/modules/planets")
local STATS = require("main/modules/stats")
local STR = require("main/modules/strings")
local CREW = require("main/modules/crew")
local TALK = require("main/modules/conversation")
local TIME = require("main/modules/time")
local CARGO = require("main/modules/cargo")

local LAY = {
	[hash("infobox")] = {
		background = true,
		elements = {
			{
				id = hash("info_region"),
				type = hash("label"),
				position_x = -0.9,
				position_y = 0.2,
				text = function() return PLANET.get("region") end
			},
			{
				id = hash("info_government"),
				type = hash("label"),
				position_x = 0,
				position_y = 0.2,
				text =  function() return PLANET.get("government") end
			},
			{
				id = hash("info_settlement"),
				type = hash("label"),
				position_x = 0.9,
				position_y = 0.2,
				text = function() return PLANET.get("settlement") end
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 1,
				text = hash("lbl_info_fuel")
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 2,
				text = hash("lbl_info_food")
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 3,
				text = hash("lbl_info_money")
			},
			{
				id == hash("info_fuel"),
				type = hash("label"),
				position_x = 0.5,
				position_y = 1,
				text = function() return math.floor(CARGO.fuel * 100).." %" end
			},
			{
				id = hash("info_food"),
				type = hash("label"),
				position_x = 0.5,
				position_y = 2,
				text = function() return CARGO.food end
			},
			{
				id = hash("info_money"),
				type = hash("label"),
				position_x = 0.5,
				position_y = 3,
				text = function() return STATS.money end
			},
		}
	},
	[hash("landed")] = {
		elements = {
			{
				id = hash("buy"),
				type = hash("button_main"),
				position_x = -3,
				position_y = 0,
				props = {
					label = hash("btn_buy"),
					callback = hash("buy_pressed"),
					enabled = function() return not(CARGO.fuel == 1 and CARGO.food == CARGO.food_max) end
				},
			},
			{
				id = hash("repair"),
				type = hash("button_main"),
				position_x = -2,
				position_y = 0,
				props = {
					label = hash("btn_repair"),
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
					label = hash("btn_upgrade"),
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
					label = hash("btn_recruit"),
					callback = hash("recruit_pressed"),
					enabled = function() return #PLANET.get("recruits") > 0 end
				},
			},
			{
				id = hash("crew"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 0,
				props = {
					label = hash("btn_crew"),
					callback = hash("crew_pressed"),
					enabled = function() return #CREW.list > 0 end
				},
			},
			{
				id = hash("jobs"),
				type = hash("button_main"),
				position_x = 2,
				position_y = 0,
				props = {
					label = hash("btn_jobs"),
					callback = hash("jobs_pressed"),
					enabled = function() return #PLANET.get("jobs") > 0 end
				},
			},
			{
				id = hash("travel"),
				type = hash("button_main"),
				position_x = 3,
				position_y = 0,
				props = {
					label = hash("btn_travel"),
					callback = hash("travel_pressed"),
					enabled = true
				},
			},
		}
	},
	[hash("flight")] = {
		elements = {
			{
				id = hash("crew"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 0,
				props = {
					label = hash("btn_crew"),
					callback = hash("crew_pressed"),
					enabled = true
				},
			},
		}
	},
	[hash("orbit")] = {
		elements = {
			{
				id = hash("crew"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 0,
				props = {
					label = hash("btn_crew"),
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
					label = hash("btn_land"),
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
		size_x = 3.6,
		size_y = function() return #PLANET.get("recruits") end,
		elements = {
			{
				repeating = function() return #PLANET.get("recruits") end,
				type = hash("icon_face"),
				image = function(id) return PLANET.get("recruits")[id].face end,
				position_x = -1.6,
				position_y = 1,
				scale = vmath.vector3(2, 2, 2)
			},
			{
				repeating = function() return #PLANET.get("recruits") end,
				type = hash("label"),
				position_x = -1,
				position_y = 1,
				text = function(id) return STR.en.names[PLANET.get("recruits")[id].name.gender][PLANET.get("recruits")[id].name.key] end
			},
			{
				id = hash("recruit_interview"),
				repeating = function() return #PLANET.get("recruits") end,
				type = hash("button_main"),
				position_x = 0,
				position_y = 1,
				props = {
					label =  hash("btn_recruit_interview"),
					callback = hash("recruit_interview"),
					enabled = true
				},
			},
			{
				id = hash("recruit_hire"),
				repeating = function() return #PLANET.get("recruits") end,
				type = hash("button_main"),
				position_x = 1,
				position_y = 1,
				props = {
					label =  hash("btn_recruit_hire"),
					callback = hash("recruit_hire"),
					enabled = true
				},
			},
		}
	},

	[hash("crew_overview")] = {
		close_button = false,
		background = true,
		size_x = 5.5,
		size_y = function() return #CREW.list + 3 end,
		elements = {
			{
				type = hash("label"),
				position_x = -2,
				position_y = 1,
				text = hash("lbl_crew_name")
			},
			{
				type = hash("label"),
				position_x = -1,
				position_y = 1,
				text = hash("lbl_crew_role")
			},
			{
				type = hash("label"),
				position_x = 0,
				position_y = 1,
				text = hash("lbl_crew_duties")
			},
			{
				type = hash("label"),
				position_x = 1,
				position_y = 1,
				text = hash("lbl_crew_shipbound")
			},
			{
				repeating = function() return #CREW.list end,
				type = hash("icon_face"),
				image = function(id) return CREW.list[id].face end,
				position_x = -2.6,
				position_y = 2,
				scale = vmath.vector3(2, 2, 2)
			},
			{
				repeating = function() return #CREW.list end,
				type = hash("label"),
				position_x = -2,
				position_y = 2,
				text = function(id) return STR.en.names[CREW.list[id].name.gender][CREW.list[id].name.key] end
			},
			{
				id = hash("crew_role"),
				repeating = function() return #CREW.list end,
				type = hash("label"),
				position_x = -1,
				position_y = 2,
				text = function(id) return CREW.list[id].role end
			},
			{
				id = hash("crew_duty"),
				repeating = function() return #CREW.list end,
				type = hash("button_main"),
				position_x = 0,
				position_y = 2,
				props = {
					label = function(id) return CREW.list[id].duty or hash("btn_crew_duty_none") end,
					callback = hash("crew_duty"),
					enabled = true
				},
			},
			{
				id = hash("crew_shipbound"),
				repeating = function() return #CREW.list end,
				type = hash("button_main"),
				position_x = 1,
				position_y = 2,
				props = {
					label = function(id) if CREW.list[id].shipbound then return hash("btn_yes") else return hash("btn_no") end end,
					callback = hash("crew_shipbound"),
					enabled = true
				},
			},
			{
				id = hash("crew_talk"),
				repeating = function() return #CREW.list end,
				type = hash("button_main"),
				position_x = 2,
				position_y = 2,
				props = {
					label = hash("btn_crew_talk"),
					callback = hash("crew_talk"),
					enabled = true
				},
			},
			{
				type = hash("label"),
				position_x = 0,
				position_y = function() return #CREW.list + 2 end,
				text = function() return {hash("lbl_crew_leave_duration"), " ", TIME.get_time_string((STATS.leave_end or STATS.leave_duration_default + TIME.time) - TIME.time, false)} end
			},
			{
				type = hash("button_main"),
				position_x = 2.25,
				position_y = function() return #CREW.list + 2 end,
				props = {
					label = hash("btn_crew_set_leave"),
					callback = hash("crew_set_leave"),
					enabled = true
				},
			},
			{
				id = hash("crew_overview_confirm"),
				type = hash("button_main"),
				position_x = 0,
				position_y = function() return #CREW.list + 3 end,
				props = {
					label = hash("btn_crew_confirm"),
					callback = hash("crew_overview_confirm"),
					enabled = true
				},
			}
		}
	},
	[hash("crew_duty")] = {
		close_button = true,
		background = true,
		size_x = 3,
		size_y = 2,
		elements = {
			{
				id = hash("duty_guard"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 1,
				props = {
					label = hash("duty_guard"),
					callback = hash("crew_duty_guard"),
					enabled = true
				},
			},
			{
				id = hash("duty_repair"),
				type = hash("button_main"),
				position_x = 0,
				position_y = 1,
				props = {
					label = hash("duty_repair"),
					callback = hash("crew_duty_repair"),
					enabled = true
				},
			},
			{
				id = hash("duty_standby"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 1,
				props = {
					label = hash("duty_standby"),
					callback = hash("crew_duty_standby"),
					enabled = true
				},
			},
			{
				id = hash("duty_cleaning"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 2,
				props = {
					label = hash("duty_cleaning"),
					callback = hash("crew_duty_cleaning"),
					enabled = true
				},
			},
			{
				id = hash("duty_other"),
				type = hash("button_main"),
				position_x = 0,
				position_y = 2,
				props = {
					label = hash("duty_other"),
					callback = hash("crew_duty_other"),
					enabled = true
				},
			},
			{
				id = hash("duty_none"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 2,
				props = {
					label = hash("duty_none"),
					callback = hash("crew_duty_none"),
					enabled = true
				},
			},
		}
	},



	
	[hash("crew")] = {
		close_button = false,
		background = true,
		size_x = 6.5,
		size_y = function() return #CREW.list + 2 end,
		elements = {
			{
				type = hash("label"),
				position_x = -2.5,
				position_y = 1,
				text = hash("lbl_crew_name")
			},
			{
				type = hash("label"),
				position_x = -1.5,
				position_y = 1,
				text = hash("lbl_crew_role")
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 1,
				text = hash("lbl_crew_wage")
			},
			{
				type = hash("label"),
				position_x = 1.5,
				position_y = 1,
				text = hash("lbl_crew_earnings")
			},
			{
				type = hash("label"),
				position_x = 2.5,
				position_y = 1,
				text = function() return STATS.wage end
			},
			{
				repeating = function() return #CREW.list end,
				type = hash("icon_face"),
				image = function(id) return CREW.list[id].face end,
				position_x = -3.1,
				position_y = 2,
				scale = vmath.vector3(2, 2, 2)
			},
			{
				repeating = function() return #CREW.list end,
				type = hash("label"),
				position_x = -2.5,
				position_y = 2,
				text = function(id) return STR.en.names[CREW.list[id].name.gender][CREW.list[id].name.key] end
			},
			{
				id = hash("crew_role"),
				repeating = function() return #CREW.list end,
				type = hash("button_main"),
				position_x = -1.5,
				position_y = 2,
				props = {
					label = function(id) return CREW.list[id].role end,
					callback = hash("crew_role"),
					enabled = true
				},
			},
			{
				id = hash("crew_wage_plus"),
				repeating = function() return #CREW.list end,
				type = hash("button_tiny"),
				position_x = -0.8,
				position_y = 2,
				props = {
					label = hash("btn_crew_plus"),
					callback = hash("crew_wage_plus"),
					enabled = true
				},
			},
			{
				id = hash("crew_wage_label"),
				repeating = function() return #CREW.list end,
				type = hash("label"),
				position_x = -0.5,
				position_y = 2,
				text = function(id) return CREW.list[id].wage end
			},
			{
				id = hash("crew_wage_minus"),
				repeating = function() return #CREW.list end,
				type = hash("button_tiny"),
				position_x = -0.2,
				position_y = 2,
				props = {
					label = hash("btn_crew_minus"),
					callback = hash("crew_wage_minus"),
					enabled = true
				},
			},
			{
				id = hash("crew_background"),
				repeating = function() return #CREW.list end,
				type = hash("button_main"),
				position_x = 0.5,
				position_y = 2,
				props = {
					label = hash("btn_crew_background"),
					callback = hash("crew_background"),
					enabled = true
				},
			},
			{
				id = hash("crew_talk"),
				repeating = function() return #CREW.list end,
				type = hash("button_main"),
				position_x = 1.5,
				position_y = 2,
				props = {
					label = hash("btn_crew_talk"),
					callback = hash("crew_talk"),
					enabled = true
				},
			},
			{
				id = hash("crew_dismiss"),
				repeating = function() return #CREW.list end,
				type = hash("button_main"),
				position_x = 2.5,
				position_y = 2,
				props = {
					label = hash("btn_crew_dismiss"),
					callback = hash("crew_dismiss"),
					enabled = true
				},
			},
			{
				id = hash("crew_confirm"),
				type = hash("button_main"),
				position_x = 0,
				position_y = function() return #CREW.list + 2 end,
				props = {
					label = hash("btn_crew_confirm"),
					callback = hash("crew_confirm"),
					enabled = true
				},
			}
		}
	},
	[hash("crew_background")] = {
		background = true,
		size_x = 6,
		size_y = 7,
		elements = {
			{
				type = hash("textbox"),
				position_x = 0,
				position_y = 1,
				text = function(id) return {STR.en.names[CREW.list[id].name.gender][CREW.list[id].name.key], hash("talk_says")} end
			},
			{
				type = hash("textbox"),
				position_x = 0,
				position_y = 2.5,
				text = TALK.crew_about,
			},
			{
				type = hash("icon_face"),
				image = function(id) return CREW.list[id].face end,
				position_x = -2.5,
				position_y = 1,
				scale = vmath.vector3(4, 4, 4)
			},
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 7,
				props = {
					label = hash("btn_event_done"),
					callback = hash("close"),
					enabled = true
				},
			},
		}
	},
	[hash("crew_role")] = {
		close_button = true,
		background = true,
		size_x = 3,
		size_y = 2,
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
		size_x = 4,
		size_y = function() return #PLANET.get("jobs") + 1 end,
		elements = {
			{
				type = hash("label"),
				position_x = -1.5,
				position_y = 1,
				text = hash("lbl_jobs_type")
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 1,
				text = hash("lbl_jobs_region")
			},
			{
				type = hash("label"),
				position_x = 0.5,
				position_y = 1,
				text = hash("lbl_jobs_wage")
			},
			{
				repeating = function() return #PLANET.get("jobs") end,
				type = hash("label"),
				position_x = -1.5,
				position_y = 2,
				text = function(id) return PLANET.get("jobs")[id].type end
			},
			{
				repeating = function() return #PLANET.get("jobs") end,
				type = hash("label"),
				position_x = -0.5,
				position_y = 2,
				text = function(id) return PLANET.get("region", PLANET.get("jobs")[id].planet_id) end
			},
			{
				repeating = function() return #PLANET.get("jobs") end,
				type = hash("label"),
				position_x = 0.5,
				position_y = 2,
				text = function(id) return PLANET.get("jobs")[id].wage end
			},
			{
				repeating = function() return #PLANET.get("jobs") end,
				type = hash("button_main"),
				position_x = 1.5,
				position_y = 2,
				props = {
					label = hash("btn_jobs_accept"),
					callback = hash("jobs_accept"),
					enabled = true
				},
			},
		}
	},
	[hash("travel")] = {
		close_button = true,
		background = true,
		size_x = 3,
		size_y = 3,
		elements = {
			{
				id = hash("explore_core"),
				type = hash("button_main"),
				position_x = 0,
				position_y = 1,
				props = {
					label = hash("btn_travel_explore"),
					callback = hash("travel_destination_pressed"),
					enabled = true,
					id = 1
				},
			},
			{
				id = hash("explore_frontier"),
				type = hash("button_main"),
				position_x = 0,
				position_y = 2,
				props = {
					label = hash("btn_travel_explore"),
					callback = hash("travel_destination_pressed"),
					enabled = true,
					id = 2
				},
			},
			{
				id = hash("explore_rim"),
				type = hash("button_main"),
				position_x = 0,
				position_y = 3,
				props = {
					label = hash("btn_travel_explore"),
					callback = hash("travel_destination_pressed"),
					enabled = true,
					id = 3
				},
			},
			{
				id = hash("core"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 1,
				props = {
					label = hash("btn_travel_mission"),
					callback = hash("travel_destination_pressed"),
					enabled = false,
					id = 4
				},
			},
			{
				id = hash("frontier"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 2,
				props = {
					label = hash("btn_travel_mission"),
					callback = hash("travel_destination_pressed"),
					enabled = false,
					id = 5
				},
			},
			{
				id = hash("rim"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 3,
				props = {
					label = hash("btn_travel_mission"),
					callback = hash("travel_destination_pressed"),
					enabled = false,
					id = 6
				},
			},
			{
				type = hash("label"),
				position_x = -1,
				position_y = 1,
				text = hash("lbl_travel_core")
			},
			{
				type = hash("label"),
				position_x = -1,
				position_y = 2,
				text = hash("lbl_travel_frontier")
			},
			{
				type = hash("label"),
				position_x = -1,
				position_y = 3,
				text = hash("lbl_travel_rim")
			},
		}
	},
	[hash("travel_confirm")] = {
		background = true,
		close_button = false,
		size_x = 4,
		size_y = 3,
		elements = {
			{
				type = hash("label"),
				position_x = 0,
				position_y = 1,
				text = {hash("lbl_travel_destination"),
				function()
					local type
					if STATS.destination.job_id then type = hash("mission") else type = hash("exploration") end
					return type, hash("lbl_travel_in_the"), STATS.destination.region end}
			},
			{
				type = hash("label"),
				position_x = 0,
				position_y = 2,
				text = {hash("lbl_travel_departure"), function() return TIME.get_time_string(STATS.destination.time - TIME.time, false) end}
			},
			{
				id = hash("travel_set_time"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 3,
				props = {
					label = hash("btn_travel_set_time"),
					callback = hash("travel_set_time"),
					enabled = true
				},
			},
			{
				id = hash("travel_cancel"),
				type = hash("button_main"),
				position_x = 0,
				position_y = 3,
				props = {
					label = hash("btn_cancel"),
					callback = hash("travel_cancel"),
					enabled = true
				},
			},
			{
				id = hash("travel_accept"),
				type = hash("button_main"),
				position_x = 1,
				position_y = 3,
				props = {
					label = hash("btn_accept"),
					callback = hash("travel_accept"),
					enabled = true
				},
			},
		}
	},
	[hash("job_selection")] = {
		background = true,
		close_button = true,
		size_x = 4,
		size_y = function() return #STATS.jobs[STATS.destination.region] + 1 end,
		elements = {
			{
				type = hash("label"),
				position_x = -1.5,
				position_y = 1,
				text = hash("lbl_jobs_type")
			},
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 1,
				text = hash("lbl_jobs_planet")
			},
			{
				type = hash("label"),
				position_x = 0.5,
				position_y = 1,
				text = hash("lbl_jobs_wage")
			},
			{
				repeating = function() return #STATS.jobs[STATS.destination.region] end,
				type = hash("label"),
				position_x = -1.5,
				position_y = 2,
				text = function(id) return STATS.jobs[STATS.destination.region][id].type end
			},
			{
				repeating = function() return #STATS.jobs[STATS.destination.region] end,
				type = hash("label"),
				position_x = -0.5,
				position_y = 2,
				text = function(id) return PLANET.get("name", STATS.jobs[STATS.destination.region][id].planet_id) end
			},
			{
				repeating = function() return #STATS.jobs[STATS.destination.region] end,
				type = hash("label"),
				position_x = 0.5,
				position_y = 2,
				text = function(id) return STATS.jobs[STATS.destination.region][id].wage end
			},
			{
				repeating = function() return #STATS.jobs[STATS.destination.region] end,
				type = hash("button_main"),
				position_x = 1.5,
				position_y = 2,
				props = {
					label = hash("btn_jobs_accept"),
					callback = hash("job_selected"),
					enabled = true
				},
			},
		}
	},
	[hash("cargo_overview")] = {
		background = true,
		close_button = true,
		size_x = 4,
		size_y = function() local count = 0; for key in pairs(CARGO.goods) do count = count + 1 end; return count + 3 end,
		elements = {
			{
				type = hash("label"),
				position_x = -0.5,
				position_y = 1,
				text = hash("lbl_cargo_type")
			},
			{
				type = hash("label"),
				position_x = 0.5,
				position_y = 1,
				text = hash("lbl_cargo_number")
			},
			{
				type = hash("icon_crate"),
				repeating = function() local count = 0; for key in pairs(CARGO.goods) do count = count + 1 end; return count end,
				image = function(id) local count = 0; for x = 1, CARGO.max_storage do if CARGO.goods[x] then count = count + 1 end; if count == id then count = x break end; end; return CARGO.goods[count].props end,
				position_x = -1.5,
				position_y = 2,
				scale = vmath.vector3(2, 2, 2)
			},
			{
				repeating = function() local count = 0; for key in pairs(CARGO.goods) do count = count + 1 end; return count end,
				type = hash("label"),
				position_x = -0.5,
				position_y = 2,
				text = "Unknown",
			},
			{
				repeating = function() local count = 0; for key in pairs(CARGO.goods) do count = count + 1 end; return count end,
				type = hash("label"),
				position_x = 0.5,
				position_y = 2,
				text = function(id) local count = 0; for x = 1, CARGO.max_storage do if CARGO.goods[x] then count = count + 1 end; if count == id then count = x break end; end; return #CARGO.goods[count].crates end,
			},
			{
				type = hash("button_main"),
				repeating = function() local count = 0; for key in pairs(CARGO.goods) do count = count + 1 end; return count end,
				position_x = 1.5,
				position_y = 2,
				props = {
					label = hash("btn_jettison_cargo"),
					callback = hash("jettison_cargo"),
					enabled = false
				},
			},
			{
				type = hash("progress_bar"),
				position_x = 0,
				position_y = function() local count = 0; for key in pairs(CARGO.goods) do count = count + 1 end; return count + 2 end,
				props = {
					max = function() return CARGO.max_storage end,
					current = function() return CARGO.max_storage - CARGO.empty end,
					size = 1
				},
			},
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = function() local count = 0; for key in pairs(CARGO.goods) do count = count + 1 end; return count + 3 end,
				props = {
					label = hash("btn_ok"),
					callback = hash("close"),
					enabled = true
				},
			},
		}
	},
	[hash("comms_flight")] = {
		background = true,
		close_button = true,
		size_x = 2,
		size_y = 2,
		elements = {
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 2,
				props = {
					label = hash("btn_comms_distress_signal"),
					callback = hash("comms_flight_distress_pressed"),
					enabled = false
				}
			},
		}
	},
	[hash("assign_room")] = {
		background = true,
		close_button = true,
		size_x = 3,
		size_y = function() return #CREW.list + 1 end,
		elements = {
			{
				type = hash("button_main"),
				position_x = -1,
				position_y = 1,
				props = {
					label = hash("empty"),
					callback = hash("assign_room_empty"),
					enabled = true
				}
			},
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 1,
				props = {
					label = hash("medbay"),
					callback = hash("assign_room_medbay"),
					enabled = true
				}
			},
			{
				type = hash("button_main"),
				position_x = 1,
				position_y = 1,
				props = {
					label = hash("mess"),
					callback = hash("assign_room_mess"),
					enabled = false
				}
			},
			{
				repeating = function() return #CREW.list end,
				type = hash("icon_face"),
				image = function(id) return CREW.list[id].face end,
				position_x = -1.5,
				position_y = 2,
				scale = vmath.vector3(2, 2, 2)
			},
			{
				repeating = function() return #CREW.list end,
				type = hash("label"),
				position_x = -1,
				position_y = 2,
				text = function(id) return STR.en.names[CREW.list[id].name.gender][CREW.list[id].name.key] end
			},
			{
				id = hash("crew_role"),
				repeating = function() return #CREW.list end,
				type = hash("label"),
				position_x = 0,
				position_y = 2,
				text = function(id) return CREW.list[id].role end
			},
			{
				type = hash("button_main"),
				repeating = function() return #CREW.list end,
				position_x = 1,
				position_y = 2,
				props = {
					label = hash("bunk"),
					callback = hash("assign_room_bunk"),
					enabled = true
				}
			},
		}
	},
	[hash("cargo_overview_empty")] = {
		background = true,
		close_button = true,
		size_x = 4,
		size_y = 2,
		elements = {
			{
				type = hash("progress_bar"),
				position_x = 0,
				position_y = 1,
				props = {
					max = function() return CARGO.max_storage end,
					current = function() return CARGO.max_storage - CARGO.empty end,
					size = 1
				},
			},
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 2,
				props = {
					label = hash("btn_ok"),
					callback = hash("close"),
					enabled = true
				},
			}
		}
	},
	[hash("event")] = {
		background = true,
		size_x = 6,
		size_y = function() return #EVENT.links + 4 end,
		elements = {
			{
				type = hash("textbox"),
				position_x = 0,
				position_y = 1,
				text = function() return EVENT.current[EVENT.stage].text end
			},
			{
				id = hash("event_option"),
				repeating = function() return #EVENT.links end,
				type = hash("button_option"),
				position_x = 0,
				position_y = 5,
				props = {
					label = function(id) return EVENT.links[id].text end,
					callback = hash("event_option"),
					enabled = true
				},
			},
		}
	},
	[hash("event_end")] = {
		background = true,
		size_x = 6,
		size_y = 5,
		elements = {
			{
				type = hash("textbox"),
				position_x = 0,
				position_y = 1,
				text = function() return EVENT.current[EVENT.stage].text end
			},
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 5,
				props = {
					label = hash("btn_event_done"),
					callback = hash("event_end"),
					enabled = true
				},
			},
		}
	},
	[hash("talk")] = {
		background = true,
		size_x = 6,
		size_y = function() return #TALK.links + 7 end,
		elements = {
			{
				type = hash("textbox"),
				position_x = 0,
				position_y = 1,
				text = function(id) return {STR.en.names[TALK.speaker.name.gender][TALK.speaker.name.key], hash("talk_says")} end
			},
			{
				type = hash("icon_face"),
				image = function(id) return TALK.speaker.face end,
				position_x = -2.5,
				position_y = 1,
				scale = vmath.vector3(4, 4, 4)
			},
			{
				type = hash("textbox"),
				position_x = 0,
				position_y = 2.5,
				text = function() return TALK.text(TALK.current[TALK.stage].text) end
			},
			{
				id = hash("talk_option"),
				repeating = function() return #TALK.links end,
				type = hash("button_option"),
				position_x = 0,
				position_y = 8,
				props = {
					label = function(id) return TALK.links[id].text end,
					callback = hash("talk_option"),
					enabled = true
				},
			},
		}
	},
	[hash("talk_end")] = {
		background = true,
		size_x = 6,
		size_y = 6,
		elements = {
			{
				type = hash("textbox"),
				position_x = 0,
				position_y = 1,
				text = function(id) return {STR.en.names[TALK.speaker.name.gender][TALK.speaker.name.key], hash("talk_says")} end
			},
			{
				type = hash("icon_face"),
				image = function(id) return TALK.speaker.face end,
				position_x = -2.5,
				position_y = 1,
				scale = vmath.vector3(4, 4, 4)
			},
			{
				type = hash("textbox"),
				position_x = 0,
				position_y = 2.5,
				text = function() return TALK.text(TALK.current[TALK.stage].text) end
			},
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 6,
				props = {
					label = hash("btn_event_done"),
					callback = hash("talk_end"),
					enabled = true
				},
			},
		}
	},
	[hash("talk_pick_role")] = {
		close_button = false,
		background = true,
		size_x = 3,
		size_y = 2,
		elements = {
			{
				id = hash("crew_role_pilot"),
				type = hash("button_main"),
				position_x = -1,
				position_y = 1,
				props = {
					label = hash("role_pilot"),
					callback = hash("talk_role_pilot"),
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
					callback = hash("talk_role_engineer"),
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
					callback = hash("talk_role_comms"),
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
					callback = hash("talk_role_medic"),
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
					callback = hash("talk_role_gunner"),
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
					callback = hash("talk_role_none"),
					enabled = true
				},
			},
		}
	},
	[hash("error")] = {
		close_button = true,
		background = true,
		size_x = 3,
		size_y = 1,
		elements = {
			{
				type = hash("button_main"),
				position_x = 0,
				position_y = 1,
				props = {
					label = hash("btn_error_ok"),
					callback = hash("close"),
					enabled = true
				},
			},
		}
	},
	[hash("time_choice")] = {
		close_button = false,
		background = true,
		size_x = 9,
		size_y = 3,
		elements = {
			{
				type = hash("time_slider"),
				position_x = 0,
				position_y = 2
			},
			{
				type = hash("button_main"),
				position_x = -0.5,
				position_y = 3,
				props = {
					label = hash("btn_accept"),
					callback = hash("time_choice_accept"),
					enabled = true
				},
			},
			{
				type = hash("button_main"),
				position_x = 0.5,
				position_y = 3,
				props = {
					label = hash("btn_cancel"),
					callback = hash("time_choice_cancel"),
					enabled = true
				},
			},
			
		}
	},
}

return LAY