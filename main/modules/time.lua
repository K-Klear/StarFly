local STR = require("main/modules/strings")

local TIME = {
	time = 100000,
	runnning = false,
	scale = {freq = 0.864, jump = 1},
	alarm = {}
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
	for time = rounded_time, rounded_time + math.ceil(TIME.scale.jump / 100) * 100 - 1, 100 do
		for key, val in ipairs(TIME.alarm[time] or {}) do
			local time_left = time - TIME.time
			if val.stop then
				if time_left > 0 then
					if time_skippable then
						time_skippable = false
						timer.cancel(ticker)
						ticker_once = timer.delay(TIME.scale.freq, false, function() update_clock(time_left) end)
					end
				else
					time_skippable = false
					print("ALARM!", val.type)
					val.stop = false
					TIME.set_scale({freq = 0.864, jump = 1})
				end
			end
		end
	end
end

function update_clock(jump)
	TIME.time = TIME.time + (jump or TIME.scale.jump)
	check_alarms()
	label.set_text("/clock#label", STR.en.ui[hash("stardate")].."\n"..TIME.get_time_string(TIME.time, true))
end

function TIME.start(reset)
	if reset or not TIME.running then
		TIME.running = true
		ticker = timer.delay(TIME.scale.freq, true, function() update_clock() end)
		update_clock(0)
	end
end

function TIME.stop()
	timer.cancel(ticker)
	TIME.running = false
end

function TIME.set_scale(scale)
	TIME.scale = scale
	if TIME.running then
		timer.cancel(ticker)
		TIME.start(true)
	end
end

function TIME.add_alarm(time, type, stop)
	TIME.alarm[time] = TIME.alarm[time] or {}
	table.insert(TIME.alarm[time], {type = type, stop = stop})
end

return TIME