# By: rx97
# 11 Nov 20
# 
#> @s: player
#> On name change, let's our scores and notify the player :)

# #!tag #rx.playerdb:api/on_name_change

function rx.playerdb:api/get_self

#> store scores
execute store result score @s rx.ec.maxPage run data get storage rx:io playerdb.player.data.rx.ec.scores.maxPage
execute store result score @s rx.ec.openChest run data get storage rx:io playerdb.player.data.rx.ec.scores.openChest

#> notify player, data is safe :)
tellraw @s [{"text":"", "color":"gray"}, {"nbt": "ec.pretty_name", "storage": "rx:info", "interpret": true}, ": We've detected a name change and have migrated your data!"]
