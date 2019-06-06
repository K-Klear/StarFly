local EVENTS = {}

local eventList = {
	"nothing"
}

function EVENTS.getEvent()
	return eventList[math.random(1, #eventList)]
end



return EVENTS