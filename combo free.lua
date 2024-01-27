setDefaultTab("Main")
UI.Separator()
local comboPanelName = "ComboFree"
local ui = setupUI([[
sPanel < Panel
  margin: 10
  layout:
    type: verticalBox
    
Panel
  height: 50
  Button
    id: editCombo
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    color: yellow
    anchors.right: parent.right
    height: 50
    text: - COMBO FREE -
]])
ui:setId(comboPanelName)

local comboTwoWindow = setupUI([[

MainWindow
  !text: tr('Combo Free')
  size: 250 380
  @onEscape: self:hide()

  TabBar
    id: tmpTabBar
    margin-left: 8
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
    comboTwoWindow:hide()
    local tabBar = comboTwoWindow.tmpTabBar
    tabBar:setContentWidget(comboTwoWindow.tmpTabContent)

    for v = 1, 1 do
        local scpPanel11 = g_ui.createWidget("sPanel") -- Creates Panel
        scpPanel11:setId("panelButtons") -- sets ID
        tabBar:addTab("Free 1", scpPanel11)
        local scpPanel12 = g_ui.createWidget("sPanel")
        scpPanel12:setId("panelButtons") -- sets ID
        tabBar:addTab("Free 2", scpPanel12)
        local scpPanel13 = g_ui.createWidget("sPanel")
        scpPanel13:setId("panelButtons") -- sets ID
        tabBar:addTab("Free 3", scpPanel13)
        local scpPanel14 = g_ui.createWidget("sPanel")
        scpPanel14:setId("panelButtons") -- sets ID
        tabBar:addTab("Free 4", scpPanel14)
        
        macro(200, "Naruto", function()
          if g_game.isAttacking() then
          say('Chou Oodama Rasen Tarengan')
          say('Chou Oodama Rasenshuriken')
          say('Fuuton Rasenshuriken')
         end
         end, scpPanel11)
         UI.Separator(scpPanel11)
      
         macro(200, "Sasuke", function()
          if g_game.isAttacking() then
          say('Susanoo Noshuku')
          say('Susanoo Strike')
          say('Katon Goryuka no Jutsu')
          say('Kirin')
         end
         end, scpPanel11)
         UI.Separator(scpPanel11)
      
      macro(200, "Sakura", function()
        if g_game.isAttacking() then
          say('Densetsu no Henrin')
          say('Dansu Fosu')
          say('Shannaro Punch')
         end
         end, scpPanel11)
         UI.Separator(scpPanel11)
      
      macro(200, "Kiba", function()
          if g_game.isAttacking() then
          say('Shikyaku Chietsu')
          say('Garoga Chi')
          say('Garouga')
         end
         end, scpPanel11)
         UI.Separator(scpPanel11)

         macro(200, "Shino", function()
          if g_game.isAttacking() then
          say('Kikaichuu Dragon')
          say('Kikai Arashi')
          say('Kikaichuu Tsumuji')
          end
        end, scpPanel11)
           UI.Separator(scpPanel11)
      
      macro(200, "Hinata", function()
        if g_game.isAttacking() then
        say('Hakke Kuhekisho')
        say('Hakke Hasangeki')
        say('Juhou Soshiken')
        end
      end, scpPanel11)
         UI.Separator(scpPanel11)
      
      macro(200, "Shikamaru", function()
          if g_game.isAttacking() then
          say('Kage Fuchi')
          say('Kage Nui')
          say('Otoko No Kage')
          say('Kageyose no Jutsu')
         end
         end, scpPanel11)
         UI.Separator(scpPanel11)
         
         macro(200, "Chouji", function()
          if g_game.isAttacking() then
          say('Cho Harite')
          say('Harite')
          say('Nikudan Hari Sensha')          
         end
         end, scpPanel11)  
         UI.Separator(scpPanel11) 
      
         macro(200, "Lee", function()
          if g_game.isAttacking() then
          say('Seishun Furu Pawa')
          say('Gorai Renge')
          say('Konoha Hariken')
         end
         end, scpPanel11)
         UI.Separator(scpPanel11)
      
         macro(200, "Neji", function()
          if g_game.isAttacking() then
          say('Jukenpo Ichigekishin')
          say('Hakke Hasangeki')
          say('Juuken Ryuu')
         end
         end, scpPanel12)
         UI.Separator(scpPanel12)

      macro(200, "Ten Ten", function()
          if g_game.isAttacking() then
          say('Sogu Tensasai')
          say('Baku Ryusei')
          say('Souryuu Tensakai')
         end
         end, scpPanel12)
         UI.Separator(scpPanel12)

         macro(200, "Gaara", function()
          if g_game.isAttacking() then
          say('Ryuusa Bakuryuu')
          say('Sabaku Ro')
          say('Sabaku Rou')
          say('Sabaku Taisou')
         end
         end, scpPanel12)
         UI.Separator(scpPanel12)
      
         macro(200, "Temari", function()
          if g_game.isAttacking() then
          say('Kazekiri no Jutsu')
          say('Kamaitachi no Jutsu')
          say('Ninpou Kuchyose Kiri Kiri Mai')
         end
         end, scpPanel12)
         UI.Separator(scpPanel12)
      
         macro(200, "Kankuro", function()
          if g_game.isAttacking() then
            say('Kurohigi Kiki Ippatsu')
            say('Kugutsu Fundan')
            say('Poison Bomb')
         end
         end, scpPanel12)
         UI.Separator(scpPanel12)
      
         macro(200, "Kakashi Drunk", function()
          if g_game.isAttacking() then
          say('Magen Kyo Tenchiten')
          say('Raiden')
          say('Kamui')
          say('Raikiri Nirentutsu')
         end
         end, scpPanel12)
         UI.Separator(scpPanel12)

         macro(200, "Kakashi Lize", function()
          if g_game.isAttacking() then
          say('Magen Narakumi No Jutsu')
          say('Raiden')
          say('Kamui')
          say('Raikiri Nirentutsu')
         end
         end, scpPanel12)
         UI.Separator(scpPanel12)
      
         macro(200, "Yamato", function()
          if g_game.isAttacking() then
          say('Mokuton Daijurin')
          say('Mokuton Koshukeki')
          say('Mokuton Shichuurou')
         end
         end, scpPanel12)
         UI.Separator(scpPanel12)
      
         macro(200, "Sai", function()
          if g_game.isAttacking() then
          say('Ninpou Choujuu Giga Sentoki')
          say('Ninpou Choujuu Giga Lion Combo')
          say('Ninpou Choujuu Giga Lion')
         end
         end, scpPanel12)
         UI.Separator(scpPanel12)
      
         macro(200, "Asuma", function()
          if g_game.isAttacking() then
          say('Katon Haisekisho Pushi')
          say('Katon Hiuchi Yagura')
          say('Katon Haisekisho')
         end
         end, scpPanel13)
         UI.Separator(scpPanel13)
      
         macro(200, "Kimimaro", function()
          if g_game.isAttacking() then
          say('Yanaki Sawarabi')
          say('Sawarabi no Mai')
          say('Yanagi no kara')
         end
         end, scpPanel13)
         UI.Separator(scpPanel13)
      
         macro(200, "Suigetsu", function()
          if g_game.isAttacking() then
          say('Suiton Suirou no Jutsu')
          say('Noen Jokiryu')
          say('Gosuiwan Kaie')
          say('Mizudeppo no Jutsu')
         end
         end, scpPanel13)
         UI.Separator(scpPanel13)
      
         macro(200, "Juugo", function()
          if g_game.isAttacking() then
          say('Saibo Haishutsu Pushi')
          say('Kassokuken Isshiki')
          say('Saibo Haishutsu')
         end
         end, scpPanel13)
         UI.Separator(scpPanel13)
      
         macro(200, "Obito", function()
          if g_game.isAttacking() then
          say('Roraku no Bakuen')
          say('Katon Goka Messhitsu')
          say('Fujin Katon Chakka no Jutsu')
          say('Fujin Chakka no Jutsu')
         end
         end, scpPanel13)
         UI.Separator(scpPanel13)
      
         macro(200, "Shisui", function()
          if g_game.isAttacking() then
          say('Magen Kasegui no Jutsu')
          say('Susanoo Ken')
          say('Susanoo Pushi')
         end
         end, scpPanel13)
         UI.Separator(scpPanel13)
      
         macro(200, "Kabuto", function()
          if g_game.isAttacking() then
          say('Suiton Daibakufu no Jutsu')
          say('Sawarabi no Mai')
          say('Kusanagi no Tsurugi')
         end
         end, scpPanel13)
         UI.Separator(scpPanel13)
      
         macro(200, "Karin", function()
          if g_game.isAttacking() then
          say('Densetsu no Henrin')
          say('Dansu Fosu')
          say('Jagei Jubaku')
         end
         end, scpPanel13)
         UI.Separator(scpPanel13)

        macro(200, "Ino", function()
          if g_game.isAttacking() then
          say('Profusion Of Ten Thousand Flowers')
          say('Dansu Fosu')
          say('Ninpou Hanna Kaishin')
         end
         end, scpPanel13)
         UI.Separator(scpPanel13)

      macro(200, "Haku", function()
          if g_game.isAttacking() then
          say('Makyo Hyosho')
          say('Nadare Mai')
          say('Sensatsu Suisho')
         end
         end, scpPanel14)
        UI.Separator(scpPanel14)

         macro(200, "Konohamaru", function()
          if g_game.isAttacking() then
          say('Fuma Shuriken Kage Bunshin no Jutsu')
          say('Katon Hiuchi Yagura')
          say('Choodama Rasengan')
         end
         end, scpPanel14)
         UI.Separator(scpPanel14)
    end

    comboTwoWindow.closeButton.onClick = function(widget)
        comboTwoWindow:hide()
    end

    ui.editCombo.onClick = function(widget)
        comboTwoWindow:show()
        comboTwoWindow:raise()
        comboTwoWindow:focus()
    end
end
