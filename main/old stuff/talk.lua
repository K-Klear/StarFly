local FACE = require("main.face")
local Ftext = require("main.text")
M = {}

local qualifier = {
	none = {" don't know anything about", " have no clue when it comes to", " can't possilby be"},
	terrible = {" suck at", "'m terrible at", " don't have much experience with"},
	poor = {" have some basic expertise at", " know a little about"},
	average = {"'m competent at", "'m decent enough at"},
	good = {"'m good at", " won't let you down when"},
	great = {"'m excellent at", " know a lot about"},
	top = {"'m the best at", "'m the elite when it comes to", " know everything about", " 'm a master of"}
}

local jobs = {
	pilot = {"flying", "piloting", "helming the ship"},
	mech = {"mechanics", "engineering", "keeping the machine in one piece"},
	medic = {"keeping people healthy", "being doctor", "healing injuries", "medicine"},
	gunner = {"shooting stuff out of the sky", "manning the big gun", "exploding enemies", "turning enemy ships into stardust"},
	comms = {"using comm systems", "using the radio", "communications"},
	fight = {"fighting off boarders", "fighting", "security"}
}

local greeting = {"Hello!", "Greetings.", "Nice to meet you.", "Hello there!", "Good day, Captain."}
local myNameIs = {"I'm", "You can call me", "My name is", "They call me"}
local no_skill = {"I'm not really skilled in anything in particular, but I can learn! ", "I'm afraid I'm not very skilled in anything. "}

local qualityList = {"top", "great", "good", "average", "poor", "terrible", "none"}

local goal = {
	fun = {"This place is boring. I want to have some fun. ", "I'm looking for some excitement. You wouldn't believe how boring colony life can be. "},
	travel = {"I want to see all the universe has to offer. ", "I just want to see the stars. "},
	work = {"It's impossible to find a job here. Joining your crew might be my last chance. ", "Frankly? I'm after the money. I will get paid, right? ", "Honest work for honest pay, that's what I'm looking for. "},
	home = {"I want to find a place where I belong. A place I could call a home. "},
	running = {"Someone is after me. I need to vanish. ", "I've crossed someone. I need to get far away from here. "},
}

local wage = {
	percent = {"% of the take", "%", "% of what we earn"},
	offer = {"I deserve at least ", "I think a fair wage would be ", "I'm expecting at least ", "I'm easily worth ", "You should pay me "},
	negotiate = {"I'm willing to compromise.", "I'm open to negotiations."},
	final = {"That's my final offer", "That's as low as I can go.", "Take it or leave it.", "I can't really accept anything lower than that."},
	free = {"I'm willing to work just for food.", "You won't even have to pay me."}
}


function M.skills(crewID)
	local levels = {
		none = {},
		terrible = {},
		poor = {},
		average = {},
		good = {},
		great = {},
		top = {}
	}
	for key, val in pairs(crewID.skills) do
		local eval = val + ((crewID.attributes.confidence - 0.5) * 0.4)
		if eval < 0 then eval = 0 elseif eval > 1 then eval = 1 end
		if eval < 0.1 then
			table.insert(levels.none, key)
		elseif eval < 0.2 then
			table.insert(levels.terrible, key)
		elseif eval < 0.35 then
			table.insert(levels.poor, key)
		elseif eval < 0.5 then
			table.insert(levels.average, key)
		elseif eval < 0.6 then
			table.insert(levels.good, key)
		elseif eval < 0.9 then
			table.insert(levels.great, key)
		else
			table.insert(levels.top, key)
		end
	end
	local string = ""
	for k, v in ipairs(qualityList) do
		if #levels[v] > 0 then
			string = string.."I"..pickLine(qualifier[v])
			local count = #levels[v]
			for key, val in pairs(levels[v]) do
				string = string.." "..pickLine(jobs[val])
				if count == 1 then
					string = string..". "
				elseif count == 2 then
					string = string.." and"
				else
					string = string..","
				end
				count = count - 1 
			end
		end
	end
	return string
end


local function get_skill_level(levels, level)
	local output = {}
	for k, v in ipairs(qualityList) do
		if #levels[v] > 0 then
			if level == "best" and k < 6 then
				output[v] = levels[v]
				return output
			elseif v == level then
				output[v] = levels[v]
				return output
			elseif not level then
				output[v] = levels[v]
			end
		end
	end
	return output
end

local function skills_to_speech(levels)
	local string = ""
	if next(levels) == nil then
		return pickLine(no_skill)
	else
		for k, v in ipairs(qualityList) do
			if levels[v] then
				string = string.."I"..pickLine(qualifier[v])
				local count = #levels[v]
				for key, val in pairs(levels[v]) do
					string = string.." "..pickLine(jobs[val])
					if count == 1 then
						string = string..". "
					elseif count == 2 then
						string = string.." and"
					else
						string = string..","
					end
					count = count - 1 
				end
			end
		end
		return string
	end
end

function M.recruit_intro(peep)
	local string = pickLine(greeting).." "..pickLine(myNameIs).." "..Ftext.getName(peep)..". "
	--string = string..pickLine(goal[peep.goal])
	string = string..skills_to_speech(get_skill_level(get_skills(peep), "best"))
	return string
end


function M.recruit_wage_initial(peep, maxWage, minWage)
	local string
	if maxWage == 0 then
		string = pickLine(wage.free)
	elseif maxWage == 5 then
		string = pickLine(wage.offer)..maxWage..pickLine(wage.percent).."."
	else
		string = pickLine(wage.offer)..maxWage..pickLine(wage.percent)
		if maxWage == minWage then
			string = string..". "..pickLine(wage.final)
		else
			string = string..", but "..pickLine(wage.negotiate)
		end
	end
	return string
end


return M