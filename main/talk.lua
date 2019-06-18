M = {}

local qualifier = {
	none = {" don't know anything about", " have no clue when it comes to", " can't imagine"},
	terrible = {" suck at", "'m terrible at", " don't have much experience with"},
	poor = {" have some basic expertise at", " know a little about"},
	average = {"'m competent at", "'m decent enough at"},
	good = {"'m good at", " won't let you down when"},
	great = {"'m excellent at", " know a lot about"},
	top = {"'m the best at", "'m the elite when it comes to", " know everything about", " a master of"}
}

local jobs = {
	pilot = {"flying", "piloting"},
	mech = {"mechanics", "engineering", "keeping the machine in one piece"},
	medic = {"keeping people healthy", "being doctor", "healing injuries", "medicine"},
	gunner = {"shooting stuff out of the sky", "manning the big gun", "exploding enemies"},
	comms = {"using comm systems", "listening to space"},
	fight = {"fighting off boarders", "fighting", "keeping everyone safe"}
}

local qualityList = {"top", "great", "good", "average", "poor", "terrible", "none"}

function M.skills(crewID)
	levels = {
		none = {},
		terrible = {},
		poor = {},
		average = {},
		good = {},
		great = {},
		top = {}
	}
	for key, val in pairs(crew[crewID].skills) do
		local eval = val + ((crew[crewID].attributes.confidence - 0.5) * 0.4)
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
			string = string.."I"..qualifier[v][math.random(1, #qualifier[v])]
			local count = #levels[v]
			for key, val in pairs(levels[v]) do
				string = string.." "..jobs[val][math.random(1, #jobs[val])]
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
	return
end




return M