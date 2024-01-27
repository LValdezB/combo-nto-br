-- config
setDefaultTab("HP")

----regen-----------------------------------------------------------------

local hpPercent = 100;
macro(50, "Regen", function()
    if (hppercent() >= hpPercent) then return; end
    if (storage.regenerationSpell:len() < 1) then return; end
    say(storage.regenerationSpell);
end)


addTextEdit("Regen", storage.regenerationSpell or "Big Regeneration", function(widget, text)
    storage.regenerationSpell = text
end)

-----heal tsu-----------------------------------------------------------------------

ComboHeal = {
  spells = {
      { 'Big Regeneration', 99 },
      { 'Mystical Palm Technique "'.. player:getName() .. '"', 70 },
      { 'Sousou Saisei no jutsu', 45 }
  }
}

ComboHeal.icon = addIcon("Combo Heal", {item=10607, text="Combo Heal"}, macro(200, function()
  local currentHp = hppercent();
  
  for i, obj in ipairs(ComboHeal.spells) do
      if (currentHp <= obj[2]) then
          say(obj[1]);
      end
  end
end));

------pill------------------------------------------------------------------------------

local AutoPill = {
  id = 3028,
  hpPercent = 40, -- Porcentagem pra usar PILL na vida
  manaPercent = 20, -- Porcentagem pra usar PILL NA MANA -> Coloque nil se não quiser pill na mana
  cooldown = 3000,
  lastUse = 0,
};

AutoPill.checkPills = function(msgPills)
  local currentPills = itemAmount(AutoPill.id);
  if (currentPills < msgPills) then
      AutoPill.lastUse = now + AutoPill.cooldown;
  end
end

addIcon("AutoPill", {item=10607, text="AutoPill"}, macro(1, "AutoPill", function()
  if (AutoPill.lastUse < now or itemAmount(AutoPill.id) < 1) then 
      if (hppercent() < AutoPill.hpPercent or (AutoPill.manaPercent ~= nil and manapercent() < AutoPill.manaPercent)) then
          use(AutoPill.id);
      end 
  end
end));

onTextMessage(function(mode, text)
  if (string.find(text, 'Soldado Pills') == nil) then return; end

  local pill = tonumber(text:split(' ')[4]);
  schedule(100, function()
      if (pill) then
          AutoPill.checkPills(pill);
      end
  end);
end);

----heal friends--------------------------------------------------------------------

addIcon("Heal Friends", {item=10607, text="Heal Friends"}, macro(100, 'Heal Friends', function()
  local lowestFriend = nil;
  for _, creature in pairs(getSpectators()) do
      if (creature:isPlayer() and (creature:getEmblem() == 1 or creature:getShield() >= 3) and creature:getHealthPercent() < 70) then
          if (lowestFriend == nil or creature:getHealthPercent() < lowestFriend:getHealthPercent()) then
              lowestFriend = creature;
          end
      end
  end

  if (lowestFriend == nil) then return; end
  say('Mystical Palm Technique "'.. lowestFriend:getName() ..'"');
end));

----------shousen-----------------------------------------------------------------------------

AutoShousen = {
  spell = 'shousen jutsu',
  hppercent = 70,
  cooldown = 40 * 1000,
  time = 0,
}
macro(100, 'Shousen Jutsu', function()
  if (AutoShousen.time >= now or hppercent() > AutoShousen.hppercent) then return; end
  say(AutoShousen.spell);
end);

onTalk(function(name, level, mode, text, channelId, pos)
  if (name ~= player:getName() or mode ~= 44) then return; end

  text = text:lower();
  if (text ~= AutoShousen.spell) then return; end
  
  AutoShousen.time = now + AutoShousen.cooldown;
end);