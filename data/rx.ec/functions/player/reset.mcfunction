# By: rx97

# 5 Oct 2020

# 

#> resets enderchest



function rx.playerdb:api/get_self

data remove storage rx:io playerdb.player.data.rx.ec

function rx.playerdb:api/save_self



scoreboard players reset @s rx.ec.currPage

scoreboard players reset @s rx.ec.maxPage

scoreboard players reset @s rx.ec.openChest

scoreboard players reset @s rx.ec.headDrop
