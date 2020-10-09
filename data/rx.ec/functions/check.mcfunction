# By: rx97
# 7 Oct 2020
# 
#> Checks for PlayerDB

# tellraws
execute if score PlayerDB rx.mods matches 1.. if entity @a run tellraw @a[tag=rx.admin] [{"text":"E","color":"#661192"},{"text":"n","color":"#841aa7"},{"text":"d","color":"#a223bd"},{"text":"e","color":"#c12cd2"},{"text":"r","color":"#df35e8"},{"text":"C","color":"light_purple"},{"text":"h","color":"#e037ef"},{"text":"e","color":"#c32fe1"},{"text":"s","color":"#a627d2"},{"text":"t","color":"#891fc4"},{"text":"+","color":"#6c17b6"},{"text":" Loaded"}]
execute unless score PlayerDB rx.mods matches 1.. if entity @a run tellraw @a [{"text":"E","color":"#661192","clickEvent":{"action":"open_url","value":"https://github.com/RitikShah/MC-PlayerDB/releases"},"hoverEvent":{"action":"show_text","value":"Click!"}},{"text":"n","color":"#841aa7"},{"text":"d","color":"#a223bd"},{"text":"e","color":"#c12cd2"},{"text":"r","color":"#df35e8"},{"text":"C","color":"light_purple"},{"text":"h","color":"#e037ef"},{"text":"e","color":"#c32fe1"},{"text":"s","color":"#a627d2"},{"text":"t","color":"#891fc4"},{"text":"+","color":"#6c17b6"},{"text":" Warning","color":"red"},{"text":": PlayerDB is not installed. ","color":"gray"},{"text":"Please grab the latest release by clicking this text. ","color":"gray"},{"text":"This datapack will now attempt to disable itself. You can reenable via /datapack enable \"file/EnderChest+\".","color":"gray"}]
execute unless score PlayerDB rx.mods matches 1.. if entity @a run datapack disable "file/EnderChest+"

# loop until players
execute unless entity @a run schedule function rx.ec:check 10t replace
