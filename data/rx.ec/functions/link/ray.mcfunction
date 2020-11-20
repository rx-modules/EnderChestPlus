# By: rx97
# 16 Nov 20
# 
#> @s: player
#> Raycast loop

execute if score $hit rx.temp matches 0 positioned ~-0.05 ~-0.05 ~-0.05 as @a[tag=!rx.Self,dx=0,sort=nearest] if score $hit rx.temp matches 0 positioned ~-0.85 ~-0.85 ~-0.85 if entity @s[dx=0] run function rx.ec:link/hit
scoreboard players add $step rx.temp 1
execute if score $hit rx.temp matches 0 if score $step rx.temp matches ..100 positioned ^ ^ ^0.1 run function rx.ec:link/ray
