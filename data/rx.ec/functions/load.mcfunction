# By: rx97
# 10 Oct 2020
# 
#> Check for dependancies before loading
#> Thanks to gm4 for help

execute if score PlayerDB load matches 1.. run scoreboard players set EnderChest+ load 1

execute if score EnderChest+ load matches 1.. run tellraw @a[tag=rx.admin] [{"text":"E","color":"#661192"},{"text":"n","color":"#841aa7"},{"text":"d","color":"#a223bd"},{"text":"e","color":"#c12cd2"},{"text":"r","color":"#df35e8"},{"text":"C","color":"light_purple"},{"text":"h","color":"#e037ef"},{"text":"e","color":"#c32fe1"},{"text":"s","color":"#a627d2"},{"text":"t","color":"#891fc4"},{"text":"+","color":"#6c17b6"},{"text":" Loaded"}]
execute if score EnderChest+ load matches 1.. run function rx.ec:init
execute unless score EnderChest+ load matches 1.. run schedule clear rx.ec:tick
execute unless score EnderChest+ load matches 1.. run tellraw @a [{"text":"E","color":"#661192","clickEvent":{"action":"open_url","value":"https://github.com/RitikShah/MC-PlayerDB/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}},{"text":"n","color":"#841aa7"},{"text":"d","color":"#a223bd"},{"text":"e","color":"#c12cd2"},{"text":"r","color":"#df35e8"},{"text":"C","color":"light_purple"},{"text":"h","color":"#e037ef"},{"text":"e","color":"#c32fe1"},{"text":"s","color":"#a627d2"},{"text":"t","color":"#891fc4"},{"text":"+","color":"#6c17b6"},{"text":" Warning","color":"red"},{"text":": PlayerDB is not installed. ","color":"gray"},{"text":"Please grab the latest release by clicking this text. ","color":"gray"},{"text":"Install PlayerDB and run `/reload`.","color":"gray"}]
