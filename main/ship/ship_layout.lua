local SHIP = {
	GUN = {x = -112, level = 1, pos = vmath.vector3(297, 205, 0), size = vmath.vector3(64, 128, 0), name = "Gun emplacement"},
	BUNK1 = {x = -48, level = 1, pos = vmath.vector3(425, 205, 0), size = vmath.vector3(64, 128, 0), name = "Bunk #1"},
	BUNK2 = {x = 16, level = 1, pos = vmath.vector3(553, 205, 0), size = vmath.vector3(64, 128, 0), name = "Bunk #2"},
	BUNK3 = {x = 80, level = 1, pos = vmath.vector3(681, 205, 0), size = vmath.vector3(64, 128, 0), name = "Bunk #3"},
	ENGINE1 = {x = 144, level = 1, pos = vmath.vector3(809, 205, 0), size = vmath.vector3(192, 128, 0), name = "Engine room"},
	ENGINE2 = {x = 176, level = 1, name = "Engine room"},
	ENGINE3 = {x = 208, level = 1, name = "Engine room"},
	
	BUNK4 = {x = -48, level = 2, pos = vmath.vector3(425, 397, 0), size = vmath.vector3(64, 128, 0), name = "Bunk #4"},
	BUNK5 = {x = 16, level = 2, pos = vmath.vector3(553, 397, 0), size = vmath.vector3(64, 128, 0), name = "Bunk #5"},
	BUNK6 = {x = 80, level = 2, pos = vmath.vector3(681, 397, 0), size = vmath.vector3(64, 128, 0), name = "Bunk #6"},
	CARGO1 = {x = 144, level = 2, pos = vmath.vector3(809, 397, 0), size = vmath.vector3(256, 256, 0), name = "Cargo bay"},
	CARGO2 = {x = 176, level = 2, name = "Cargo bay"},
	CARGO3 = {x = 208, level = 2, name = "Cargo bay"},
	CARGO4 = {x = 240, level = 2, name = "Cargo bay"},

	COCKPIT = {x = -144, level = 3, pos = vmath.vector3(233, 589, 0), size = vmath.vector3(64, 128, 0), name = "Cockpit"},
	BUNK7 = {x = -48, level = 3, pos = vmath.vector3(425, 589, 0), size = vmath.vector3(64, 128, 0), name = "Bunk #7"},
	COMMS = {x = 16, level = 3, pos = vmath.vector3(553, 589, 0), size = vmath.vector3(64, 128, 0), name = "Communications"},

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