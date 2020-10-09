# By: rx97
# 4 Oct 2020
# 
#> Removes Objs.

scoreboard players reset rx.ec load

scoreboard objectives remove rx.ec.headDrop
scoreboard objectives remove rx.ec.openChest
scoreboard objectives remove rx.ec.currPage
scoreboard objectives remove rx.ec.maxPage

data remove storage rx:global playerdb.players[].data.rx.ec

tellraw @a {"text":"EnderChest+ Uninstalled"}

# ##> from phi.core
# forceload remove -30000000 1600
# forceload add -30000000 1600
# execute unless block -30000000 0 1602 minecraft:yellow_shulker_box run setblock -30000000 0 1602 minecraft:yellow_shulker_box
# execute unless block -30000000 0 1603 minecraft:oak_wall_sign run setblock -30000000 0 1603 minecraft:oak_wall_sign[facing=south]
# fill -30000000 1 1600 -30000000 1 1615 minecraft:bedrock
