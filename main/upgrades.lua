local M = {}

M.fitted = {gun = 1, comms = 1, armour = 1, thrusters = 1}

M.list = {
	gun = {
		{
			name = "Mining Laser",
			strength = 10,
			accuracy = 0.80,
			description = "Repurposed mining laser with security measures stripped down.",
			cost = 600
		},
		{
			name = "Canon",
			strength = 20,
			accuracy = 0.70,
			description = "A canon.",
			cost = 900
		},
	},
	comms = {
		{
			name = "default",
			strength = 1,
			cost = 50
		}
	},
	armour = {
		{
			name = "default",
			strength = 1,
			cost = 0
		}
	},
	thrusters = {
		{
			name = "default",
			speed = 10,
			maneuverability = 5,
			cost = 0,
		}
	},
}


return M