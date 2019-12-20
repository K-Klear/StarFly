local BRAIN = {}

function BRAIN.recruitment_admit_no_skill(crew)
	if math.random() > 0.5 then return true end
end

local function get_skill_level(skill)
	if skill < 0 then skill = 0 end
	if skill < 0.1 then return 1
	elseif skill < 0.2 then	return 2
	elseif skill < 0.35 then return 3
	elseif skill < 0.5 then	return 4
	elseif skill < 0.6 then	return 5
	elseif skill < 0.9 then	return 6
	else return 7 end
end

local function self_evaluation(crew, skill)
	return skill + (crew.attributes.confidence - 0.5) * 0.4
end	

function BRAIN.get_best_skill(crew)
	local best_num, best_skill = -1
	for key, val in pairs(crew.skills) do
		if val > best_num then
			best_num = val; best_skill = key
		end
	end
	return best_skill, get_skill_level(self_evaluation(crew, best_num))
end

function BRAIN.get_wage(crew)
	local best = 0
	local secondary = 0
	local skillCount = 0
	for key, val in pairs(crew.skills) do
		skillCount = skillCount + 1
		local eval = self_evaluation(crew, val)
		secondary = secondary + eval
		if eval > best then
			best = eval
		end
	end
	secondary = secondary - best
	best = best / 4 + 0.05
	secondary = secondary / (10 * skillCount)
	local wage = (best + secondary) * (crew.attributes.greed + 0.5)
	return math.floor(wage * 20 + 0.5) / 0.2, math.floor(wage * crew.desperation * 20 + 0.5) / 0.2
end

return BRAIN