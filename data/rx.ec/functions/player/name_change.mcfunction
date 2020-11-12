# By: rx97
# 11 Nov 20
# 
#> @s: player
#> On name change, let's our scores and notify the player :)

function rx.playerdb:api/get_self

#> store scores
execute store result score @s rx.ec.maxPage run data get storage rx:io playerdb.player.data.rx.ec.scores.maxPage
execute store result score @s rx.ec.openChest run data get storage rx:io playerdb.player.data.rx.ec.scores.openChest

#> notify player, data is safe :)
tellraw @a[tag=rx.admin] [{"text":"", "color":"gray"},{"text":"E","color":"#661192"},{"text":"n","color":"#841aa7"},{"text":"d","color":"#a223bd"},{"text":"e","color":"#c12cd2"},{"text":"r","color":"#df35e8"},{"text":"C","color":"light_purple"},{"text":"h","color":"#e037ef"},{"text":"e","color":"#c32fe1"},{"text":"s","color":"#a627d2"},{"text":"t","color":"#891fc4"},{"text":"+","color":"#6c17b6"}, ": We've detected a name change and have migrated your data!"]
