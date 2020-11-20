# By: rx97
# 10 Oct 2020
# 
#> Creates Objs. Called from Lantern Load

#define storage rx:info
#define function rx.playerdb:api/get_self
#define function rx.playerdb:api/save_self

# objectives
scoreboard objectives add rx.ec.headDrop minecraft.dropped:minecraft.player_head
scoreboard objectives add rx.ec.openChest minecraft.custom:open_enderchest
scoreboard objectives add rx.ec.currPage dummy
scoreboard objectives add rx.ec.maxPage dummy
scoreboard objectives add rx.ec.link trigger

# link
scoreboard objectives add LinkEnderChest trigger

# fake players
scoreboard players set $64 rx.int 64

##> from phi.core
forceload remove -30000000 1600
forceload add -30000000 1600
execute unless block -30000000 0 1602 minecraft:yellow_shulker_box run setblock -30000000 0 1602 minecraft:yellow_shulker_box
execute unless block -30000000 0 1603 minecraft:oak_wall_sign run setblock -30000000 0 1603 minecraft:oak_wall_sign[facing=south]
fill -30000000 1 1600 -30000000 1 1615 minecraft:bedrock

# version
data modify storage rx:info ec.version set value {major: 1, minor: 5}

# schecdule tick
schedule function rx.ec:tick 1t replace
