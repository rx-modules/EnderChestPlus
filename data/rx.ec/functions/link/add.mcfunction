# By: rx97
# 17 Nov 20
# 
#> @s: main player
#> Add extra page

#> setup if not setup
execute unless score @s rx.ec.openChest matches 1.. run function rx.ec:setup

#> add page
function rx.ec:player/add_page

#> page
scoreboard players operation $page rx.temp = @s rx.ec.currPage
scoreboard players add $page rx.temp 1
execute if score $page rx.temp > @s rx.ec.maxPage run scoreboard players set @s rx.ec.currPage 0
