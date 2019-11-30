local CREW = require("main/modules/crew")
local UPG = require("main/modules/upgrades")

local DICE = {}

function DICE.roll(action, success)
	local result
	if action == "flee" then
		result = UPG.list.thrusters[UPG.fitted.thrusters].speed
		if CREW.get_role("mech").skills.mech > 0.5 then
			result = result * (crew[CREW.get_role("mech")].skills.mech * 2)
		end
	elseif action == "evade" then
		result = UPG.list.thrusters[UPG.fitted.thrusters].maneuverability
		local crewman = CREW.get_role("mech")
		if crewman.skills.mech > 0.5 then
			result = result * (crewman.skills.mech + 0.5)
		end
		local crewman = CREW.get_role("pilot")
		result = result * crewman.skills.pilot * 2
	elseif action == "shoot" then
		result = UPG.list.gun[UPG.fitted.gun].accuracy
		local crewman = CREW.get_role("pilot")
		if crewman.skills.pilot > 0.5 then
			result = result * (crewman.skills.pilot + 0.5)
		end
		result = result * CREW.get_role("gunner").skills.gunner * 2
	elseif action == "detect" then
		result = UPG.list.comms[UPG.fitted.comms].strength
		local crewman = CREW.get_role(hash("role_comms"))
		if crewman then 
			result = result * 2 * crewman.skills.comms
		else
			result = 0
		end

	elseif action == "pilot" then
		result = UPG.list.thrusters[UPG.fitted.thrusters].maneuverability
		local crewman = CREW.get_role("comms")
		result = result * crewman.skills.pilot * 2
	elseif action == "luck" then
		result = math.random()
	end
	if success then
		if result > success then
			return true
		else
			return false
		end
	else
		return result
	end
end


return DICE

