setDefaultTab("Main")
UI.Separator()
local comboPanelName = "BuffTwo"
local ui = setupUI([[
svPanel < Panel
  margin: 10
  layout:
    type: verticalBox
    
Panel
  height: 50
  Button
    id: editBuffTwo
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    color: yellow
    anchors.right: parent.right
    height: 50
    text: - BUFF FREE -
]])
ui:setId(comboPanelName)

local BuffTwoWindow = setupUI([[

MainWindow
  !text: tr('BUFF')
  size: 250 380
  @onEscape: self:hide()

  TabBar
    id: tmpTabBar
    margin-left: 30
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
    BuffTwoWindow:hide()
    local tabBar = BuffTwoWindow.tmpTabBar
    tabBar:setContentWidget(BuffTwoWindow.tmpTabContent)

    for v = 1, 1 do
        local buffPanel1 = g_ui.createWidget("svPanel")
        buffPanel1:setId("panelButtons")
        tabBar:addTab("FREE 1", buffPanel1)
        local buffPanel2 = g_ui.createWidget("svPanel")
        buffPanel2:setId("panelButtons")
        tabBar:addTab("FREE 2", buffPanel2)
        local buffPanel3 = g_ui.createWidget("svPanel")
        buffPanel3:setId("panelButtons") 
        tabBar:addTab("FREE 3", buffPanel3)
        
        local Buff = {
          spell = {
            Naruto = 'full mode',
            Sasuke = 'chidori boei',
            Sakura = 'shannaro',
            Kiba = 'shikyaku no jutsu',
            Shino = 'kikai chuu',
            Hinata = 'byakugan',
            Shikamaru = 'kage noshuku sa reta',
            Chouji = 'sikudan sensha',
            Lee = 'open gates',
            Neji = 'byakugan',
            TenTen = 'sou shuu jin',
            Temari = 'fuuton boei',
            Kankuro = 'ningyo no hogo',
            Kakashi = 'mangekyou sharingan',
            Yamato = 'doton ga tentov',
            Sai  = 'ninpou choujuu boei',
            Asuma = 'raigou senjusatsu',
            Kimimaro = 'karamatsu no mai',
            Suigetsu = 'suiton chikara',
            Juugo = 'chi no juin',
            Obito = 'kaenjin',
            Shisui = 'susanoo fuuin',
            Kabuto = 'sennin modo supure',
            Karin = 'kagura shingan',
            Ino = 'flower dance',
            Haku = 'kirigakure no jutsu',
            Konohamaru = 'sennin modo',
          },
           cooldown = 60 * 1000, 
           time = 0
        }

        macro(100, 'Naruto', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Naruto);
        end, buffPanel1);
        UI.Separator(buffPanel1)
        
        macro(100, 'Sasuke', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Sasuke);
        end, buffPanel1);
        UI.Separator(buffPanel1)
        
        macro(100, 'Sakura', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Sakura);
        end, buffPanel1);
        UI.Separator(buffPanel1)
        
        macro(100, 'Kiba', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Kiba);
        end, buffPanel1);
        UI.Separator(buffPanel1)
        
        macro(100, 'Shino', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Shino);
        end, buffPanel1);
        UI.Separator(buffPanel1)
        
        macro(100, 'Hinata', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Hinata);
        end, buffPanel1);
        UI.Separator(buffPanel1)
        
        macro(100, 'Shikamaru', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Shikamaru);
        end, buffPanel1);
        UI.Separator(buffPanel1)
        
        macro(100, 'Chouji', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Chouji);
        end, buffPanel1);
        UI.Separator(buffPanel1)
        
        macro(100, 'Lee', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Lee);
        end, buffPanel1);
        UI.Separator(buffPanel1)
        
        macro(100, 'Neji', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Neji);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'TenTen', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.TenTen);
        end, buffPanel2);
        UI.Separator(buffPanel2)

        macro(100, 'Temari', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Temari);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Kankuro', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Kankuro);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Kakashi', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Kakashi);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Yamato', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Yamato);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Sai', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Sai);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Asuma', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Asuma);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Kimimaro', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Kimimaro);
        end, buffPanel2);
        UI.Separator(buffPanel2)
        
        macro(100, 'Suigetsu', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Suigetsu);
        end, buffPanel3);
        UI.Separator(buffPanel3)
        
        macro(100, 'Juugo', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Juugo);
        end, buffPanel3);
        UI.Separator(buffPanel3)
        
        macro(100, 'Obito', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Obito);
        end, buffPanel3);
        UI.Separator(buffPanel3)
        
        macro(100, 'Shisui', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Shisui);
        end, buffPanel3);
        UI.Separator(buffPanel3)
        
        macro(100, 'Kabuto', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Kabuto);
        end, buffPanel3);
        UI.Separator(buffPanel3)

        macro(100, 'Karin', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Karin);
        end, buffPanel3);
        UI.Separator(buffPanel3)

        macro(100, 'Ino', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Ino);
        end, buffPanel3);
        UI.Separator(buffPanel3)

        macro(100, 'Haku', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Haku);
        end, buffPanel3);
        UI.Separator(buffPanel3)

        macro(100, 'Konohamaru', function()
          if (Buff.time >= now) then return; end
          say(Buff.spell.Konohamaru);
        end, buffPanel3);
        UI.Separator(buffPanel3)

        onTalk(function(name, level, mode, text, channelId, pos)
          if (name ~= player:getName() or mode ~= 44) then return
          end
        
          text = text:lower();
          if (text == Buff.spell.Naruto or
              text == Buff.spell.Sasuke or
              text == Buff.spell.Sakura or
              text == Buff.spell.Kiba or
              text == Buff.spell.Shino or
              text == Buff.spell.Hinata or
              text == Buff.spell.Shikamaru or
              text == Buff.spell.Chouji or
              text == Buff.spell.Lee or
              text == Buff.spell.Neji or
              text == Buff.spell.TenTen or
              text == Buff.spell.Temari or
              text == Buff.spell.Kankuro or
              text == Buff.spell.Kakashi or
              text == Buff.spell.Yamato or
              text == Buff.spell.Sai or
              text == Buff.spell.Asuma or
              text == Buff.spell.Kimimaro or
              text == Buff.spell.Suigetsu or
              text == Buff.spell.Juugo or
              text == Buff.spell.Obito or
              text == Buff.spell.Shisui or
              text == Buff.spell.Kabuto or
              text == Buff.spell.Karin or
              text == Buff.spell.Ino or
              text == Buff.spell.Haku or
              text == Buff.spell.Konohamaru) then
            Buff.time = now + Buff.cooldown;
          end 
        end)
    end

    BuffTwoWindow.closeButton.onClick = function(widget)
        BuffTwoWindow:hide()
    end

    ui.editBuffTwo.onClick = function(widget)
        BuffTwoWindow:show()
        BuffTwoWindow:raise()
        BuffTwoWindow:focus()
    end
end
