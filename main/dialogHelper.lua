local M = {}
local CON = require("main.constants")

local size = {
	travel = {x = 250, y = 150},
	recruit = {x = 400, y = 200},
	buy = {x = 400, y = 200},
	action = {x = 640, y = 64},
	info = {x = 256, y = 96}
}

local pos = {
	travel = {x = 640, y = 360},
	recruit = {x = 640, y = 360},
	buy = {x = 640, y = 360},
	action = {x = 640, y = 50},
	info = {x = 1280, y = 710}
}

local pivot = {
	info = gui.PIVOT_NE
}

function M.newDialog(kind)
	local dialog = {lbl = {}, btn = {}}
	dialog.frame = gui.new_box_node(vmath.vector3(pos[kind].x, pos[kind].y, 0), vmath.vector3(size[kind].x, size[kind].y, 0))
	gui.set_scale(dialog.frame, vmath.vector3(2, 2, 1))
	gui.set_texture(dialog.frame, hash("dialog"))
	gui.set_slice9(dialog.frame, vmath.vector4(32, 32, 32, 32))
	gui.set_enabled(dialog.frame, false)
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
		dialog.lbl = {
			title = gui.new_text_node(vmath.vector3(0, 86, 0), "RECRUIT"),
			nobody = gui.new_text_node(vmath.vector3(0, 0, 0), "There are no recruits available.")
		}
		dialog.btn = {
			confirm = gui.new_text_node(vmath.vector3(-50, -70, 0), "HIRE"),
			cancel = gui.new_text_node(vmath.vector3(50, -70, 0), "CLOSE")
		}
		for x = 1, 5 do
			dialog.btn[x] = {
				face = gui.new_box_node(vmath.vector3(-180, 90 - 20 * x, 0), vmath.vector3(16, 16, 0)),
				name = gui.new_text_node(vmath.vector3(-160, 90 - 20 * x, 0), "Recruit name")
			}
			gui.set_texture(dialog.btn[x].face, hash("faces"))
			gui.set_parent(dialog.btn[x].face, dialog.frame)
			gui.set_parent(dialog.btn[x].name, dialog.frame)
			gui.set_pivot(dialog.btn[x].name, gui.PIVOT_W)
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
	elseif kind == "action" then
		gui.set_scale(dialog.frame, vmath.vector3(1, 1, 1))
		gui.set_enabled(dialog.frame, true)
		dialog.btn = {
			buy = gui.new_text_node(vmath.vector3(-270, 6, 0), "BUY"),
			repair = gui.new_text_node(vmath.vector3(-200, 6, 0), "REPAIR"),
			upgrade = gui.new_text_node(vmath.vector3(-130, 6, 0), "UPGRADE"),
			recruit = gui.new_text_node(vmath.vector3(-60, 6, 0), "RECRUIT"),
			work = gui.new_text_node(vmath.vector3(10, 6, 0), "JOBS"),
			travel = gui.new_text_node(vmath.vector3(80, 6, 0), "TRAVEL")
		}
	elseif kind == "info" then
		gui.set_scale(dialog.frame, vmath.vector3(1, 1, 1))
		gui.set_enabled(dialog.frame, true)

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
	end

	for key, val in pairs(dialog.lbl) do
		gui.set_parent(val, dialog.frame)
		gui.set_layer(val, "dialog")
	end

	for key, val in pairs(dialog.btn) do
		if type(val) == "userdata" then
			gui.set_parent(val, dialog.frame)
			gui.set_layer(val, "dialog")
		end
	end
	return dialog
end

return M