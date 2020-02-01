local total_storage = 20
local CARGO = {
	empty = total_storage,
	fuel = 5,
	fuel_max = 20
}

local pos_x, pos_y, pos_z = {131, 161.5, 195, 224}, {70, 90, 110, 130, 150}, 0.001
local pos_x_max_offset = {2.5, 2.5, 1, 1}

CARGO.shelves = {}
for x = 1, #pos_x do
	CARGO.shelves[x] = {}
end

CARGO.goods = {}

local function find_space(second_pass)
	local priority = {
		{shelf = 2, prob = 0.4},
		{shelf = 1, prob = 0.3},
		{shelf = 3, prob = 0.3},
		{shelf = 4, prob = 0.2},
		{shelf = 5, prob = 0.1},
	}
	for y = 1, #pos_y do
		for x = 1, #pos_x do
			if not CARGO.shelves[x][priority[y].shelf] and (second_pass or math.random() < priority[y].prob) then
				return x, priority[y].shelf
			end
		end
	end
	if second_pass then error("Cargo hold full") end
	return find_space(true)
end

local function get_new_id()
	for x = 1, total_storage do
		if not CARGO.goods[x] then
			return x
		end
	end
	error("No more cargo ids available... somehow")
end

function CARGO.add(size)
	if size > CARGO.empty then
		return
	else
		CARGO.empty = CARGO.empty - size
		local id = get_new_id()
		CARGO.goods[id] = {crates = {}}
		local colour = vmath.vector4(math.random(), math.random(), math.random(), 1)
		for count = 1, size do
			local x, y = find_space()
			CARGO.shelves[x][y] = true
			table.insert(CARGO.goods[id].crates, {x = x, y = y})
			local pos = vmath.vector3(pos_x[x] + (math.random() * pos_x_max_offset[x]), pos_y[y], pos_z)
			msg.post("main:/main", "spawn_box", {x = x, y = y, pos = pos, colour = colour})
		end
		return id
	end
end

function CARGO.remove(id)
	CARGO.empty = CARGO.empty + #CARGO.goods[id].crates
	for key, val in ipairs(CARGO.goods[id].crates) do
		go.delete(CARGO.shelves[val.x][val.y], true)
		CARGO.shelves[val.x][val.y] = nil
	end
	CARGO.goods[id] = nil
end

return CARGO