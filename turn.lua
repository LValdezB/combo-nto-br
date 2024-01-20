



addIcon("NORTH",
{item = {id = 563, count = 2},
text="N",
switchable = false},
function(icon, isOn)
g_game.turn(0)
end)

addIcon("EAST",
{item = {id = 563, count = 2},
text="E",
switchable = false},
function(icon, isOn)
g_game.turn(1)
end)

addIcon("SOUTH",
{item = {id = 563, count = 2},
text="S",
switchable = false},
function(icon, isOn)
g_game.turn(2)
end)

addIcon("WEST",
{item = {id = 563, count = 2},
text="W",
switchable = false},
function(icon, isOn)
g_game.turn(3)
end)