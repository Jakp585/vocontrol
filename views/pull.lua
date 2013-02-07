local json = dofile("lib/json.lua")
local Queue = dofile("queue.lua")

local queue = Queue:new()


-- Target change
local function target(event, data)
    queue:set("target", GetTargetInfo())
end
RegisterEvent(target, "TARGET_CHANGED")

--- Get info for a player.
-- @return a tuple (name, dist, health, faction_id, faction_name)
local function player_info(pid)
    return {
        GetPlayerName(pid),
        math.ceil(GetPlayerDistance(pid) or -1),
        math.ceil(GetPlayerHealth(pid)),
        GetPlayerFaction(pid),
        FactionName[GetPlayerFaction(pid)],
        GetGuildTag(pid)}
end

-- Chat Messages
local function chat(event, data)
    if not chatinfo[event]["formatstring"] then
        return
    end

    local add = {
        color="#"..chatinfo[event][1]:sub(2),
        formatstring=chatinfo[event]["formatstring"],
    }
    for k, v in pairs(data) do
        add[k] = v
    end
    if data["faction"] then
        add["faction_color"] = "#"..rgbtohex(FactionColor_RGB[data["faction"]]):sub(2)
    end
    if data["location"] then
        add["location"] = ShortLocationStr(data["location"])
    end
    if data["color"] then
        add["color"] = data["color"]:sub(2)
    end
    queue:append("chat", add)
end

-- Print Messages
local print_orig = print
function print(...)
    print_orig(...)
    for _, line in ipairs(vomote.util.string.split(..., "\n")) do
        queue:append("chat", {formatstring="<msg>", color="#28b4f0", msg=line})
    end
end

for k, _ in pairs(chatinfo) do
    RegisterEvent(chat, k)
end

local function serve(req)
    local last_query = tonumber(req.get_data["last_query"]) or nil

    local r = vomote.http.response.Response:new()
    r.headers["Content-Type"] = "application/json"
    --r.headers["Connection"] = "Keep-Alive"

    local sector = {}
    -- tostring because the json lib is broken
    ForEachPlayer(function(pid)
        if GetPlayerName(pid):sub(0, 20) ~= "(reading transponder" then
            sector[tostring(pid)] = player_info(pid)
        end
    end)
    queue:set_volatile("sector", sector)

    if not last_query then
        queue:set_volatile("player", player_info(GetCharacterIDByName(GetPlayerName())))
    end

    r.body = json.encode(queue:construct(last_query))
    queue:reset()
    return r
end

return serve
