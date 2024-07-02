



local discordTimes = {}
local webhook = "https://discord.com/api/webhooks/1257519709377794048/l7gO2vVB1U1KGb3XdrsAyPBqcPK2jcq9x5tV-ELo1a5qHcDwmRVeKWPLY1cu0qcT9Gkr" -- Url do Webhook

local default_data = {
  username = "fogueteiro", -- Nome do Webhook
}

local embed = {
    color = 10038562,
  }
  function onHTTPResult(data, err)
    if err then
      print("Discord Webhook Error: ".. err)
    end
  end
  function sendDiscordWebhook(data)
  local id = data.id
    if id then
      local dTime = discordTimes[id]
      if dTime and os.time() < dTime then return end
      discordTimes[id] = os.time() + (0) -- delayed value or 10 seconds
    end
  
    local dEmbed = embed
    if data.color then dEmbed.color = data.color end
    dEmbed.title = "**".. data.title .."**"
    dEmbed.fields = {
      {
        name = "Name: ",
        value = data.name,
      },
      {
        name = "Message",
        value = data.message,
      },
    }
  
    local dataSend = default_data
    dataSend.embeds = { dEmbed }
    HTTP.postJSON(webhook, dataSend, onHTTPResult)
  end

playerdetected = {}
local detectedPlayers = {}
local function wasRecentlyDetected(playerName)
    if detectedPlayers[playerName] then
        if detectedPlayers[playerName] > now then
            return true
        else
            detectedPlayers[playerName] = nil
        end
    end
    return false
end
playerdetected.macro = macro(200, "Player Detected", function()
    for _, creature in pairs(getSpectators(pos)) do
        if creature:isPlayer() and creature:getId() ~= player:getId() and creature:getEmblem() ~= 1 then
            if not wasRecentlyDetected(creature:getName()) then
                detectedPlayers[creature:getName()] = now + 10000
                local data = {
                    title = 'Local',
                    name = creature:getName(), -- Mudar o nome da cidade
                    message = City,
                    id = "pd",
                }
                sendDiscordWebhook(data)
            end
        end
    end
end)
City = storage.City
UI.Label("City")
addTextEdit("City", storage.City, function(widget, text)
  storage.City = text
end)