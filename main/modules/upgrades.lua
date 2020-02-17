local UPG = {
	fitted = {
		[hash("warp_drive")] = hash("warp_drive_default"),
		[hash("impulse_drive")] = hash("impulse_drive_default")
	}
}

local upgrade_list = {
	[hash("warp_drive")] = {
		{
			name = hash("warp_drive_default"),
			cost = 1000,
			jump_cost = 0.1,
			fuel_efficiency = 0.1,
			range = 1/0,
			misjump_chance = 0.1,
			accuracy = 0.5
		}
	},
	[hash("impulse_drive")] = {
		{
			name = hash("impulse_drive_default"),
			cost = 1000,
			fuel_efficiency = 1,
			speed = 1,
		}
	}
}

local part_list = {
	[hash("warp_drive_default")] = {
		type = hash("warp_drive"),
		cost = 1000,
		jump_cost = 0.1,
		distance_cost = 1/3,
		range = 1/0,
		misjump_chance = 0.1
	},
	[hash("impulse_drive_default")] = {
		type = hash("impulse_drive"),
		cost = 1000,
		fuel_efficiency = 1,
		speed = 1,
	}
}

function UPG.get(stat, part)
	return part_list[UPG.fitted[part]][stat]
end

return UPG