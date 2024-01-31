setDefaultTab("Main")
UI.Separator()
local comboPanelName = "Combo"
local ui = setupUI([[
sPanel < Panel
  margin: 10
  layout:
    type: verticalBox
    
Panel
  height: 50
  Button
    id: editScript
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    color: green
    anchors.right: parent.right
    height: 50
    text: - COMBO VIP -
]])
ui:setId(comboPanelName)

local comboWindow = setupUI([[

MainWindow
  !text: tr('Combo')
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
    comboWindow:hide()
    local tabBar = comboWindow.tmpTabBar
    tabBar:setContentWidget(comboWindow.tmpTabContent)

    for v = 1, 1 do
        local scpPanel = g_ui.createWidget("sPanel") -- Creates Panel
        scpPanel:setId("panelButtons") -- sets ID
        tabBar:addTab("Vip 1", scpPanel)
        local scpPanel2 = g_ui.createWidget("sPanel")
        scpPanel2:setId("panelButtons") -- sets ID
        tabBar:addTab("Vip 2", scpPanel2)
        local scpPanel3 = g_ui.createWidget("sPanel")
        scpPanel3:setId("panelButtons") -- sets ID
        tabBar:addTab("Vip 3", scpPanel3)
        
        macro(200, "Itachi Drunk", function()
          if g_game.isAttacking() then
          say('Magen Kyo Tenchiten')
          say('Yasakaa Magatama')
          say('Tsukuyomi Gomum')
          say('Katon Hosenka Tsumabeni')
          say('Amaterasuu')
         end
         end, scpPanel)
         UI.Separator(scpPanel)
      
         macro(200, "Itachi Lize", function()
          if g_game.isAttacking() then
          say('Tsukuyomi')
          say('Yasakaa Magatama')
          say('Tsukuyomi Gomum')
          say('Katon Hosenka Tsumabeni')
          say('Amaterasuu')
         end
         end, scpPanel)
         UI.Separator(scpPanel)
      
      macro(200, "Kakuzu", function()
        if g_game.isAttacking() then
          say('Suiryu Ganshu')
          say('Katon Fuuton Enpu no Rappa')
          say('Fuuton Kaze No Ha')
         end
         end, scpPanel)
         UI.Separator(scpPanel)
      
      macro(200, "Anbu Trap", function()
          if g_game.isAttacking() then
          say('Ninpou Raiton Barrier')
          say('Raiton Shichuu Shibari')
          say('Mokuton Koshukeki')
          say('Katon Habashiri')
         end
         end, scpPanel)
         UI.Separator(scpPanel)
      
      macro(200, "Anbu", function()
        if g_game.isAttacking() then
        say('Mokuton Doryu heki')
        say('Raiton Shichuu Shibari')
        say('Mokuton Koshukeki')
        say('Ninpou Suiton Suiryuudan')
        end
      end, scpPanel)
         UI.Separator(scpPanel)
      
      macro(200, "Bee Stack", function()
          if g_game.isAttacking() then
          say('Akurobatto')
          say('Heddo Batto')
          say('Lariat')
         end
         end, scpPanel)
         UI.Separator(scpPanel)
         
         macro(200, "Bee No Stack", function()
          if g_game.isAttacking() then
          say('Hachibi Bijuu Dama')
          say('Raiton Seven Swords Dance')
          say('hachibi no kyogyuu imari')
          say('Raiton Ultimate Kick')
          
         end
         end, scpPanel)  
         UI.Separator(scpPanel) 
      
         macro(200, "Minato Stack", function()
          if g_game.isAttacking() then
          say('Ryooko Basho Tenki')
          say('Raminarei')
          say('Flash Chou Odama Rasengan')
          say('Hiraishin No Jutsu')
         end
         end, scpPanel)
         UI.Separator(scpPanel)
      
         macro(200, "Minato No Stack", function()
          if g_game.isAttacking() then
          say('Raminarei')
          say('Hiraishin No Jutsu')
          say('Raikiri Nirentutsu')
          say('Flash Rasenrengan')
         end
         end, scpPanel)
         UI.Separator(scpPanel)

      macro(200, "Kisame", function()
          if g_game.isAttacking() then
          say('Suiton Daikodan')
          say('Suiton Goshokuzame Kai')
          say('Suiton Goshokuzame')
          say('JUTSU4')
         end
         end, scpPanel2)
         UI.Separator(scpPanel2)

         macro(200, "Tobirama", function()
          if g_game.isAttacking() then
          say('Suishoha Yomi')
          say('Gojo Kibaku Fuda')
          say('Suiton Teppodama')
          say('Suiton Suishoha')
         end
         end, scpPanel2)
         UI.Separator(scpPanel2)
      
         macro(200, "Tsunade Trap", function()
          if g_game.isAttacking() then
          say('Tsutenkyaku Chiyu')
          say('Densetsu no Henrin')
          say('Tsutenkyaku Chakra')
          say('Taihou Kyaku No Jutsu')
         end
         end, scpPanel2)
         UI.Separator(scpPanel2)
      
         macro(200, "Tsunade", function()
          if g_game.isAttacking() then
            say('Densetsu no Henrin')
            say('Tsutenkyaku Chakra')
            say('Taihou Kyaku No Jutsu')
         end
         end, scpPanel2)
         UI.Separator(scpPanel2)
      
         macro(200, "Deidara", function()
          if g_game.isAttacking() then
          say('Kuchyose Shi')
          say('Kibaku Jirai')
          say('Kuchyose Shi Suri')
         end
         end, scpPanel2)
         UI.Separator(scpPanel2)
      
         macro(200, "Orochimaru", function()
          if g_game.isAttacking() then
          say('Moja no Kaminari')
          say('Seneijashu')
          say('Kusanagi no Tsurugi')
         end
         end, scpPanel2)
         UI.Separator(scpPanel2)
      
         macro(200, "Hashirama", function()
          if g_game.isAttacking() then
          say('Mokuton Kajukai Korin')
          say('Mokuton Taiju Hogeki')
          say('Mokuton Taiju Gotan')
         end
         end, scpPanel2)
         UI.Separator(scpPanel2)
      
         macro(200, "Jiraiya", function()
          if g_game.isAttacking() then
          say('Senpo Goemon')
          say('Kuchiyose Yatai Kuzushi')
          say('Choodama Rasengan')
          say('Fuuin Kaiin Kai')
         end
         end, scpPanel2)
         UI.Separator(scpPanel2)
      
         macro(200, "Raikage", function()
          if g_game.isAttacking() then
          say('Raitoningu Sutoreto')
          say('Girochin Doroppu')
          say('Raigyaku Suihei')
          say('Aian Kuro')
         end
         end, scpPanel2)
         UI.Separator(scpPanel2)
      
         macro(200, "Konan", function()
          if g_game.isAttacking() then
          say('Kami No Taifuu no Jutsu')
          say('Shikigami no Bachi')
          say('Kami Bakuryuu')
         end
         end, scpPanel3)
         UI.Separator(scpPanel3)
      
         macro(200, "Sasori", function()
          if g_game.isAttacking() then
          say('Akahigi Hyakki no Soen')
          say('Kugutsu no Jutsu')
          say('Satetsu Kesshu')
          say('Satetsu Kesshu Tsuchi')
         end
         end, scpPanel3)
         UI.Separator(scpPanel3)
      
         macro(200, "Guy", function()
          if g_game.isAttacking() then
          say('Yagai')
          say('Sekizo')
          say('Hirudora')
          say('Konoha Tsumuji Senpu')
         end
         end, scpPanel3)
         UI.Separator(scpPanel3)
      
         macro(200, "Hiruzen", function()
          if g_game.isAttacking() then
          say('Fuma Shuriken Kage Bunshin no Jutsu')
          say('Enkoo Enma Chi')
          say('Kongonyoi Reppu')
         end
         end, scpPanel3)
         UI.Separator(scpPanel3)
      
         macro(200, "Nagato", function()
          if g_game.isAttacking() then
          say('Tengai Shinsei Banme')
          say('Do Kyukon No Jutsu')
          say('Do Kuchyose')
          say('Do Kaiwan No Hiya')
          say('Tengai Shinsei')
          say('Do Bansho Tenin')
         end
         end, scpPanel3)
         UI.Separator(scpPanel3)
      
         macro(200, "Onoki", function()
          if g_game.isAttacking() then
          say('Jinton Genkai Hakuri no Jutsu')
          say('Doton Ganchuusou')
          say('Doton Ganseki Shuriken')
         end
         end, scpPanel3)
         UI.Separator(scpPanel3)

         macro(200, "Zetsu", function()
          if g_game.isAttacking() then
          say('Mokuton Kongo Shoboku')
          say('Jukai Shinshoku')
          say('Tomogoroshi no Haikotsu')
         end
         end, scpPanel3)
         UI.Separator(scpPanel3)

         macro(200, "Hidan", function()
          if g_game.isAttacking() then
          say('Dansaburedo')
          say('Jashin Dance Scythe')
          say('Scythe Impulse')
         end
         end, scpPanel3)
         UI.Separator(scpPanel3)

         macro(200, "Madara", function()
          if g_game.isAttacking() then
          say('Susanoo Dan')
          say('Tengai Shinsei Banme')
          say('Yasaka Magatama')
          say('Tengai Shinsei')
         end
         end, scpPanel3)
         UI.Separator(scpPanel3)
    end

    comboWindow.closeButton.onClick = function(widget)
        comboWindow:hide()
    end

    ui.editScript.onClick = function(widget)
        comboWindow:show()
        comboWindow:raise()
        comboWindow:focus()
    end
end
