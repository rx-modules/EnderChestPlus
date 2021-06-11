# By: rx97

# 4 Oct 2020

# 

#> @s: player from rx.ec:gui

#> set page



function rx.playerdb:api/get_self



#> Save echest as current page

data modify storage rx:io playerdb.player.data.rx.ec.current_page set from storage rx:temp ec.player.EnderItems

# remove gui items

data remove storage rx:io playerdb.player.data.rx.ec.current_page[{tag:{rx:{ec:{}}}}]



#> Branching. move pages around

execute if score $shift rx.temp matches 0 if score $click rx.temp matches -1 run function rx.ec:page/up

execute if score $shift rx.temp matches 0 if score $click rx.temp matches 1 run function rx.ec:page/down

execute if score $shift rx.temp matches -1 run function rx.ec:page/first

execute if score $shift rx.temp matches 1 run function rx.ec:page/last



#> Load current page into echest

data modify block -30000000 0 1602 Items set from storage rx:io playerdb.player.data.rx.ec.current_page

function rx.ec:gui/icons

loot replace entity @s enderchest.0 mine -30000000 0 1602 air{drop_contents:1b}



function rx.playerdb:api/save_self
