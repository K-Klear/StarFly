local CON = require("main.constants")
local M = {}

local parts = {
	{"chin1", "chin2", "chin3"},
	{"forehead1", "forehead2"},
	{"mouth1", "mouth2", "mouth3", "mouth4"},
	{"nose1", "nose2", "nose3"},
	{"eyes1"},
	{"iris1"},
	{"hair1", "hair2"}
}

local partList = {"chin", "forehead", "mouth", "nose", "eyes", "iris", "hair"}

function M.createFace()
	local face = {
		skinTone = CON.SKINTONE[math.random(1, #CON.SKINTONE)],
		eyeColor = CON.EYECOLOR[math.random(1, #CON.EYECOLOR)],
		hairColor = CON.HAIRCOLOR[math.random(1, #CON.HAIRCOLOR)],
		chin = parts[1][math.random(1, #parts[1])],
		forehead = parts[2][math.random(1, #parts[2])],
		mouth = parts[3][math.random(1, #parts[3])],
		nose = parts[4][math.random(1, #parts[4])],
		eyes = parts[5][math.random(1, #parts[5])],
		iris = parts[6][math.random(1, #parts[6])],
		hair = parts[7][math.random(1, #parts[7])]
	}
	return face
end

function M.drawFace(faceData, position, scale)
	if not scale then scale = 4 end
	local nodes = {}
	--[[
	nodes.background = gui.new_box_node(position, vmath.vector3(17, 25, 0))
	gui.set_scale(nodes.background, vmath.vector3(scale, scale, 0))
	gui.set_color(nodes.background, vmath.vector4(0.5, 0.5, 0.5, 1))
	--]]
	for key, val in ipairs(partList) do
		nodes[val] = gui.new_box_node(position, vmath.vector3(17, 25, 0))
		gui.set_texture(nodes[val], hash("faces"))
		gui.play_flipbook(nodes[val], hash(faceData[val]))
		gui.set_scale(nodes[val], vmath.vector3(scale, scale, 0))
	end
	gui.set_color(nodes.chin, faceData.skinTone)
	gui.set_color(nodes.forehead, faceData.skinTone)
	gui.set_color(nodes.hair, faceData.hairColor)
	gui.set_color(nodes.iris, faceData.eyeColor)
	return nodes
end

return M