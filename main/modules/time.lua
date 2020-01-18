local STR = require("main/modules/strings")

local TIME = {
	time = 100000,
	runnning = false,
	scale = {freq = 0.864, jump = 1},
	alarm = {}
}
local ticker, ticker_once

function TIME.get_time_parts(time)
	if num then
		return tonumber(string.sub(time, 1, -6)), tonumber(string.sub(time, -5, -5)), tonumber(string.sub(time, -4, -3)), tonumber(string.sub(time, -2, -1))
	else
		return string.sub(time, 1, -6), string.sub(time, -5, -5), string.sub(time, -4, -3), string.sub(time, -2, -1)
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
	local day, hour, min, sec = TIME.get_time_parts(TIME.time)
	label.set_text("/clock#label", STR.en.ui[hash("stardate")].."\n"..day.."."..hour.."."..min)
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