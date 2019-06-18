local text = require("main.text")
local FACE = require("main.face")

local F = {}

local IDCount = 0

function F.getRole(role)
	for key, val in ipairs(crew) do
		if val.role == role then
			return key
		end
	end
	return 0
end

function F.normalDist(factor, zeroMean)
	local value = 0
	for x = 1, factor do
		value = value + math.random()
	end
	value = value / factor
	if zeroMean then
		value = math.abs(value - 0.5) * 2
	end
	return value
end

function F.generateCrew()
	IDCount = IDCount + 1
	local gender
	if math.random(0, 1) == 0 then gender = "male" else gender = "female" end
	local name = text.pickName(gender)
	text.setNameAvailability(name.gender, name.key, false)

	local face = FACE.createFace()

	local skills = {
		medic = F.normalDist(2, true),
		mech = F.normalDist(2, true),
		gunner = F.normalDist(2, true),
		comms = F.normalDist(2, true),
		pilot = F.normalDist(2, true),
		fight = F.normalDist(2, true)
	}

	local stats = {
		loyalty = F.normalDist(5, true),
		happiness = F.normalDist(5),
	}

	local attributes = {
		confidence = F.normalDist(2),
		greed = F.normalDist(2),
		secretiveness = F.normalDist(2),
		charisma = F.normalDist(2),
		smarts = F.normalDist(2),
		duty = F.normalDist(2),
	}

	local knowledge = {
		science = F.normalDist(5, true),
		factions = F.normalDist(2, true)
	}

	--[[
	Forgiveness/grudges
	Anger
	Bounty

	Attitude towards rest of the crew
	Trust


	Talents/limitations

	Respects:
	Winners
	Toughness
	Kindness
	Diplomacy
	Authority

	Goals:
	Sabotage ship
	Spy
	Earn money
	Have a home
	Be a good crew
	Win affection of crewman
	Get to a planet with conditions
	Have a story to tell
	Hide from someone
	--]]

	return {
		gender = gender, name = name, skills = skills, stats = stats, attributes = attributes,
		knowledge = knowledge, face = face, ID = IDCount
	}
end

return F