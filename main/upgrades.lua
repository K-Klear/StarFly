local M = {}

local gun = {
	laser1 = {
		power = 10,
		accuracy = 0.80,
		description = "Repurposed mining laser with security measures stripped down.",
		cost = 600
	},
	canon1 = {
		power = 20,
		accuracy = 0.70,
		description = "A canon.",
		cost = 900
	},
}

local comms = {
	default = {
		strength = 1,
		cost = 50
	}
}

local armour = {
	default = {
		strength = 1,
		cost = 0
	}
}

local thrusters = {
	default = {
		strength = 1,
		cost = 0,
	}
}

return M