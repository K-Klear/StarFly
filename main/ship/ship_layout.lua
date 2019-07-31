local SHIP = {
	GUN = {x = -112, level = 1},
	BUNK1 = {x = -48, level = 1},
	BUNK2 = {x = 16, level = 1},
	BUNK3 = {x = 80, level = 1},
	ENGINE1 = {x = 144, level = 1},
	ENGINE2 = {x = 176, level = 1},
	ENGINE3 = {x = 208, level = 1},
	
	BUNK4 = {x = -48, level = 2},
	BUNK5 = {x = 16, level = 2},
	BUNK6 = {x = 80, level = 2},
	CARGO1 = {x = 144, level = 2},
	CARGO2 = {x = 176, level = 2},
	CARGO3 = {x = 208, level = 2},
	CARGO4 = {x = 240, level = 2},

	COCKPIT = {x = -144, level = 3},
	BUNK7 = {x = -48, level = 3},
	COMMS = {x = 16, level = 3},

	LADDERS = {
		{x = -80, level = 3, target = 2},
		{x = -80, level = 2, target = 3},
		{x = -16, level = 2, target = 1},
		{x = 48, level = 2, target = 1},
		{x = -16, level = 1, target = 2},
		{x = 48, level = 1, target = 2}
	}
}


return SHIP