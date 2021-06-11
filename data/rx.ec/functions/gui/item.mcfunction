# By: rx97
# 03 May 21
# 
#> @s: player clicks on item
#> Handle gui item

# gui detect
execute store result score $items rx.temp run clear @s minecraft:player_head{rx:{ec:{gui:1b}}} 0
execute if score $items rx.temp matches 1.. run function rx.ec:gui/root
clear @s minecraft:player_head{rx:{ec:{gui:1b}}}
