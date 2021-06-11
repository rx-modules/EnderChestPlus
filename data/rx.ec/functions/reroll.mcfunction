# By: rx97

# 08 Oct 20

# 

#> @s: player

#> Rerolls upgrades. Admin func only



function rx.playerdb:api/get_self

scoreboard players set $loop rx.temp 0

execute in minecraft:overworld run function rx.ec:upgrade/gen

execute in minecraft:overworld run function rx.ec:gui/fix

function rx.playerdb:api/save_self



# audiovisual

execute at @s run playsound minecraft:item.armor.equip_netherite voice @s ~ ~ ~ 2 .1

execute at @s run playsound minecraft:item.armor.equip_diamond voice @s ~ ~ ~ 2 .75
