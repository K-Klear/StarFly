local BRAIN = {}

function BRAIN.recruitment_admit_no_skill(crew)
	if math.random() > 0.5 then return true end
end

function BRAIN.how_are_you(crew)
	return hash("talk_im_fine")
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
	if not crew.desperation then crew.desperation = 0 end --pprint(crew) end
	return math.floor(wage * 20 + 0.5) / 0.2, math.floor(wage * crew.desperation * 20 + 0.5) / 0.2
end

function BRAIN.get_issue_urgency(crew, issue)
	local base_urgency = {
		[hash("low_wage")] = 1.5, [hash("no_role")] = 0.7
	}
	if issue == hash("low_wage") then
		local difference = (crew.wage_promised - crew.wage) / 50
		return base_urgency[issue] + difference
	elseif issue == hash("no_role") then
		return base_urgency[issue] + crew.attributes.responsibility
	else
		error("Cannot get urgency of unknown issue: "..issue)
	end
end

function BRAIN.get_urgency_level(crew, urgency)
	if #crew.issues == 0 then return 0 end
	urgency = urgency or crew.issues[1].urgency
	return math.floor(urgency * (crew.attributes.boldness + 0.5))
end

function BRAIN.get_number_of_issues(crew)
	local count = 0
	for key, val in ipairs(crew.issues) do
		if BRAIN.get_urgency_level(crew, val.urgency) > 0 then
			count = count + 1
		else
			break
		end
	end
	return count
end

function BRAIN.talk_test(crew, test)
	local result
	if test == "issues_outstanding" then
		if #crew.issues > 0 and BRAIN.get_urgency_level(crew) > 0 then result = 1 end
	elseif test == "issue_urgency" then
		if BRAIN.get_urgency_level(crew) > 1 then result = 1 end
	end
	return result or 2
end

return BRAIN