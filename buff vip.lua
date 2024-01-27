UI.Separator()
local comboPanelName = "Buff"
local ui = setupUI([[
ssPanel < Panel
  margin: 10
  layout:
    type: verticalBox
    
Panel
  height: 50
  Button
    id: editBuff
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    color: green
    anchors.right: parent.right
    height: 50
    text: - BUFF VIP -
]])
ui:setId(comboPanelName)

local BuffWindow = setupUI([[

MainWindow
  !text: tr('Buff')
  size: 250 380
  @onEscape: self:hide()

  TabBar
    id: tmpTabBar
    margin-left: 45
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right

  Panel
    id: tmpTabContent
    anchors.top: tmpTabBar.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 3
    size: 200 280
    image-source: /data/images/ui/panel_flat
    image-border: 6

  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 21
    margin-top: 15
    margin-right: 1  
]], g_ui.getRootWidget())

local rootWidget = g_ui.getRootWidget()
if rootWidget then
    BuffWindow:hide()
    local tabBar = BuffWindow.tmpTabBar
    tabBar:setContentWidget(BuffWindow.tmpTabContent)

    for v = 1, 1 do
        local buffPanel = g_ui.createWidget("ssPanel") -- Creates Panel
        buffPanel:setId("panelButtons") -- sets ID
        tabBar:addTab("Vip 1", buffPanel)
        local buffPanel2 = g_ui.createWidget("ssPanel")
        buffPanel2:setId("panelButtons") -- sets ID
        tabBar:addTab("Vip 2", buffPanel2)
        local buffPanel3 = g_ui.createWidget("ssPanel")
        buffPanel3:setId("panelButtons") -- sets ID
        tabBar:addTab("Vip 3", buffPanel3)
        
        Buff = {
          spell = {
            Anbu = 'ninpou berserker',
            Itachi = 'fuumetsu sharingan',
            Hidan = 'Jashin Chikara',
            Kakuzu = 'Doton Boei',
            Bee = 'Doton Boei',
            Kisame = 'Suiton Suijinheki',
            Minato = 'Raiton Shunshin No Jutsu',
            Madara = 'Susanooo',
            Tobirama = 'Suiton Suijinheki',
            TobiramaSpeed = 'Suiro no muchi',
            Tsunade = 'Infuin Kai',
            Deidara = 'Kinjutsu',
            Orochimaru = 'Juinjutsu',
            Hashirama = 'Senjutsu Kai',
            Jiraya = 'Sennin Modo',
            Raikage = 'Raiton Chakura Modo',
            Konan  = 'Kami No Tsubasa',
            Sasori = 'Karakuri Sandan',
            GuyRed = 'Open Gates Of Death',
            GuyBlue = 'Open Gates Of Wonder',
            GuyGreen = 'Open Gates Of Life',
            Hiruzen = 'Gogyo Kaiin',
            Nagato = 'Yogen no Ko',
            Onoki = 'Doton Keijuugan no Jutsu',
            Zetsu = 'Kuroi Jushinki',
          },
           cooldown = 60 * 1000, 
           time = 0
        }
        macro(100, 'Anbu', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Anbu);
        end, buffPanel);
        UI.Separator(buffPanel)
        
        macro(100, 'Itachi', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Itachi);
        end, buffPanel);
        UI.Separator(buffPanel)
        
        macro(100, 'Hidan', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Hidan);
        end, buffPanel);
        UI.Separator(buffPanel)
        
        macro(100, 'Kakuzu', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Kakuzu);
        end, buffPanel);
        UI.Separator(buffPanel)
        
        macro(100, 'Bee', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Bee);
        end, buffPanel);
        UI.Separator(buffPanel)
        
        macro(100, 'Kisame', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Kisame);
        end, buffPanel);
        UI.Separator(buffPanel)
        
        macro(100, 'Minato', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Minato);
        end, buffPanel);
        UI.Separator(buffPanel)
        
        macro(100, 'Madara', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Madara);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Tobirama ML', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Tobirama);
        end, buffPanel);
        UI.Separator(buffPanel)

        macro(100, 'Tobirama Speed', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.TobiramaSpeed);
        end, buffPanel);
        UI.Separator(buffPanel)
        
        macro(100, 'Tsunade', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Tsunade);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Deidara', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Deidara);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Hashirama', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Hashirama);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Jiraya', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Jiraya);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Raikage', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Raikage);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Sasori', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Sasori);
        end, buffPanel3);
        UI.Separator(buffPanel3)
        
        macro(100, 'GuyRed', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.GuyRed);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'GuyBlue', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.GuyBlue);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'GuyGreen', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.GuyGreen);
        end, buffPanel2);
        UI.Separator(buffPanel2)

        macro(100, 'Konan', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Tobirama);
        end, buffPanel3);
        UI.Separator(buffPanel3)

        macro(100, 'Hiruzen', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Hiruzen);
        end, buffPanel3);
        UI.Separator(buffPanel3)
        
        macro(100, 'Nagato', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Nagato);
        end, buffPanel3);
        UI.Separator(buffPanel3)
        
        macro(100, 'Onoki', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Onoki);
        end, buffPanel3);
        UI.Separator(buffPanel3)
        
        macro(100, 'Zetsu', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Zetsu, buffPanel3);
        end, buffPanel3);
        UI.Separator(buffPanel3)
        
        onTalk(function(name, level, mode, text, channelId, pos)
          if (name ~= player:getName() or mode ~= 44) then return; end
        
          text = text:lower();
          if (text ~= Buff.spell.Anbu) then
          elseif (text ~= Buff.spell.Itachi) then
          elseif (text ~= Buff.spell.Hidan) then
          elseif (text ~= Buff.spell.Kakuzu) then
          elseif (text ~= Buff.spell.Bee) then
          elseif (text ~= Buff.spell.Kisame) then
          elseif (text ~= Buff.spell.Minato) then
          elseif (text ~= Buff.spell.Madara) then
          elseif (text ~= Buff.spell.Tobirama) then
          elseif (text ~= Buff.spell.TobiramaSpeed) then
          elseif (text ~= Buff.spell.Tsunade) then
          elseif (text ~= Buff.spell.Deidara) then
          elseif (text ~= Buff.spell.Orochimaru) then
          elseif (text ~= Buff.spell.Hashirama) then
          elseif (text ~= Buff.spell.Jiraya) then
          elseif (text ~= Buff.spell.Raikage) then
          elseif (text ~= Buff.spell.Konan) then
          elseif (text ~= Buff.spell.Sasori) then
          elseif (text ~= Buff.spell.GuyRed) then
          elseif (text ~= Buff.spell.GuyBlue) then
          elseif (text ~= Buff.spell.GuyGreen) then
          elseif (text ~= Buff.spell.Hiruzen) then
          elseif (text ~= Buff.spell.Nagato) then
          elseif (text ~= Buff.spell.Onoki) then
          elseif (text ~= Buff.spell.Zetsu) then
            return
          end
          Buff.time = now + Buff.cooldown;
        end)
    end

    BuffWindow.closeButton.onClick = function(widget)
        BuffWindow:hide()
    end

    ui.editBuff.onClick = function(widget)
        BuffWindow:show()
        BuffWindow:raise()
        BuffWindow:focus()
    end
end
