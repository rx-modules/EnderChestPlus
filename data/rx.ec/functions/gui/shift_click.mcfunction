# By: rx97
# 4 Oct 2020
# 
#> @s: player from rx.ec:gui
#> shift-clicked gui item

# shift click up
execute if score $shift rx.temp matches -1 run scoreboard players set @s rx.ec.currPage 0
execute if score $shift rx.temp matches 1 run scoreboard players operation @s rx.ec.currPage = @s rx.ec.maxPage
