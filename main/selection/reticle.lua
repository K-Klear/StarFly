local RET = {buttons = {}}
local button_count = 2

local button_offset = {
	vmath.vector3(-12, 64, 0),
	vmath.vector3(48, 64, 0)
}

local button_pivot = {
	gui.PIVOT_E,
	gui.PIVOT_W
}


function RET.setup()
	RET.frame = gui.new_box_node(vmath.vector3(1, 1, 1), vmath.vector3(1, 1, 1))
	gui.set_pivot(RET.frame, gui.PIVOT_SW)
	gui.set_texture(RET.frame, hash("selection"))
	gui.set_slice9(RET.frame, vmath.vector4(1, 1, 2, 2))

	RET.frame_permanent = gui.new_box_node(vmath.vector3(1, 1, 1), vmath.vector3(1, 1, 1))
	gui.set_pivot(RET.frame_permanent, gui.PIVOT_SW)
	gui.set_texture(RET.frame_permanent, hash("selection_permanent"))
	gui.set_slice9(RET.frame_permanent, vmath.vector4(1, 1, 2, 2))

	for x = 1, button_count do
		RET.buttons[x] = {
			text = gui.new_text_node(vmath.vector3(1, 1, 1), ""),
			box = gui.new_box_node(vmath.vector3(1, 1, 1), vmath.vector3(1, 1, 1))
		}
		gui.set_pivot(RET.buttons[x].text, button_pivot[x])
		gui.set_texture(RET.buttons[x].box, hash("selection"))
		gui.set_slice9(RET.buttons[x].box, vmath.vector4(1, 1, 2, 2))
		gui.set_pivot(RET.buttons[x].box, button_pivot[x])
		gui.set_enabled(RET.buttons[x].box, false)
		gui.set_enabled(RET.buttons[x].text, false)
	end
end

function RET.show(position, size, target)
	size = size or vmath.vector3(64, 128, 0)
	gui.set_position(RET.frame, position)
	gui.set_size(RET.frame, size)
	gui.set_enabled(RET.frame, true)
	RET.target = target
end

function RET.show_permanent(position, size, target, buttons)
	size = size or vmath.vector3(40, 78, 0)
	gui.set_position(RET.frame_permanent, position)
	gui.set_size(RET.frame_permanent, size)
	gui.set_enabled(RET.frame_permanent, true)
	for x = 1, #buttons do
		gui.set_text(RET.buttons[x].text, buttons[x].text)
		gui.set_enabled(RET.buttons[x].text, true)
		gui.set_enabled(RET.buttons[x].box, true)
		gui.set_size(RET.buttons[x].box, gui.get_size(RET.buttons[x].text))
		gui.set_position(RET.buttons[x].text, gui.get_position(RET.frame_permanent) + button_offset[x])
		gui.set_position(RET.buttons[x].box, gui.get_position(RET.frame_permanent) + button_offset[x])
	end
	RET.target_permanent = target
end

function RET.move_permanent(position)
	gui.set_position(RET.frame_permanent, position)
	for x = 1, button_count do
		gui.set_position(RET.buttons[x].text, gui.get_position(RET.frame_permanent) + button_offset[x])
		gui.set_position(RET.buttons[x].box, gui.get_position(RET.frame_permanent) + button_offset[x])
	end
end

function RET.hide()
	gui.set_enabled(RET.frame, false)
	RET.target = nil
end

function RET.hide_permanent()
	gui.set_enabled(RET.frame_permanent, false)
	for x = 1, button_count do
		gui.set_enabled(RET.buttons[x].text, false)
		gui.set_enabled(RET.buttons[x].box, false)
	end
	RET.target_permanent = nil
end

return RET