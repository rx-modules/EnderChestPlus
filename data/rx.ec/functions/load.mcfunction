# By: rx97
# 10 Oct 2020
# 
#> Check for dependancies before loading
#> Thanks to gm4 for help

#> Info!
data modify storage rx:info ec.name set value 'EnderChest+'
data modify storage rx:info ec.pretty_name set value '[{"text":"E","color":"#661192"},{"text":"n","color":"#841aa7"},{"text":"d","color":"#a223bd"},{"text":"e","color":"#c12cd2"},{"text":"r","color":"#df35e8"},{"text":"C","color":"light_purple"},{"text":"h","color":"#e037ef"},{"text":"e","color":"#c32fe1"},{"text":"s","color":"#a627d2"},{"text":"t","color":"#891fc4"},{"text":"+","color":"#6c17b6"}]'

#> Load EnderChest only if PlayerDB is loaded + version
execute if score rx.PlayerDB load matches 1.. if data storage rx:info playerdb.version{major:0, minor:8} run scoreboard players set rx.EnderChest+ load 1

#> Success, let's load
execute if score rx.EnderChest+ load matches 1.. run tellraw @a[tag=rx.admin] [{"nbt": "ec.pretty_name", "storage": "rx:info", "interpret": true}, " ", {"text": "L", "color": "#661192"}, {"text": "o", "color": "#a223bd"}, {"text": "a", "color": "#c12cd2"}, {"text": "d", "color": "#c32fe1"}, {"text": "e", "color": "#a627d2"}, {"text": "d", "color": "#6c17b6"}]
execute if score rx.EnderChest+ load matches 1.. run function rx.ec:init

#> Oh no, something is wrong
execute unless score rx.EnderChest+ load matches 1.. run schedule clear rx.ec:tick

#> Error messages: a) missing PlayerDB completely b) wrong PlayerDB version
execute unless score rx.EnderChest+ load matches 1.. unless data storage rx:info playerdb.version run tellraw @a [{"nbt": "ec.pretty_name", "storage": "rx:info", "interpret": true, "clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/PlayerDB/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}},{"text":" Warning","color":"red"},{"text":": PlayerDB is not installed. ","color":"gray"},{"text":"Please grab the latest release by clicking this text. ","color":"gray"},{"text":"Install PlayerDB and run `/reload`.","color":"gray"}]
execute unless score rx.EnderChest+ load matches 1.. if data storage rx:info playerdb.version unless data storage rx:info playerdb.version{major:0, minor:8} run tellraw @a [{"nbt": "ec.pretty_name", "storage": "rx:info", "interpret": true, "clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/PlayerDB/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}},{"text":" Warning","color":"red"},{"text":": The wrong version of PlayerDB is installed. ","color":"gray"},{"text":"EnderChest+ v1.5 requires PlayerDB v0.8-beta.\nTroubleshooting:\n","color":"gray"},{"text":"  a) Check whether you have PlayerDB v0.8\n","color":"gray"},{"text":"  b) Check that only PlayerDB v0.8 is loaded (delete older versions)\n","color":"gray"},{"text":"  c) Check if there is a new version of EnderChest+\n","color":"gray", "clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/EnderChest+/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}}]
