local M = {}
local CON = require("main.constants")

local size = {
	travel = {x = 250, y = 150},
	recruit = {x = 400, y = 200},
	buy = {x = 400, y = 200},
	action = {x = 640, y = 64},
	action_travel = {x = 640, y = 64},
	action_orbit = {x = 640, y = 64},
	info = {x = 256, y = 96},
	warning = {x = 280, y = 88},
	crew = {x = 474, y = 280},
	work = {x = 300, y = 188},
	speech = {x = 384, y = 318},
	event = {x = 384, y = 318},
}

local pos = {
	travel = {x = 640, y = 460},
	recruit = {x = 640, y = 460},
	buy = {x = 640, y = 460},
	action = {x = 640, y = 50},
	action_travel = {x = 640, y = 50},
	action_orbit = {x = 640, y = 50},
	info = {x = 1280, y = 890},
	warning = {x = 640, y = 460},
	crew = {x = 640, y = 460},
	work = {x = 640, y = 460},
	speech = {x = 640, y = 480},
	event = {x = 640, y = 480},
}

local pivot = {
	info = gui.PIVOT_NE
}

function M.newDialog(kind, show)
	local dialog = {lbl = {}, btn = {}}
	dialog.frame = gui.new_box_node(vmath.vector3(pos[kind].x, pos[kind].y, 0), vmath.vector3(size[kind].x, size[kind].y, 0))
	gui.set_scale(dialog.frame, vmath.vector3(2, 2, 1))
	gui.set_texture(dialog.frame, hash("dialog"))
	gui.set_slice9(dialog.frame, vmath.vector4(32, 32, 32, 32))
	gui.set_enabled(dialog.frame, show)
	gui.set_pivot(dialog.frame, pivot[kind] or gui.PIVOT_CENTER)

	if kind == "travel" then
		dialog.lbl = {
			title = gui.new_text_node(vmath.vector3(0, 60, 0), "TRAVEL"),
			core = gui.new_text_node(vmath.vector3(-118, 40, 0), "CORE WORLDS"),
			frontier = gui.new_text_node(vmath.vector3(-118, 20, 0), "FRONTIER"),
			rim = gui.new_text_node(vmath.vector3(-118, 0, 0), "OUTER RIM"),
		}
		for key, val in pairs(dialog.lbl) do
			gui.set_pivot(val, gui.PIVOT_W)
		end
		gui.set_pivot(dialog.lbl.title, gui.PIVOT_CENTER)
		dialog.btn = {
			confirm = gui.new_text_node(vmath.vector3(-50, -44, 0), "CONFIRM"),
			cancel = gui.new_text_node(vmath.vector3(50, -44, 0), "CLOSE"),
			exploreCore = gui.new_text_node(vmath.vector3(5, 40, 0), "EXPLORE"),
			exploreFrontier = gui.new_text_node(vmath.vector3(5, 20, 0), "EXPLORE"),
			exploreRim = gui.new_text_node(vmath.vector3(5, 0, 0), "EXPLORE"),
			missionCore = gui.new_text_node(vmath.vector3(70, 40, 0), "MISSION"),
			missionFrontier = gui.new_text_node(vmath.vector3(70, 20, 0), "MISSION"),
			missionRim = gui.new_text_node(vmath.vector3(70, 0, 0), "MISSION"),
		}
	elseif kind == "recruit" then
		dialog.ico = {}
		dialog.lbl = {
			title = gui.new_text_node(vmath.vector3(0, 86, 0), "RECRUIT"),
			nobody = gui.new_text_node(vmath.vector3(0, 0, 0), "There are no recruits available.")
		}
		dialog.btn = {
			confirm = gui.new_text_node(vmath.vector3(-50, -70, 0), "HIRE"),
			cancel = gui.new_text_node(vmath.vector3(50, -70, 0), "CLOSE")
		}
		for x = 1, 5 do
			dialog.btn["recruit"..x] = gui.new_text_node(vmath.vector3(-160, 88 - 20 * x, 0), "Recruit name")
			gui.set_pivot(dialog.btn["recruit"..x], gui.PIVOT_W)
			dialog.btn["about"..x] = gui.new_text_node(vmath.vector3(-40, 88 - 20 * x, 0), "ABOUT")
			dialog.btn["skills"..x] = gui.new_text_node(vmath.vector3(20, 88 - 20 * x, 0), "SKILLS")
		end
	elseif kind == "buy" then
		dialog.lbl = {
			title = gui.new_text_node(vmath.vector3(0, 86, 0), "RESTOCK"),
			fuel = gui.new_text_node(vmath.vector3(-150, 70, 0), "FUEL: "),
			fuelAmount = gui.new_text_node(vmath.vector3(-50, 70, 0), "XXX"),
			fuelPrice = gui.new_text_node(vmath.vector3(100, 70, 0), "@ ".."XXX".." cr/unit."),
			rations = gui.new_text_node(vmath.vector3(-150, 50, 0), "RATIONS: "),
			rationsAmount = gui.new_text_node(vmath.vector3(-50, 50, 0), "XXX"),
			rationsPrice = gui.new_text_node(vmath.vector3(100, 50, 0), "@ ".."XXX".." cr/unit."),
			totalLbl = gui.new_text_node(vmath.vector3(150, -50, 0), "TOTAL"),
			totalPrice = gui.new_text_node(vmath.vector3(150, -70, 0), "XXX"),
		}
		dialog.btn = {
			confirm = gui.new_text_node(vmath.vector3(-50, -70, 0), "PURCHASE"),
			cancel = gui.new_text_node(vmath.vector3(50, -70, 0), "CANCEL"),
			fuelPlus = gui.new_text_node(vmath.vector3(-65, 70, 0), "+"),
			fuelMinus = gui.new_text_node(vmath.vector3(-35, 70, 0), "-"),
			rationsPlus = gui.new_text_node(vmath.vector3(-65, 50, 0), "+"),
			rationsMinus = gui.new_text_node(vmath.vector3(-35, 50, 0), "-"),
		}
	elseif kind == "work" then
		dialog.lbl = {
			title = gui.new_text_node(vmath.vector3(0, 76, 0), "AVAILABLE JOBS"),
			type = gui.new_text_node(vmath.vector3(-120, 56, 0), "TYPE"),
			target = gui.new_text_node(vmath.vector3(10, 56, 0), "REGION"),
			wage = gui.new_text_node(vmath.vector3(80, 56, 0), "WAGE"),
			none = gui.new_text_node(vmath.vector3(0, 0, 0), "There are no missions available.")
		}
		dialog.btn = {
			confirm = gui.new_text_node(vmath.vector3(-50, -66, 0), "ACCEPT"),
			cancel = gui.new_text_node(vmath.vector3(50, -66, 0), "CANCEL"),
		}
		for x = 1, 5 do
			dialog.btn[x] = {
				type = gui.new_text_node(vmath.vector3(-136, 54 - 20 * x, 0), "Assassination"),
				target = gui.new_text_node(vmath.vector3(-20, 54 - 20 * x, 0), "Frontier"),
				wage = gui.new_text_node(vmath.vector3(60, 54 - 20 * x, 0), "2000")
			}
			gui.set_parent(dialog.btn[x].type, dialog.frame)
			gui.set_parent(dialog.btn[x].target, dialog.frame)
			gui.set_parent(dialog.btn[x].wage, dialog.frame)
			gui.set_pivot(dialog.btn[x].type, gui.PIVOT_W)
			gui.set_pivot(dialog.btn[x].target, gui.PIVOT_W)
			gui.set_pivot(dialog.btn[x].wage, gui.PIVOT_W)
		end
		
	elseif kind == "action" then
		gui.set_scale(dialog.frame, vmath.vector3(1, 1, 1))
		dialog.btn = {
			buy = gui.new_text_node(vmath.vector3(-270, 6, 0), "BUY"),
			repair = gui.new_text_node(vmath.vector3(-200, 6, 0), "REPAIR"),
			upgrade = gui.new_text_node(vmath.vector3(-130, 6, 0), "UPGRADE"),
			recruit = gui.new_text_node(vmath.vector3(-60, 6, 0), "RECRUIT"),
			crew = gui.new_text_node(vmath.vector3(10, 6, 0), "CREW"),
			work = gui.new_text_node(vmath.vector3(80, 6, 0), "JOBS"),
			travel = gui.new_text_node(vmath.vector3(150, 6, 0), "TRAVEL")
		}
	elseif kind == "action_travel" then
		gui.set_scale(dialog.frame, vmath.vector3(1, 1, 1))
		dialog.btn = {
			destination = gui.new_text_node(vmath.vector3(-80, 6, 0), "CHANGE DESTINATION"),
			proceed = gui.new_text_node(vmath.vector3(80, 6, 0), "PROCEED")
		}
	elseif kind == "action_orbit" then
		gui.set_scale(dialog.frame, vmath.vector3(1, 1, 1))
		dialog.btn = {
			destination = gui.new_text_node(vmath.vector3(-80, 6, 0), "CHANGE DESTINATION"),
			land = gui.new_text_node(vmath.vector3(80, 6, 0), "LAND")
		}
	elseif kind == "info" then
		gui.set_scale(dialog.frame, vmath.vector3(1, 1, 1))
		dialog.lbl = {
			fuel = gui.new_text_node(vmath.vector3(-32, -20, 0), "FUEL: XX"),
			rations = gui.new_text_node(vmath.vector3(-32, -40, 0), "RATIONS: XX"),
			money = gui.new_text_node(vmath.vector3(-32, -60, 0), "CREDITS: XXXXX"),
			region = gui.new_text_node(vmath.vector3(-240, -20, 0), "region"),
			settlement = gui.new_text_node(vmath.vector3(-240, -40, 0), "settlement"),
			government = gui.new_text_node(vmath.vector3(-240, -60, 0), "government")
		}
		gui.set_pivot(dialog.lbl.fuel, gui.PIVOT_E)
		gui.set_pivot(dialog.lbl.rations, gui.PIVOT_E)
		gui.set_pivot(dialog.lbl.money, gui.PIVOT_E)
		gui.set_pivot(dialog.lbl.region, gui.PIVOT_W)
		gui.set_pivot(dialog.lbl.settlement, gui.PIVOT_W)
		gui.set_pivot(dialog.lbl.government, gui.PIVOT_W)
	elseif kind == "crew" then
		dialog.ico = {}
		dialog.lbl = {
			title = gui.new_text_node(vmath.vector3(0, 124, 0), "CREW"),
			name = gui.new_text_node(vmath.vector3(-176, 104, 0), "NAME"),
			role = gui.new_text_node(vmath.vector3(-90, 104, 0), "ROLE"),
			wage = gui.new_text_node(vmath.vector3(-30, 104, 0), "WAGE"),
			ask = gui.new_text_node(vmath.vector3(70, 104, 0), "ASK THEM ABOUT:"),
			remainder = gui.new_text_node(vmath.vector3(-70, -96, 0), "EARNINGS: 100%"),
		}
		dialog.btn = {
			close = gui.new_text_node(vmath.vector3(170, -96, 0), "CLOSE")
		}
		for x = 1, 9 do
			dialog.lbl[x] = {
				name = gui.new_text_node(vmath.vector3(-196, 104 - 20 * x, 0), "Crewman"),
				wage = gui.new_text_node(vmath.vector3(-30, 104 - 20 * x, 0), "10%")
			}
			dialog.btn[x] = {
				role = gui.new_text_node(vmath.vector3(-90, 104 - 20 * x, 0), "Engineer"),
				background = gui.new_text_node(vmath.vector3(40, 104 - 20 * x, 0), "BACKGROUND"),
				skills = gui.new_text_node(vmath.vector3(110, 104 - 20 * x, 0), "SKILLS"),
				dismiss = gui.new_text_node(vmath.vector3(170, 104 - 20 * x, 0), "DISMISS"),
				wage_up = gui.new_text_node(vmath.vector3(-48, 104 - 20 * x, 0), "+"),
				wage_down = gui.new_text_node(vmath.vector3(-12, 104 - 20 * x, 0), "-")
			}
			gui.set_pivot(dialog.lbl[x].name, gui.PIVOT_W)
		end
	elseif kind == "warning" then
		dialog.lbl = {
			text = gui.new_text_node(vmath.vector3(0, 20, 0), "You can't leave without fuel!")
		}
		dialog.btn = {
			confirm = gui.new_text_node(vmath.vector3(0, -10, 0), "OK")
		}
	elseif kind == "speech" then
		dialog.lbl = {
			name = gui.new_text_node(vmath.vector3(0, 132, 0), "Name of talker says:"),
			text = gui.new_text_node(vmath.vector3(0, 0, 0), "Blah blah blah blah. Blah blah blah blah. Blah blah blah blah. Blah blah blah blah.")
		}
		gui.set_size(dialog.lbl.text, vmath.vector3(300, 100, 0))
		gui.set_line_break(dialog.lbl.text, true)
		
		dialog.btn = {
			reply1 = gui.new_text_node(vmath.vector3(-80, -126, 0), "OK"),
			reply2 = gui.new_text_node(vmath.vector3(0, -126, 0), "NO!"),
			reply3 = gui.new_text_node(vmath.vector3(80, -126, 0), "Whatever.")
		}
		dialog.ico = {}
	elseif kind == "event" then
		dialog.lbl = {
			title = gui.new_text_node(vmath.vector3(0, 132, 0), "HOLY SHIT! THE SHIP IS ON FIRE!"),
			description = gui.new_text_node(vmath.vector3(0, 0, 0), "So some asshole decided to have a smoke. When the smoke alarm started blaring, he panicked and ran into a closed door. That pissed him off so he set a fire in revenge.")
		}
		for x = 1, 6 do gui.set_text(dialog.lbl.description, gui.get_text(dialog.lbl.description).."BLAH BLAH BLAGH!") end
		gui.set_size(dialog.lbl.description, vmath.vector3(340, 100, 0))
		gui.set_line_break(dialog.lbl.description, true)
		dialog.btn = {
			option1 = gui.new_text_node(vmath.vector3(-80, -126, 0), "EXTINGUISH IT"),
			option2 = gui.new_text_node(vmath.vector3(80, -126, 0), "NO WATER"),
			option3 = gui.new_text_node(vmath.vector3(0, -126, 0), "LET IT BURN")
		}
	end

	
	for key, val in pairs(dialog.lbl) do
		if type(val) == "table" then
			for k, v in pairs(val) do
				gui.set_parent(v, dialog.frame)
				gui.set_layer(v, "dialog")
			end
		else
			gui.set_parent(val, dialog.frame)
			gui.set_layer(val, "dialog")
		end
	end

	for key, val in pairs(dialog.btn) do
		if type(val) == "table" then
			for k, v in pairs(val) do
				gui.set_parent(v, dialog.frame)
				gui.set_layer(v, "dialog")
			end
		else
			gui.set_parent(val, dialog.frame)
			gui.set_layer(val, "dialog")
		end
	end
	return dialog
end

return M