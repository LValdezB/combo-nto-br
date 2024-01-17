



UI.Separator()
 local scriptsPanelName = "Scriptss"
  local ui = setupUI([[
Panel

  height: 50

  Button
    id: editScript
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 50
    text: - COMBO VIP -
    


  ]], parent)
  ui:setId(scriptsPanelName)

  if not storage[scriptsPanelName] then
    storage[scriptsPanelName] = { 

    }
  end

rootWidget = g_ui.getRootWidget()
if rootWidget then
    ScriptWindow = UI.createWindow('ScriptsWindow', rootWidget)
    ScriptWindow:hide()
    TabBar = ScriptWindow.tmpTabBar
    TabBar:setContentWidget(ScriptWindow.tmpTabContent)
    for v = 1, 1 do


scpPanel = g_ui.createWidget("sPanel") -- Creates Panel
scpPanel:setId("panelButtons") -- sets ID
scpPanel2 = g_ui.createWidget("sPanel") -- Creates Panel
scpPanel2:setId("panelButtons") -- sets ID
scpPanel3 = g_ui.createWidget("sPanel") -- Creates Panel
scpPanel3:setId("panelButtons") -- sets ID
TabBar:addTab("Vip 1", scpPanel)
TabBar:addTab("Vip 2", scpPanel2)
TabBar:addTab("Vip 3", scpPanel3)
macro(200, "Itachi Drunk", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel)
   UI.Separator(scpPanel)

   macro(200, "Itachi Lize", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel)
   UI.Separator(scpPanel)

macro(200, "Kakuzu", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel)
   UI.Separator(scpPanel)

macro(200, "Anbu", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel)
   UI.Separator(scpPanel)

macro(200, "Bee Stack", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel)
   UI.Separator(scpPanel)
   
   macro(200, "Bee No Stack", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel)  
   UI.Separator(scpPanel) 

   macro(200, "Kisame", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel)
   UI.Separator(scpPanel)

   macro(200, "Minato Stack", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel)
   UI.Separator(scpPanel)

   macro(200, "Minato No Stack", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel)
   UI.Separator(scpPanel)

   macro(200, "Tobirama", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel2)
   UI.Separator(scpPanel2)

   macro(200, "Tsunade Trap", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel2)
   UI.Separator(scpPanel2)

   macro(200, "Tsunade", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel2)
   UI.Separator(scpPanel2)

   macro(200, "Deidara", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel2)
   UI.Separator(scpPanel2)

   macro(200, "Orochimaru", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel2)
   UI.Separator(scpPanel2)

   macro(200, "Hashirama", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel2)
   UI.Separator(scpPanel2)

   macro(200, "Jiraiya", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel2)
   UI.Separator(scpPanel2)

   macro(200, "Raikage", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel2)
   UI.Separator(scpPanel2)

   macro(200, "Konan", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel2)
   UI.Separator(scpPanel2)

   macro(200, "Sasori", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel3)
   UI.Separator(scpPanel3)

   macro(200, "Guy", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel3)
   UI.Separator(scpPanel3)

   macro(200, "Hiruzen", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel3)
   UI.Separator(scpPanel3)

   macro(200, "Nagato", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel3)
   UI.Separator(scpPanel3)

   macro(200, "Onoki", function()
    if g_game.isAttacking() then
    say('JUTSU1')
    say('JUTSU2')
    say('JUTSU3')
    say('JUTSU4')
   end
   end, scpPanel3)
   UI.Separator(scpPanel3)


  ScriptWindow.closeButton.onClick = function(widget)
    ScriptWindow:hide()
  end  
ui.editScript.onClick = function(widget)
    ScriptWindow:show()
    ScriptWindow:raise()
    ScriptWindow:focus()
  end
   end
end
  

