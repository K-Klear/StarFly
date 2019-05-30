local M = {}

local sizeX = {
	travel = 250,
	recruit = 400,
	buy = 400,
}

local sizeY = {
	travel = 150,
	recruit = 200,
	buy = 200,
}

function M.newDialog(kind)
	local dialog = {}
	dialog.frame = gui.new_box_node(vmath.vector3(640, 360, 0), vmath.vector3(sizeX[kind], sizeY[kind], 0))
	gui.set_scale(dialog.frame, vmath.vector3(2, 2, 1))
	gui.set_texture(dialog.frame, hash("dialog"))
	gui.set_slice9(dialog.frame, vmath.vector4(32, 32, 32, 32))
	gui.set_enabled(dialog.frame, true)

	if kind == "travel" then
		dialog.lbl = {title = gui.new_text_node(vmath.vector3(0, 60, 0), "TRAVEL")}
		dialog.btn = {
			confirm = gui.new_text_node(vmath.vector3(-50, -44, 0), "CONFIRM"),
			cancel = gui.new_text_node(vmath.vector3(50, -44, 0), "CLOSE")
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
			title = gui.new_text_node(vmath.vector3(0, 86, 0), "RESTOCK")
			
		}
		dialog.btn = {
			confirm = gui.new_text_node(vmath.vector3(-50, -70, 0), "HIRE"),
			cancel = gui.new_text_node(vmath.vector3(50, -70, 0), "CLOSE")
		}
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