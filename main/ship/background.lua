local background = {}
local timer_meteor

local function spawn_meteor()
	local size = math.random(2, 10) / 10
	factory.create("/background#spawn_meteor", vmath.vector3(-40, math.random(10, 880), 1), nil, nil, vmath.vector3(size, size, size))
	timer_meteor = timer.delay(math.random(4, 15) / 10, false, spawn_meteor)
end

function background.show(type)
	if type == hash("space") then
		particlefx.play("/background#stars")
		spawn_meteor()
		particlefx.play("/background#engine")

		--msg.post("/sky", "disable")
	elseif type == hash("planet") then
		timer.cancel(timer_meteor)
		particlefx.stop("/background#stars")
		particlefx.stop("/background#engine")
		--sprite.set_constant("/sky#sprite", "tint", vmath.vector4(0.3, 0.5, 1, 1))
		msg.post("/sky", "enable")
		msg.post("/sky", "launch")
	end
end

return background