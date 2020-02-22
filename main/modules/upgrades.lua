local UPG = {
	fitted = {
		[hash("warp_drive")] = hash("warp_drive_default"),
		[hash("impulse_drive")] = hash("impulse_drive_default")
	}
}

local part_list = {
	[hash("warp_drive_default")] = {
		type = hash("warp_drive"),
		cost = 1000,
		jump_cost = 0.1,
		distance_cost = 1/3,
		range = 1/0,
		misjump_chance = 0.1,
		jump_accuracy = 0.9,
		cooldown = 5000
	},
	[hash("impulse_drive_default")] = {
		type = hash("impulse_drive"),
		cost = 1000,
		fuel_efficiency = 1 / 4, -- fuel needed per distance unit
		speed = 1 / 100000, -- distance units per second
	}
}

function UPG.get(stat, part)
	return part_list[UPG.fitted[part]][stat]
end

return UPG