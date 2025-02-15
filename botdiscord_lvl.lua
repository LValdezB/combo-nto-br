local discordTimes = {}
local webhook = "https://discord.com/api/webhooks/1325981805731516537/_bqfEfKfdJBHN1491xkv6ep33S4pqCppkgPQwbhDRlnz9KsocrX9-3KtYFzKj5jX1luw"
local default_data = {
  username = "Senhor do Engenho",
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
    discordTimes[id] = os.time() + (0)
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
nivelAnterior = {}

onTextMessage(function(mode, text)
    jogadores = {}
    for _, part in pairs(text:split(',')) do
        trimmedPart = part:trim()
        nome, nivel = trimmedPart:match("%s?([^%[]+)%s+%[([^%]]+)%]%s?")
        if nome and nivel then
            nivel = tonumber(nivel)
            if nivelAnterior[nome] then
                if nivelAnterior[nome] ~= nivel and nivel >= 650 and not isPlayerFriend(nome) then  
                    local data = {
                        title = 'Mudou de Nivel',
                        name = nome,
                        message = "mudou de " .. nivelAnterior[nome] .. " para " .. nivel,
                        id = "pd",
                    }
                    modules.game_textmessage.displayGameMessage("O nível de " .. nome .. " mudou de " .. nivelAnterior[nome] .. " para " .. nivel)
                    sendDiscordWebhook(data)
                end
            end
            nivelAnterior[nome] = nivel
        end
    end
end)

function isPlayerFriend(playerName)
    return table.contains(storage["playerList"].friendList, playerName)
end
macro(10000, 'check online', function ()
  say('!online')
end)
UI.Button("Reset List", function()
storage["playerList"].friendList = {}
end)
