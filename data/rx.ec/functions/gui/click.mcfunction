# By: rx97
# 4 Oct 2020
# 
#> @s: player from rx.ec:gui
#> normal click gui item

# shift click up/down
execute if score $click rx.temp matches -1 run scoreboard players remove @s rx.ec.currPage 1
execute if score $click rx.temp matches 1 run scoreboard players add @s rx.ec.currPage 1

# boundaries (stop)
execute if score @s rx.ec.currPage > @s rx.ec.maxPage run scoreboard players operation @s rx.ec.currPage = @s rx.ec.maxPage
execute if score @s rx.ec.currPage matches ..-1 run scoreboard players set @s rx.ec.currPage 0
