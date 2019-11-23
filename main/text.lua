local M = {}

M.nameList = {}

M.nameList.male = {
	"Mal", "Wash", "Simon", "Jean-Luc", "Wolf", "Wesley", "Crusher", "Chekov", "Geordi", "Scott", "Odo",
	"Quark", "Garrus", "Korben", "Cornelius", "Ziggy", "Tom", "Reed", "Flash", "Ace",
	"Gordon", "Memnon", "Cutter", "Mathesar", "Rimmer", "Lister", "Spiff", "Ijon", "Kaidan", "Jacob"
}

M.nameList.female = {
	"Nyota", "Deanna", "Kira", "Kim", "Cat", "Holly", "Tali", "Ruby", "Beverley", "Jinx",
	"Jovia", "Inara", "Kaylee", "Zoe", "River", "Tawny", "Trishka", "Miranda", "Kasumi", "Kelly"
}

M.nameList.both = {
	"Jayne", "Book", "Shepard", "Picard", "Riker", "Kirk", "McCoy", "Janeway", "LaForge", "O'Brien",
	"Uhura", "Bashir", "Dax", "Paris", "Torres", "Kochanski", "Holister", "Reynolds", "Ripley", "Dallas",
	"Ashley", "Brannigan", "Solo", "Carlissan", "Jameson", "Ripcord", "Archer", "Quill", "Buzz", "Eisenhorn",
	"Gaunt", "Sanchez", "Batty", "Richards", "Storm", "Grimm", "Vanderbeam", "Edgewise", "Quine", "Starr",
	"Taggart", "Madison", "Lazarus", "Chen", "Laredo", "Sarris", "Grayson", "Hunt", "Sarrano", "Novak", "Sato",
	"Troi", "Adama", "Thrace", "Tichy", "Lawson", "Chakwas", "Moreau", "Taylor", "Goto", "Massani", "Chambers", "Vega", "Cortez",
	"Traynor"
}


local namesUsed = {male = {}, female = {}, both = {}}

function M.pickName(gender)
	local function createList()
		local picks = {}
		for key in ipairs(M.nameList[gender]) do
			if namesUsed[gender][key] == nil then
				table.insert(picks, {key = key, gender = gender})
			end
		end
		for key in ipairs(M.nameList.both) do
			if namesUsed.both[key] == nil then
				table.insert(picks, {key = key, gender = "both"})
			end
		end
		return picks
	end
	
	namePicks = createList()
	if #namePicks == 0 then
		for key, val in pairs(namesUsed[gender]) do
			if val == false then namesUsed[gender][key] = nil end
		end
		for key, val in pairs(namesUsed.both) do
			if val == false then namesUsed.both[key] = nil end
		end
		namePicks = createList()
		if #namePicks == 0 then
			namesUsed = {male = {}, female = {}, both = {}}
			namePicks = createList()
		end
	end

	return namePicks[math.random(1, #namePicks)]
end

function M.setNameAvailability(gender, key, bool)
	namesUsed[gender][key] = bool
end

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

function M.getName(crew)
	return M.nameList[crew.name.gender][crew.name.key]
end

return M