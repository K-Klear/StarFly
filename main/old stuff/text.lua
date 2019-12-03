local M = {}

function M.skillText(value)
	if value < 1 then
		return "none"
	elseif value < 4 then
		return "poor"
	elseif value < 6 then
		return "average"
	elseif value < 8 then
		return "good"
	elseif value < 9 then
		return "excellent"
	else
		return "top"
	end
end

return M