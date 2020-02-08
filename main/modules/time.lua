local STR = require("main/modules/strings")
local STATS = require("main/modules/stats")

local TIME = {
	time = 100000,
	runnning = false,
	scale = hash("normal"),
	alarm = {},
	alarm_list = {}
}

local scale_data = {
	[hash("normal")] = {freq = 0.864, jump = 1},
	[hash("fast")] = {freq = 0.864, jump = 100},
	[hash("faster")] = {freq = 0.864 / 10, jump = 100},
	[hash("fastest")] = {freq = 0.864 / 10, jump = 1000}
}

local ticker, ticker_once

function TIME.get_time_string(time, absolute)
	local day, hour, min, str = tonumber(string.sub(time, 1, -6)), tonumber(string.sub(time, -5, -5)), tonumber(string.sub(time, -4, -3)), ""
	day = day or 0; hour = hour or 0; min = min or 0
	if absolute then
		return day.."."..hour.."."..min
	else
		if day > 0 then
			if day > 1 then
				str = day.." "..STR.en.ui[hash("days")]
			else
				str = day.." "..STR.en.ui[hash("day")]
			end
			if hour > 0 and min > 0 then
				str = str..", "
			elseif hour > 0 or min > 0 then
				str = str.." "..STR.en.ui[hash("and")].." "
			else
				return str
			end
		end

		if hour > 0 then
			if hour > 1 then
				str = str..hour.." "..STR.en.ui[hash("hours")]
			else
				str = str..hour.." "..STR.en.ui[hash("hour")]
			end
			if min > 0 then
				str = str.." "..STR.en.ui[hash("and")].." "
			else
				return str
			end
		end

		if min > 1 then
			str = str..min.." "..STR.en.ui[hash("minutes")]
		elseif min > 0 then
			str = str..min.." "..STR.en.ui[hash("minute")]
		else
			return STR.en.ui[hash("immediately")]
		end
		return str
	end
end

local function round_time(time)
	return math.ceil(time / 100) * 100
end

local update_clock
local function check_alarms()
	local time_skippable = true
	local rounded_time = math.ceil(TIME.time / 100) * 100
	for time = rounded_time, rounded_time + math.ceil(scale_data[TIME.scale].jump / 100) * 100 - 1, 100 do
		for key, val in ipairs(TIME.alarm[time] or {}) do
			local time_left = time - TIME.time
			if val.stop then
				if time_left > 0 then
					if time_skippable then
						time_skippable = false
						timer.cancel(ticker)
						ticker_once = timer.delay(scale_data[TIME.scale].freq, false, function() update_clock(time_left) end)
					end
				else
					time_skippable = false
					if val.type == hash("departure") then
						msg.post("#controller", hash("travel_destination_pressed"))
					elseif val.type == hash("leave_over") then
						STATS.leave_end = nil
						print("GET BACK TO WORK YOU LAZY SODS!")
					else
						print("UNKNOWN ALARM:", val.type)
					end
					val.stop = false
					TIME.set_scale(hash("normal"))
				end
			end
		end
	end
end

function update_clock(jump)
	TIME.time = TIME.time + (jump or scale_data[TIME.scale].jump)
	check_alarms()
	label.set_text("/clock#label", STR.en.ui[hash("stardate")].."\n"..TIME.get_time_string(TIME.time, true))
end

function TIME.start(reset)
	if reset or not TIME.running then
		if not TIME.running then
			for key, val in pairs(TIME.button) do
				msg.post(val, "turn_on")
			end
		end
		TIME.running = true
		ticker = timer.delay(scale_data[TIME.scale].freq, true, function() update_clock() end)
		update_clock(0)
	end
end

function TIME.stop()
	for key, val in pairs(TIME.button) do
		msg.post(val, "turn_off")
	end
	timer.cancel(ticker)
	TIME.running = false
end

function TIME.set_scale(scale)
	TIME.scale = scale
	for key, val in pairs(TIME.button) do
		if key == scale then
			msg.post(val, "highlight")
		else
			msg.post(val, "remove_highlight")
		end
	end
	if TIME.running then
		timer.cancel(ticker)
		TIME.start(true)
	end
end

function TIME.remove_alarm(type)
	for key, val in ipairs(TIME.alarm[TIME.alarm_list[type]]) do
		if val.type == type then
			table.remove(TIME.alarm[TIME.alarm_list[type]], key)
			TIME.alarm_list[type] = nil
			return true
		end
	end
end

function TIME.add_alarm(time, type, stop)
	if TIME.alarm_list[type] then TIME.remove_alarm(type) end
	time = math.floor(time / 100) * 100
	TIME.alarm[time] = TIME.alarm[time] or {}
	table.insert(TIME.alarm[time], {type = type, stop = stop})
	TIME.alarm_list[type] = time
end

return TIME