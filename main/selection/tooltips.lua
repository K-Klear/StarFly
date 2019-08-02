local TOOL = {}

local offset = vmath.vector3(16, -16, 1)
local node

function TOOL.setup()
	node = gui.new_text_node(vmath.vector3(0, 0, 0), "")
	gui.set_pivot(node, gui.PIVOT_W)
end

function TOOL.show(text, position)
	gui.set_text(node, text)
	gui.set_enabled(node, true)
	gui.set_position(node, position + offset)
end

function TOOL.hide()
	gui.set_enabled(node, false)
end

return TOOL