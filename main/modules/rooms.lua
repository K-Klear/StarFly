local ROOM = {
	list = {
		cockpit = {x = 1, y = 3, size = 1, use = hash("cockpit")},
		comms = {x = 6, y = 3, size = 1, use = hash("comms")},
		gun = {x = 2, y = 1, size = 1, use = hash("gun")},
		engine = {x = 11, y = 1, size = 3, use = hash("engine")},
		cargo_hold = {x = 11.5, y = 2, size = 4, use = hash("cargo_hold")},
		room_1 = {x = 4, y = 3, size = 1},
		room_2 = {x = 4, y = 2, size = 1, use = hash("medbay")},
		room_3 = {x = 6, y = 2, size = 1},
		room_4 = {x = 8, y = 2, size = 1},
		room_5 = {x = 4, y = 1, size = 1},
		room_6 = {x = 6, y = 1, size = 1},
		room_7 = {x = 8, y = 1, size = 1}
	}
}

return ROOM