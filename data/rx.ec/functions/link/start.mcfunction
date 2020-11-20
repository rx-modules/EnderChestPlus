# By: rx97
# 16 Nov 20
# 
#> @s: player to start linking
#> Start linking process

#> score matching
scoreboard players operation $uid rx.temp = @s rx.uid
execute as @a if score @s rx.uid = $uid rx.temp run tag @s add rx.Target


execute as @a[tag=rx.Target,limit=1] run function rx.ec:link/add
scoreboard players operation @s rx.ec.currPage = $page rx.temp


tag @s add rx.ec.linked


tag @a remove rx.Target
