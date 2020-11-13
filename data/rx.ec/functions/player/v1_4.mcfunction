# By: rx97
# 12 Nov 20
# 
#> @s: player
#> migrate from v1.3 to v1.4

execute if score @s rx.ec.openChest matches 1.. run function rx.playerdb:api/get_self
execute if score @s rx.ec.openChest matches 1.. run data modify storage rx:io playerdb.player.data.rx.ec.scores.openChest set value 2
execute if score @s rx.ec.openChest matches 1.. store result storage rx:io playerdb.player.data.rx.ec.scores.maxPage int 1 run scoreboard players get @s rx.ec.maxPage
execute if score @s rx.ec.openChest matches 1.. run function rx.playerdb:api/save_self

tellraw @s[tag=rx.admin] [{"text":"", "color":"gray"},{"nbt": "ec.pretty_name", "storage": "rx:info", "interpret": true}, ": Migrated from v1.3 to v1.4"]
