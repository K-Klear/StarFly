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
		timer_meteor = timer.delay(math.random(4, 15) / 10, false, spawn_meteor)
	end
end

return background