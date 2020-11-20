# By: rx97
# 16 Nov 20
# 
#> @s: player
#> Starts the linking process

tag @s add rx.Self

#> init
scoreboard players set $hit rx.temp 0
scoreboard players set $steps rx.temp 0
function rx.ec:link/ray

#> chk
execute if score $success rx.temp matches 1.. run tellraw @s [{"text":"", "color":"gray"}, {"nbt": "ec.pretty_name", "interpret": true, "storage": "rx:info"}, ": Are you sure you want to link EnderChests with ", {"selector": "@a[tag=rx.Hit,limit=1]", "color": "gold"}, "? ", {"text": "Warning", "color": "dark_red"}, ": ", {"text": "This process is irreversible.", "color": "red"}, " [", {"text": "✔", "color": "green", "clickEvent": {"action": "run_command", "value": "/trigger LinkEnderChest set -1"}, "hoverEvent": {"action": "show_text", "value": "Click!"}}, "] ", " [", {"text": "X", "color": "red", "clickEvent": {"action": "run_command", "value": "/trigger LinkEnderChest set -2"}, "hoverEvent": {"action": "show_text", "value": "Click!"}}, "]"]
execute if score $success rx.temp matches 1.. run scoreboard players operation @s rx.ec.link = $uid rx.temp

tag @s remove rx.Self
