# By: rx97
# 4 Oct 2020
# 
#> Removes Objs.

scoreboard players reset rx.ec load.status

scoreboard objectives remove rx.ec.headDrop
scoreboard objectives remove rx.ec.openChest
scoreboard objectives remove rx.ec.currPage
scoreboard objectives remove rx.ec.maxPage

tellraw @a [{"text":"", "color":"gray"}, {"nbt": "ec.pretty_name", "storage": "rx:info", "interpret": true}, {"text":" Uninstalled"}]
