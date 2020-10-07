# By: rx97
# 4 Oct 2020
# 
#> @s: player from rx.ec:gui
#> new page

scoreboard players add @s rx.ec.maxPage 1
data modify storage rx:io playerdb.player.data.rx.ec.down_pages append value []
scoreboard players set $loop rx.temp 0
function rx.ec:upgrade/gen

# audiovisual
execute at @s run playsound minecraft:item.armor.equip_netherite master @s ~ ~ ~ 2 .1
execute at @s run playsound minecraft:item.armor.equip_diamond master @s ~ ~ ~ 2 .75
