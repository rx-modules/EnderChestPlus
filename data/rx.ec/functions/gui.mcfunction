# By: rx97
# 4 Oct 2020
# 
#> @s: player from rx.ec:tick (rx.ec:gui=true)
#> either player click or shift-click item

execute store result score $items rx.temp run clear @s #rx:all{rx:{ec:{gui:1b}}} 0
execute if score $items rx.temp matches 1.. run function rx.ec:gui/root
clear @s #rx:all{rx:{ec:{gui:1b}}}
