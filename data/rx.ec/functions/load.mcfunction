# By: rx97

# 10 Oct 2020

# 

#> Check for dependancies before loading

#> Thanks to gm4 for help



#> temp obj

scoreboard objectives add rx.temp dummy



#> Get version

execute store result score $major rx.temp run data get storage rx:info playerdb.version.major

execute store result score $minor rx.temp run data get storage rx:info playerdb.version.minor

execute store result score $patch rx.temp run data get storage rx:info playerdb.version.patch



#> Info!

data modify storage rx:info ec.name set value 'EnderChest+'

data modify storage rx:info ec.pretty_name set value '[{"text":"E","color":"#661192"},{"text":"n","color":"#841aa7"},{"text":"d","color":"#a223bd"},{"text":"e","color":"#c12cd2"},{"text":"r","color":"#df35e8"},{"text":"C","color":"light_purple"},{"text":"h","color":"#e037ef"},{"text":"e","color":"#c32fe1"},{"text":"s","color":"#a627d2"},{"text":"t","color":"#891fc4"},{"text":"+","color":"#6c17b6"}]'



#> Load EnderChest only if PlayerDB is loaded + version

execute if score rx.PlayerDB load matches 1.. if data storage rx:info playerdb.version if score $major rx.temp matches 1 if score $minor rx.temp matches 2.. run scoreboard players set rx.EnderChest+ load 1



#> Success, let's load

execute if score rx.EnderChest+ load matches 1.. run function rx.ec:init

execute if score rx.EnderChest+ load matches 1.. run tellraw @a[tag=rx.admin] [{"text":"", "color":"gray"}, {"nbt": "ec.pretty_name", "storage": "rx:info", "interpret": true}, " ", {"storage": "rx:info", "nbt": "ec.version.major"}, ".", {"storage": "rx:info", "nbt": "ec.version.minor"}, ".", {"storage": "rx:info", "nbt": "ec.version.patch"}, " loaded"]



#> Oh no, something is wrong

execute unless score rx.EnderChest+ load matches 1.. run schedule clear rx.ec:tick



#> Error messages: a) missing PlayerDB completely b) wrong PlayerDB version

execute unless score rx.EnderChest+ load matches 1.. unless data storage rx:info playerdb.version run tellraw @a [{"nbt": "ec.pretty_name", "storage": "rx:info", "interpret": true, "clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/PlayerDB/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}},{"text":" Warning","color":"red"},{"text":": PlayerDB is not installed. ","color":"gray"},{"text":"Please grab the latest release by clicking this text. ","color":"gray"},{"text":"Install PlayerDB and run `/reload`.","color":"gray"}]

execute unless score rx.EnderChest+ load matches 1.. if data storage rx:info playerdb.version unless score $major rx.temp matches 1 unless score $minor rx.temp matches 2.. run tellraw @a [{"nbt": "ec.pretty_name", "storage": "rx:info", "interpret": true, "clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/PlayerDB/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}},{"text":" Warning","color":"red"},{"text":": The wrong version of PlayerDB is installed. ","color":"gray"},{"text":"EnderChest+ v1.8 requires PlayerDB v1.2.0+\nTroubleshooting:\n","color":"gray"},{"text":"  a) Check whether you have PlayerDB v1.2.0\n","color":"gray"},{"text":"  b) Check that only PlayerDB v1.2.0 is loaded (delete older versions)\n","color":"gray"},{"text":"  c) Check if there is a new version of EnderChest+\n","color":"gray", "clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/EnderChest+/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}}]
