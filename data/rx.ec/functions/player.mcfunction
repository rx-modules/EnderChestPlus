# By: rx97

# 4 Oct 2020

# 

#> @s: player from rx.ec:tick

#> player tick



# setup

execute if entity @s[scores={rx.ec.openChest=1}] run function rx.ec:setup



# gui detect

execute store result score $items rx.temp run clear @s minecraft:player_head{rx:{ec:{gui:1b}}} 0

execute if score $items rx.temp matches 1.. run function rx.ec:gui/root

clear @s minecraft:player_head{rx:{ec:{gui:1b}}}



# head drop fix

execute if entity @s[scores={rx.ec.headDrop=1..}] run function rx.ec:gui/fix
