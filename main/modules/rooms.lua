local ROOM = {
	list = {
		{type = hash("cockpit"), x = 1, y = 3, size = 1, use = hash("cockpit")},
		{type = hash("comms"), x = 6, y = 3, size = 1, use = hash("comms")},
		{type = hash("gun"), x = 2, y = 1, size = 1, use = hash("gun")},
		{type = hash("engine"), x = 11, y = 1, size = 3, use = hash("engine")},
		{type = hash("cargo_hold"), x = 11.5, y = 2, size = 4, use = hash("cargo_hold")},
		{type = hash("bunk"), x = 4, y = 3, size = 1},
		{type = hash("bunk"), x = 4, y = 2, size = 1},
		{type = hash("bunk"), x = 6, y = 2, size = 1},
		{type = hash("bunk"), x = 8, y = 2, size = 1, use = hash("medbay")},
		{type = hash("bunk"), x = 4, y = 1, size = 1},
		{type = hash("bunk"), x = 6, y = 1, size = 1},
		{type = hash("bunk"), x = 8, y = 1, size = 1}
	},
	ladders = {
		{y = 1, x = 5, dir = hash("up")},
		{y = 1, x = 7, dir = hash("up")},
		{y = 2, x = 3, dir = hash("up")},
		{y = 2, x = 5, dir = hash("down")},
		{y = 2, x = 7, dir = hash("down")},
		{y = 3, x = 3, dir = hash("down")}
	}
}

function ROOM.get_room_from_role(role)
	local workplace = {
		[hash("role_pilot")] = hash("cockpit"),
		[hash("role_engineer")] = hash("engine"),
		[hash("role_comms")] = hash("comms"),
		[hash("role_medic")] = hash("medbay"),
		[hash("role_gunner")] = hash("gun")
	}
	if workplace[role] then
		for key, val in ipairs(ROOM.list) do
			if val.use == workplace[role] then
				return key
			end
		end
	end
	return false
end


return ROOM