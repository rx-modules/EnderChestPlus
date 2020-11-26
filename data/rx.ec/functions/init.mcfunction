# By: rx97
# 10 Oct 2020
# 
#> Creates Objs. Called from Lantern Load

# objectives
scoreboard objectives add rx.ec.headDrop minecraft.dropped:minecraft.player_head
scoreboard objectives add rx.ec.openChest minecraft.custom:open_enderchest
scoreboard objectives add rx.ec.currPage dummy
scoreboard objectives add rx.ec.maxPage dummy

# fake players
scoreboard players set $64 rx.int 64

##> from phi.core
forceload remove -30000000 1600
forceload add -30000000 1600
execute unless block -30000000 0 1602 minecraft:yellow_shulker_box run setblock -30000000 0 1602 minecraft:yellow_shulker_box
execute unless block -30000000 0 1603 minecraft:oak_wall_sign run setblock -30000000 0 1603 minecraft:oak_wall_sign[facing=south]
fill -30000000 1 1600 -30000000 1 1615 minecraft:bedrock

# version
data modify storage rx:info ec.version.major set value 1
data modify storage rx:info ec.version.minor set value 5

# schecdule tick
schedule function rx.ec:tick 1t replace
