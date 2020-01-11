local TIME = {time = 100090, runnning = false, scale = 1}
local ticker

local function update_clock()
	if TIME.scale < 5 then
		TIME.time = TIME.time + TIME.scale
	else
		TIME.time = TIME.time + (TIME.scale / 10)
	end
	local day, hour, min, sec =
	string.sub(TIME.time, 1, -6),
	string.sub(TIME.time, -5, -5),
	string.sub(TIME.time, -4, -3),
	string.sub(TIME.time, -2, -1)
	label.set_text("/clock#label", "Day "..day.." "..hour..":"..min..":"..sec.."\nShipboard time")
end

function TIME.start(reset)
	if reset or not TIME.running then
		TIME.running = true
		if TIME.scale < 5 then
			ticker = timer.delay(0.864, true, update_clock)
		else
			ticker = timer.delay(0.864 / 10, true, update_clock)
		end
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

return TIME