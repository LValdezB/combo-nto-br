local windowUI = setupUI([[
MainWindow
  id: main
  !text: tr('Pesadelo Teleport by neoX')
  size: 230 310
  scrollable: true
    
  ScrollablePanel
    id: TpList
    anchors.top: parent.top
    anchors.left: parent.left
    size: 190 225
    vertical-scrollbar: mainScroll

    Button
      !text: tr('Konohagakure')
      anchors.top: parent.top
      anchors.left: parent.left
      width: 165

    Button
      !text: tr('Sunagakure')
      anchors.top: prev.bottom
      anchors.left: parent.left
      margin-top: 5
      width: 165

    Button
      !text: tr('Kaminari')
      anchors.top: prev.bottom
      anchors.left: parent.left
      margin-top: 5
      width: 165

    Button
      !text: tr('An no Kuni')
      anchors.top: prev.bottom
      anchors.left: parent.left
      margin-top: 5
      width: 165
    Button
      !text: tr('Amegakure')
      anchors.top: prev.bottom
      anchors.left: parent.left
      margin-top: 5
      width: 165

    Button
      !text: tr('Yunokawa')
      anchors.top: prev.bottom
      anchors.left: parent.left
      margin-top: 5
      width: 165

    Button
      !text: tr('volte')
      anchors.top: prev.bottom
      anchors.left: parent.left
      margin-top: 5
      width: 165

  VerticalScrollBar  
    id: mainScroll
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    step: 48
    pixels-scroll: true
    
  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 21
    margin-top: 15
    margin-right: 15

]], g_ui.getRootWidget());
windowUI:hide();

TpPesadelo = {};
TpPesadelo.macro = macro(100, "TP Pesadelo", function() end);
local TpList = windowUI.TpList;

TpPesadelo.close = function()
  windowUI:hide()
  NPC.say('bye');
end

TpPesadelo.show = function()
    windowUI:show();
    windowUI:raise();
    windowUI:focus();
end

windowUI.closeButton.onClick = function()
  TpPesadelo.close();
end

TpPesadelo.tpToCity = function(city)
  NPC.say('pesadelo infinito');
  schedule(600, function()
    NPC.say(city);
    TpPesadelo.close()
  end)
end


for i, child in pairs(TpList:getChildren()) do
    child.onClick = function()
      TpPesadelo.tpToCity(child:getText())
    end
end

onTalk(function(name, level, mode, text, channelId, pos)
  if (TpPesadelo.macro.isOff()) then return; end
  if (name ~= 'Tsukuyomi no mi Madara') then return; end         
  if (mode ~= 51) then return; end
  if (text:find('refletir na lua')) then
    print(text)
    TpPesadelo.show();
  else
      TpPesadelo.close();
  end
end);

onKeyDown(function(keys)
    if (keys == 'Escape' and windowUI:isVisible())  then
      TpPesadelo.close();
    end
end);