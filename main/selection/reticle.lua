local SHIP = require("main.ship.ship_layout")
local text = require("main.text")

local RET = {buttons = {}}
local button_count = 3

local button_offset = {
	vmath.vector3(-12, 64, 0),
	vmath.vector3(48, 64, 0),
	vmath.vector3(18, 96, 0)
}

local label_offset = vmath.vector3(18, -16, 0)

local button_pivot = {
	gui.PIVOT_E,
	gui.PIVOT_W,
	gui.PIVOT_CENTER
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
		RET.buttons[x] = gui.new_text_node(vmath.vector3(1, 1, 1), "")
		gui.set_pivot(RET.buttons[x], button_pivot[x])
		gui.set_font(RET.buttons[x], hash("system_font"))
		gui.set_enabled(RET.buttons[x], false)
	end

	RET.label = gui.new_text_node(vmath.vector3(1, 1, 1), "")
	gui.set_pivot(RET.label, gui.PIVOT_CENTER)
	gui.set_enabled(RET.label, false)
end

function RET.show(position, size, target)
	size = size or vmath.vector3(64, 128, 0)
	gui.set_position(RET.frame, position)
	gui.set_size(RET.frame, size)
	gui.set_enabled(RET.frame, true)
	RET.target = target
end

function RET.show_permanent(position, size, target, button_data)
	size = size or vmath.vector3(40, 78, 0)
	gui.set_position(RET.frame_permanent, position)
	gui.set_size(RET.frame_permanent, size)
	gui.set_enabled(RET.frame_permanent, true)
	for x = 1, #button_data do
		gui.set_text(RET.buttons[x], button_data[x].text)
		local matrix = gui.get_text_metrics_from_node(RET.buttons[x])
		gui.set_size(RET.buttons[x], vmath.vector3(matrix.width, matrix.height, 1))
		gui.set_enabled(RET.buttons[x], true)
		gui.set_position(RET.buttons[x], gui.get_position(RET.frame_permanent) + button_offset[x])
	end
	if type(target) == "string" then
		gui.set_text(RET.label, SHIP[target].name)
	elseif type(target) == "number" then
		gui.set_text(RET.label, text.getName(crew[target]))
	end
	gui.set_enabled(RET.label, true)
	gui.set_position(RET.label, gui.get_position(RET.frame_permanent) + label_offset)
	RET.target_permanent = target
end

function RET.move_permanent(position)
	gui.set_position(RET.frame_permanent, position)
	for x = 1, button_count do
		gui.set_position(RET.buttons[x], gui.get_position(RET.frame_permanent) + button_offset[x])
	end
	gui.set_position(RET.label, gui.get_position(RET.frame_permanent) + label_offset)
end

function RET.hide()
	gui.set_enabled(RET.frame, false)
	RET.target = nil
end

function RET.hide_permanent()
	gui.set_enabled(RET.frame_permanent, false)
	for x = 1, button_count do
		gui.set_enabled(RET.buttons[x], false)
	end
	gui.set_enabled(RET.label, false)
	RET.target_permanent = nil
end

function RET.hide_buttons()
	for x = 1, button_count do
		gui.set_enabled(RET.buttons[x], false)
	end
end

return RET