# By: rx97
# 4 Oct 2020
# 
#> @s: player from rx.ec:tick
#> player tick

# setup
execute if entity @s[scores={rx.ec.openChest=1}] run function rx.ec:player/setup

# head drop fix
execute if entity @s[scores={rx.ec.headDrop=1..}] run function rx.ec:gui/fix
