local TOOL = {}
local RET = require("main.selection.reticle")

local offset = vmath.vector3(0, -32, 0)
local offset_icon = vmath.vector3(-12, -32, 0)
local node, icon

function TOOL.setup()
	node = gui.new_text_node(vmath.vector3(0, 0, 0), "")
	icon = gui.new_box_node(vmath.vector3(0, 0, 0), vmath.vector3(16, 16, 16))
	gui.set_texture(icon, hash("icons"))
	gui.set_pivot(node, gui.PIVOT_W)
end

function TOOL.show(text, position, icon_pic)
	gui.set_text(node, text)
	gui.set_enabled(node, true)
	gui.set_position(node, position + offset)
	gui.move_above(node, RET.frame)
	gui.move_above(node, RET.frame_permanent)
	if icon_pic then
		gui.move_above(icon, RET.frame)
		gui.move_above(icon, RET.frame_permanent)
		gui.set_enabled(icon, true)
		gui.set_position(icon, position + offset_icon)
		gui.play_flipbook(icon, icon_pic)
	else
		gui.set_enabled(icon, false)
	end
end

function TOOL.hide()
	gui.set_enabled(node, false)
	gui.set_enabled(icon, false)
end

return TOOL