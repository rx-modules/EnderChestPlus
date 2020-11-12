# By: rx97
# 12 Nov 20
# 
#> @s: player
#> migrate from v1.3 to v1.4

execute if score @s rx.ec.openChest matches 1.. run function rx.playerdb:api/get_self
execute if score @s rx.ec.openChest matches 1.. run data modify storage rx:io playerdb.player.data.rx.ec.scores.openChest set value 2
execute if score @s rx.ec.openChest matches 1.. store result storage rx:io playerdb.player.data.rx.ec.scores.maxPage int 1 run scoreboard players get @s rx.ec.maxPage
execute if score @s rx.ec.openChest matches 1.. run function rx.playerdb:api/save_self

tellraw @s[tag=rx.admin] [{"text":"", "color":"gray"},{"text":"E","color":"#661192"},{"text":"n","color":"#841aa7"},{"text":"d","color":"#a223bd"},{"text":"e","color":"#c12cd2"},{"text":"r","color":"#df35e8"},{"text":"C","color":"light_purple"},{"text":"h","color":"#e037ef"},{"text":"e","color":"#c32fe1"},{"text":"s","color":"#a627d2"},{"text":"t","color":"#891fc4"},{"text":"+","color":"#6c17b6"}, ": Migrated from v1.3 to v1.4"]
