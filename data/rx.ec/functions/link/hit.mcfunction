# By: rx97
# 16 Nov 20
# 
#> @s: player that was hit
#> Raycast hit player

# ensure the linked has an inventory
execute unless entity @s[tag=rx.ec.linked] run tag @s add rx.Hit
execute unless entity @s[tag=rx.ec.linked] run scoreboard players set $success rx.temp 1
execute unless entity @s[tag=rx.ec.linked] run scoreboard players operation $uid rx.temp = @s rx.uid
execute if entity @s[tag=rx.ec.linked] run tellraw @a[tag=rx.Self,limit=1] [{"text": "", "color": "gray"}, {"nbt": "ec.pretty_name", "interpret": true, "storage": "rx:info"}, " ", {"text": "Error", "color": "red"}, {"selector": "@s", "color": "gold"}, " cannot be linked with. They are currently linked to someone else."]
