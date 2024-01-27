ClosestJumpKamui = {};
ClosestJumpKamui.tile = nil;
ClosestJumpKamui.info = nil;
ClosestJumpKamui.flags = { ignoreNonPathable = true, precision = 0, ignoreCreatures = false }
ClosestJumpKamui.walkTime = now;
ClosestJumpKamui.isWalking = false;
ClosestJumpKamui.MAX_TILE_RANGE = 12;

local keyToPress = "Space";
local core = modules.corelib;
local currentPos = nil;

ClosestJumpKamui.canWalk = function(ms)
    if (ClosestJumpKamui.walkTime >= now) then return false; end
    ClosestJumpKamui.walkTime = now + ms;
    return true;
end

ClosestJumpKamui.distanceFromPlayer = function(position)
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

local movementKeys = { 'W', 'S', 'A', 'D', 'Up', 'Down', 'Left', 'Right' };
ClosestJumpKamui.macro = macro(100, 'Jump Kamui', function()
    if (ClosestJumpKamui.isWalking) then
        for _, value in ipairs(movementKeys) do
            if (modules.corelib.g_keyboard.isKeyPressed(value)) then
                ClosestJumpKamui.isWalking = false;
                return;
            end
        end
    end
    
    if (not modules.corelib.g_keyboard.areKeysPressed(keyToPress)) then return end
    local tile = ClosestJumpKamui.tile;
    if (tile == nil) then
        return modules.game_textmessage.displayGameMessage('Nenhum jump por perto.');
    end

    ClosestJumpKamui.isWalking = true;
    ClosestJumpKamui.walkingTile = tile;
end);

ClosestJumpKamui.walkMacro = macro(100, function()
    if (ClosestJumpKamui.macro.isOff()) then return; end
    if (not ClosestJumpKamui.isWalking) then return; end

    local playerPos = pos();
    local walkingTilePos = ClosestJumpKamui.walkingTile:getPosition();
    if (playerPos.z ~= walkingTilePos.z) then
        ClosestJumpKamui.isWalking = false;
    end
    if (distanceFromPlayer(walkingTilePos) == 0 and ClosestJumpKamui.info) then
        g_game.turn(ClosestJumpKamui.info.dir);
        say(ClosestJumpKamui.info.spell);
        return;
    end
    
    if (distanceFromPlayer(walkingTilePos) == 1) then
        if (ClosestJumpKamui.walkTime < now) then
            local nextFloor = g_map.getTile(walkingTilePos); -- workaround para caso o TILE descarregue, conseguir pegar os atributos ainda assim.
            CaveBot.walkTo(nextFloor:getPosition(), 1, { precision = 0 });
            ClosestJumpKamui.walkTime = now + 500;
        end
    end
    
    local path = findPath(playerPos, walkingTilePos, 150, ClosestJumpKamui.flags);
    if (not path) then 
        ClosestJumpKamui.isWalking = false;
        return; 
    end
    local tileToUse = playerPos;
    for i, value in ipairs(path) do
        if (i > 6) then break; end
        tileToUse = getDirection(tileToUse, value);
    end
    tileToUse = g_map.getTile(tileToUse);
    use(tileToUse:getTopUseThing());
end);

ClosestJumpKamui.checkJump = function(tilePos)
    
    local tileAbove = g_map.getTile({ x = tilePos.x, y = tilePos.y, z = tilePos.z - 1});
    if (not tileAbove) then
        local tileAboveWest = g_map.getTile({ x = tilePos.x - 1, y = tilePos.y, z = tilePos.z - 1 });
        local tileNorth = g_map.getTile({ x = tilePos.x, y = tilePos.y - 1, z = tilePos.z - 1 });
        if (tileAboveWest) then
            return { dir = 3, spell = 'Jump Up' };
        end

        if (tileNorth) then
            return { dir = 0, spell = 'Jump Up' };
        end
    end
    
    local tileEast = g_map.getTile({ x = tilePos.x + 1, y = tilePos.y, z = tilePos.z });
    if (not tileEast) then
        local tileBelowEast = g_map.getTile({ x = tilePos.x + 1, y = tilePos.y, z = tilePos.z + 1});
        if (tileBelowEast) then
            return { dir = 1, spell = 'Jump Down' };
        end
    end

    local tileSouth = g_map.getTile({ x = tilePos.x, y = tilePos.y + 1, z = tilePos.z });
    if (not tileSouth) then
        local tileBelowSouth = g_map.getTile({ x = tilePos.x, y = tilePos.y + 1, z = tilePos.z + 1});
        if (tileBelowSouth) then
            return { dir = 2, spell = 'Jump Down' };
        end
    end
    return nil;
end

ClosestJumpKamui.tileFinderMacro = macro(100, function()
    if (ClosestJumpKamui.macro.isOff()) then return; end
    currentPos = pos();

    if (currentPos.z ~= 12 and currentPos.z ~= 13) then return; end

    local closestTile = nil;
    local tileJumpInfo = nil;
    local pos1 = { x = currentPos.x - ClosestJumpKamui.MAX_TILE_RANGE, y = currentPos.y - ClosestJumpKamui.MAX_TILE_RANGE };
    local pos2 = { x = currentPos.x + ClosestJumpKamui.MAX_TILE_RANGE, y = currentPos.y + ClosestJumpKamui.MAX_TILE_RANGE };
    
    local result = ClosestJumpKamui.checkJump(currentPos);

    if (result) then
        closestTile = player:getTile();
        tileJumpInfo = result;
    else
        for x = pos1.x, pos2.x do
            for y = pos1.y, pos2.y do
                local tilePos = { x = x, y = y, z = currentPos.z }
                local tile = g_map.getTile(tilePos);
    
                if (tile and tile:isWalkable()) then
                    local jumpInfo = ClosestJumpKamui.checkJump(tilePos);
    
                    if (jumpInfo) then
    
                        local tileDistance = ClosestJumpKamui.distanceFromPlayer(tilePos);

                        if (not closestTile or (tileDistance < ClosestJumpKamui.distanceFromPlayer(closestTile:getPosition()))) then
                            closestTile = tile;
                            tileJumpInfo = jumpInfo;
                        end
                    end
                end
            end
        end
    end

    if (ClosestJumpKamui.tile) then
        ClosestJumpKamui.tile:setText(""); -- Remove the text if has a tile on the variable before the verification
    end

    ClosestJumpKamui.tile = closestTile; -- Sets the new closest tile to our global variable
    ClosestJumpKamui.info = tileJumpInfo;

    if (not ClosestJumpKamui.tile) then return end; -- if not found any tile, then just cancel it
    
    ClosestJumpKamui.tile:setText(ClosestJumpKamui.info.spell); -- Sets a text to the closest tile, indicating it with the key to press to dash
end);