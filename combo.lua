UI.Separator()
local scriptsPanelName = "Scripts"
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
]])
ui:setId(scriptsPanelName)

local scriptsWindow = setupUI([[
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

if not storage[scriptsPanelName] then
    storage[scriptsPanelName] = {}
end

local rootWidget = g_ui.getRootWidget()
if rootWidget then
    scriptsWindow:hide()
    local tabBar = scriptsWindow.tmpTabBar
    tabBar:setContentWidget(scriptsWindow.tmpTabContent)

    for v = 1, 1 do
        local scpPanel = g_ui.createWidget("sPanel") -- Creates Panel
        scpPanel:setId("panelButtons") -- sets ID
        tabBar:addTab("Vip 1", scpPanel)
        local scpPanel2 = g_ui.createWidget("sPanel") -- Creates Panel
        scpPanel2:setId("panelButtons") -- sets ID
        tabBar:addTab("Vip 2", scpPanel)
        local scpPanel3 = g_ui.createWidget("sPanel") -- Creates Panel
        scpPanel3:setId("panelButtons") -- sets ID
        tabBar:addTab("Vip 3", scpPanel3)

        macro(200, "Itachi Drunk", function()
            if g_game.isAttacking() then
                say('JUTSU1')
                say('JUTSU2')
                say('JUTSU3')
                say('JUTSU4')
            end
        end, scpPanel)
        UI.Separator(scpPanel)

        -- Add other macros and separators as needed
    end

    scriptsWindow.closeButton.onClick = function(widget)
        scriptsWindow:hide()
    end

    ui.editScript.onClick = function(widget)
        scriptsWindow:show()
        scriptsWindow:raise()
        scriptsWindow:focus()
    end
end