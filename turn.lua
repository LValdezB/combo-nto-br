turnN = addIcon("NORTH",
{item = {id = 563, count = 1},
text="N",
switchable = false},
function(icon, isOn)
g_game.turn(0)
end)
turnN:breakAnchors()
turnN:move(725, 250)

turnE = addIcon("EAST",
{item = {id = 563, count = 1},
text="E",
switchable = false},
function(icon, isOn)
g_game.turn(1)
end)
turnE:breakAnchors()
turnE:move(775, 250)

turnS = addIcon("SOUTH",
{item = {id = 563, count = 1},
text="S",
switchable = false},
function(icon, isOn)
g_game.turn(2)
end)
turnS:breakAnchors()
turnS:move(825, 250)

turnW = addIcon("WEST",
{item = {id = 563, count = 1},
text="W",
switchable = false},
function(icon, isOn)
g_game.turn(3)
end)
turnW:breakAnchors()
turnW:move(775, 250)
