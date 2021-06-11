# By: rx97

# 4 Oct 2020

# 

#> @s: player, fix enderchest icons



execute unless data storage rx:io playerdb.player run function rx.playerdb:api/get_self

data modify block -30000000 0 1602 Items set from entity @s EnderItems

function rx.ec:gui/icons

loot replace entity @s enderchest.0 mine -30000000 0 1602 air{drop_contents:1b}



scoreboard players set @s rx.ec.headDrop 0
