setDefaultTab("Avail")
ClosestStair = {};
ClosestStair.tile = nil;
ClosestStair.aditionalTiles = { 
    1948, 1648, 1067, 595, 5293, 5542,  1648, 1678, 13296, 1646, 5111, 7771, 8657, 
    1680, 6264, 1664, 6262, 5291, 6905, 8265, 8263, 7727, 7725, 6896, 6207, 
    8367, 8365, 5102, 1632, 1633, 6262, 1633, 1622, 1949, 7804, 6205, 8367, 5129, 7047, 7038, 1968, 435, 967, 7477, 14412, 5022
};
ClosestStair.ignoredTiles = {  }
ClosestStair.flags = { ignoreNonPathable = true, precision = 0, ignoreCreatures = false }
ClosestStair.walkTime = now;
ClosestStair.isWalking = false;
ClosestStair.MAX_TILE_RANGE = 6;

local keyToPress = "Space";
local core = modules.corelib;
local currentPos = nil;

ClosestStair.canWalk = function(ms)
    if (ClosestStair.walkTime >= now) then return false; end
    ClosestStair.walkTime = now + ms;
    return true;
end

ClosestStair.distanceFromPlayer = function(position)
    local distx = math.abs(posx() - position.x);
    local disty = math.abs(posy() - position.y);

    return math.sqrt(distx * distx + disty * disty);
end

local function getDirection(playerPos, direction)
    if (direction == 0) then playerPos.y = playerPos.y - 1;
    elseif (direction == 1) then playerPos.x = playerPos.x + 1;
    elseif (direction == 2) then playerPos.y = playerPos.y + 1;
    elseif (direction == 3) then playerPos.x = playerPos.x - 1;
    end
    return playerPos;
end

local function checkItemOnTile(tile, table)


    for _, item in ipairs(tile:getItems()) do
        local itemId = item:getId();

        for _, itemSelected in ipairs(table) do
            if (itemId == itemSelected) then
                return true;
            end
        end
    end
    return false;
end

local function walkToStair(tilePos)
    local playerPos = pos();
    if (playerPos.z ~= tilePos.z) then return end;
    if (playerPos.x == tilePos.x) then
        if (playerPos.y < tilePos.y) then
            g_game.walk(2, false);
        else
            g_game.walk(0, false);
        end
        return;
    end

    if (playerPos.y == tilePos.y) then
        if (playerPos.x < tilePos.x) then
            g_game.walk(1, false);
        else
            g_game.walk(3, false);
        end
        return
    end

    if (playerPos.y < tilePos.y) then
        if (playerPos.x < tilePos.x) then
            g_game.walk(5, false);
        else 
            g_game.walk(6, false);
        end
        return;
    end

    if (playerPos.y > tilePos.y) then
        if (playerPos.x < tilePos.x) then
            g_game.walk(4, false);
        else 
            g_game.walk(7, false);
        end
        return;
    end
end

local Directions = {
    North = 0,
    East = 1,
    South = 2,
    West = 3,
    NorthEast = 4,
    SouthEast = 5,
    SouthWest = 6,
    NorthWest = 7
}

local movementKeys = { 'W', 'S', 'A', 'D', 'Up', 'Down', 'Left', 'Right' };
ClosestStair.macro = macro(100, 'Escada', function()
    if (ClosestStair.isWalking) then
        for _, value in ipairs(movementKeys) do
            if (modules.corelib.g_keyboard.isKeyPressed(value)) then
                ClosestStair.isWalking = false;
                return;
            end
        end
    end
    
    if (not modules.corelib.g_keyboard.areKeysPressed(keyToPress)) then return end
    local tile = ClosestStair.tile;

    if (tile == nil) then
        return modules.game_textmessage.displayGameMessage('Nenhuma escada/buraco.');
    end

    ClosestStair.isWalking = true;
    ClosestStair.walkingTile = tile;
end);

ClosestStair.walkMacro = macro(100, function()
    if (ClosestStair.macro.isOff()) then return; end
    if (not ClosestStair.isWalking) then return; end

    local playerPos = pos();
    local walkingTilePos = ClosestStair.walkingTile:getPosition();
    local path = findPath(playerPos, walkingTilePos, 150, ClosestStair.flags);
    if (distanceFromPlayer(walkingTilePos) < 2) then
        local nextFloor = g_map.getTile(walkingTilePos); -- workaround para caso o TILE descarregue, conseguir pegar os atributos ainda assim.
        if (ClosestStair.walkTime < now) then
            if (nextFloor:isPathable()) then
                use(nextFloor:getTopUseThing());
                ClosestStair.walkTime = now + 250;
            else
                walkToStair(walkingTilePos)
                ClosestStair.walkTime = now + 500;
            end
        end
        ClosestStair.isWalking = false;
        return 
    end
    if (path == nil or #path <= 1) then
        if (path == nil) then
            use(ClosestStair.walkingTile:getTopUseThing());
            ClosestStair.isWalking = false;
        end
        return
    end
    
    local tileToUse = playerPos;
    for i, value in ipairs(path) do
        if (i > 9) then break; end
        tileToUse = getDirection(tileToUse, value);
    end
    tileToUse = g_map.getTile(tileToUse);
    use(tileToUse:getTopUseThing());
end);

ClosestStair.tileFinderMacro = macro(100, function()
    if (ClosestStair.macro.isOff()) then return; end
    if (currentPos and table.compare(currentPos, pos())) then
        return;
    end
    if (currentPos == nil or not table.compare(currentPos, pos())) then
        currentPos = pos();
    end

    local closestTile = nil;
    local pos1 = { x = currentPos.x - ClosestStair.MAX_TILE_RANGE, y = currentPos.y - ClosestStair.MAX_TILE_RANGE };
    local pos2 = { x = currentPos.x + ClosestStair.MAX_TILE_RANGE, y = currentPos.y + ClosestStair.MAX_TILE_RANGE };
    for x = pos1.x, pos2.x do
		for y = pos1.y, pos2.y do
            local tile = g_map.getTile({ x = x, y = y, z = currentPos.z });
            if (tile) then
                local tilePosition = tile:getPosition();
                local tileDistance = ClosestStair.distanceFromPlayer(tilePosition);
                local minimapColor = g_map.getMinimapColor(tilePosition);
                local StairColor = minimapColor == 210;
                local closestTileDistance;
                local closestTilePos;
                if (closestTile ~= nil) then
                    closestTilePos = closestTile:getPosition();
                    closestTileDistance = ClosestStair.distanceFromPlayer(closestTilePos);
                end
                if (StairColor and not tile:isPathable()) then
                    local hasIgnoredTiles = checkItemOnTile(tile, ClosestStair.ignoredTiles);
                    
                    if (
                        not hasIgnoredTiles and
                        (closestTile == nil or 
                        tileDistance < closestTileDistance)
                    )  then
                        if (ClosestStair.tile and tilePosition.z ~= ClosestStair.tile:getPosition().z) then
                            ClosestStair.walkTime = now - 200;
                        end
                        closestTile = tile;
                    end
                else
                    if (checkItemOnTile(tile, ClosestStair.aditionalTiles) and                             
                        (closestTile == nil or 
                        tileDistance < closestTileDistance)
                    ) then
                        if (ClosestStair.tile and tilePosition.z ~= ClosestStair.tile:getPosition().z) then
                            ClosestStair.walkTime = now - 200;
                        end
                        closestTile = tile;
                    end
                end
            end
        end
    end

    if (ClosestStair.tile) then
        ClosestStair.tile:setText("");
    end
    ClosestStair.tile = closestTile;

    if (ClosestStair.tile) then
        ClosestStair.tile:setText("Press " .. keyToPress);
    end

    if (not ClosestStair.tile) then return end;
end);

ClosestStair.icon = addIcon("Portas", {item=10610, text="Portas"}, function(icon, isOn)
    ClosestStair.macro.setOn(isOn);
  end);
