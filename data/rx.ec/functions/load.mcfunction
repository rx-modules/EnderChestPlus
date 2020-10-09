# By: rx97
# 4 Oct 2020
# 
#> Creates Objs. Called from Lantern Load

# load
scoreboard objectives add rx.mods dummy
scoreboard players set EnderChest+ rx.mods 1

# objectives
scoreboard objectives add rx.ec.headDrop minecraft.dropped:minecraft.player_head
scoreboard objectives add rx.ec.openChest minecraft.custom:open_enderchest
scoreboard objectives add rx.ec.currPage dummy
scoreboard objectives add rx.ec.maxPage dummy

# fake players
scoreboard players set $64 rx.int 64

# PlayerDB checking
execute if score PlayerDB rx.mods matches 1.. run tellraw @a[tag=rx.admin] {"text":"EnderChest+ Loaded"}
execute unless score PlayerDB rx.mods matches 1.. run tellraw @a [{"text":"Warning","color":"red","clickEvent":{"action":"open_url","value":"https://github.com/RitikShah/MC-PlayerDB/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}},{"text":": PlayerDB is not installed","color":"gray"},{"text":"Please grab the latest release by clicking this text.\n","color":"gray"},{"text":"This datapack will now attempt to disable itself. You can reenable via /datapack enable \"file/EnderChest+\"","color":"gray"}]
execute unless score PlayerDB rx.mods matches 1.. run datapack disable "file/EnderChest+"

##> from phi.core
forceload remove -30000000 1600
forceload add -30000000 1600
execute unless block -30000000 0 1602 minecraft:yellow_shulker_box run setblock -30000000 0 1602 minecraft:yellow_shulker_box
execute unless block -30000000 0 1603 minecraft:oak_wall_sign run setblock -30000000 0 1603 minecraft:oak_wall_sign[facing=south]
fill -30000000 1 1600 -30000000 1 1615 minecraft:bedrock
