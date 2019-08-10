local FCrew = require("main.functionsCrew")
local UPG = require("main.upgrades")

local M = {}

function M.skillCheck(action, success)
	local result
	if action == "flee" then
		result = UPG.list.thrusters[UPG.fitted.thrusters].speed
		if crew[FCrew.getRole("mech")].skills.mech > 0.5 then
			result = result * (crew[FCrew.getRole("mech")].skills.mech * 2)
		end
	elseif action == "evade" then
		result = UPG.list.thrusters[UPG.fitted.thrusters].maneuverability
		if crew[FCrew.getRole("mech")].skills.mech > 0.5 then
			result = result * (crew[FCrew.getRole("mech")].skills.mech + 0.5)
		end
		result = result * (crew[FCrew.getRole("pilot")].skills.pilot * 2)
	elseif action == "shoot" then
		result = UPG.list.gun[UPG.fitted.gun].accuracy
		if crew[FCrew.getRole("pilot")].skills.pilot > 0.5 then
			result = result * (crew[FCrew.getRole("pilot")].skills.pilot + 0.5)
		end
		result = result * (crew[FCrew.getRole("gunner")].skills.gunner * 2)
	elseif action == "detect" then
		result = UPG.list.comms[UPG.fitted.comms].strength
		result = result * (crew[FCrew.getRole("comms")].skills.comms * 2)
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


return M

