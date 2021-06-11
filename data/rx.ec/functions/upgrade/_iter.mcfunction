# By: rx97

# 4 Oct 2020

# 

#> @s: player from rx.ec:gui

#> iterate



# if we haven't successfully matched an element

execute if score $success rx.temp matches ..0 run function rx.ec:upgrade/_iter_test



# continue iterate to ensure order is the same

scoreboard players remove $list rx.temp 1

execute if score $list rx.temp matches 0.. run data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items append from storage rx:io playerdb.player.data.rx.ec.upgrade.items[0]

execute if score $list rx.temp matches 0.. run data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[0]

execute if score $list rx.temp matches 0.. run function rx.ec:upgrade/_iter
