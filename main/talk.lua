local FACE = require("main.face")
local Ftext = require("main.text")
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

local greeting = {"Hello!", "Greetings.", "Nice to meet you.", "Hello there!"}
local myNameIs = {"I'm", "You can call me", "My name is", "They call me"}

local qualityList = {"top", "great", "good", "average", "poor", "terrible"}

local goal = {
	fun = {"This place is boring. I want to have some fun.", "I need some excitement. You wouldn't believe how boring colony life can be."},
	travel = {"I want to see all the universe has to offer.", "I just want to see the stars."},
	work = {"It's impossible to find a job here. Joining your crew might be my last chance.", "Frankly? I'm after the money. I will get paid, right?", "Honest work for honest pay, that's what I'm looking for."},
	home = {"I want to find a place where I belong. A place I could call a home."},
	running = {"Someone is after me. I need to vanish.", "I've crossed someone. I need to get far away from here."},
	spy = {"I'm going to spy on you and lying isn't yet implemented, so... please hire me anyway?"},
	sabotage = {"I'm going to sabotage your ship. Lying isn't yet implemented, but then again, neither are sabotages."},
}

local function pickLine(table)
	return table[math.random(1, #table)]
end

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

function M.intro(crewID)
	local string = pickLine(greeting).." "..pickLine(myNameIs).." "..Ftext.getName(crewID)..". "
	string = string..pickLine(goal[crewID.goal])
	return string
end

function M.openDialog(dialog, talker, text, reply1, reply2, reply3)
	for key, val in ipairs(dialog.ico) do
		for k, v in pairs(val) do
			gui.delete_node(v)
		end
	end
	dialog.ico = {}
	table.insert(dialog.ico, FACE.drawFace(talker.face, vmath.vector3(-120, 130, 0), 2))
	for key, val in ipairs(dialog.ico) do
		for k, v in pairs(val) do
			gui.set_parent(v, dialog.frame)
		end
		gui.move_above(val.hair, val.forehead)
	end
	gui.set_text(dialog.lbl.text, text)
	gui.set_text(dialog.lbl.name, Ftext.getName(talker).." says:")
	if reply1 then
		gui.set_text(dialog.btn.reply1, reply1)
	else
		gui.set_enabled(dialog.btn.reply1, false)
	end
	if reply2 then
		gui.set_text(dialog.btn.reply2, reply2)
	else
		gui.set_enabled(dialog.btn.reply2, false)
	end
	if reply3 then
		gui.set_text(dialog.btn.reply3, reply3)
	else
		gui.set_enabled(dialog.btn.reply3, false)
	end
	gui.set_enabled(dialog.frame, true)
end

return M