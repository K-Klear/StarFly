local CON = require("main.constants")

local M = {}


M.face = {}

local scale = 2
function M.face.f()
	M.face.background = gui.new_box_node(vmath.vector3(500, 500, 0), vmath.vector3(64, 96, 0))
	gui.set_color(M.face.background, vmath.vector4(0.5, 0.5, 0.5, 1))

	local skinTone = CON.SKINTONE[math.random(1, #CON.SKINTONE)]


	M.face.base = gui.new_box_node(vmath.vector3(500, 500, 0), vmath.vector3(17, 25, 0))
	gui.set_texture(M.face.base, hash("faces"))
	gui.play_flipbook(M.face.base, hash("base1"))
	gui.set_scale(M.face.base, vmath.vector3(scale, scale, 0))

	gui.set_color(M.face.base, skinTone)

	M.face.chin = gui.new_box_node(vmath.vector3(500, 500, 0), vmath.vector3(17, 25, 0))
	gui.set_texture(M.face.chin, hash("faces"))
	gui.set_scale(M.face.chin, vmath.vector3(scale, scale, 0))
	gui.set_color(M.face.chin, skinTone)

	M.face.mouth = gui.new_box_node(vmath.vector3(500, 500, 0), vmath.vector3(17, 25, 0))
	gui.set_texture(M.face.mouth, hash("faces"))
	gui.set_scale(M.face.mouth, vmath.vector3(scale, scale, 0))

	M.face.nose = gui.new_box_node(vmath.vector3(500, 500, 0), vmath.vector3(17, 25, 0))
	gui.set_texture(M.face.nose, hash("faces"))
	gui.set_scale(M.face.nose, vmath.vector3(scale, scale, 0))

	M.face.hair = gui.new_box_node(vmath.vector3(500, 500, 0), vmath.vector3(17, 25, 0))
	gui.set_texture(M.face.hair, hash("faces"))
	gui.play_flipbook(M.face.hair, hash("hair1"))
	gui.set_scale(M.face.hair, vmath.vector3(4, 4, 0))

	gui.set_color(M.face.hair, CON.HAIRCOLOR[math.random(1, #CON.HAIRCOLOR)])
	gui.set_enabled(M.face.hair, false)

	M.face.refresh()
end

function M.face.refresh()
	local rand = math.random(1, 4)
	if rand == 1 then
		gui.play_flipbook(M.face.mouth, hash("mouth1"))
	elseif rand == 2 then
		gui.play_flipbook(M.face.mouth, hash("mouth2"))
	elseif rand == 3 then
		gui.play_flipbook(M.face.mouth, hash("mouth3"))
	elseif rand == 4 then
		gui.play_flipbook(M.face.mouth, hash("mouth4"))
	end
	local rand = math.random(1, 3)
	if rand == 1 then
		gui.play_flipbook(M.face.chin, hash("chin1"))
	elseif rand == 2 then
		gui.play_flipbook(M.face.chin, hash("chin2"))
	else
		gui.play_flipbook(M.face.chin, hash("chin3"))
	end
	local rand = math.random(1, 2)
	if rand == 1 then
		gui.play_flipbook(M.face.nose, hash("nose1"))
	elseif rand == 2 then
		gui.play_flipbook(M.face.nose, hash("nose2"))
	end
end



return M