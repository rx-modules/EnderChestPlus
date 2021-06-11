# By: rx97

# 4 Oct 2020

# 

#> @s: player from rx.ec:gui

#> Had atleast 1 gui item (either clicked or in inventory)



data remove storage rx:temp ec



# copy player to storage for fast nbt

data modify storage rx:temp ec.player set from entity @s

scoreboard players set $shift rx.temp 0

scoreboard players set $click rx.temp 0

scoreboard players set $success rx.temp 0

scoreboard players set $shulker rx.temp 0

scoreboard players operation $old.page rx.temp = @s rx.ec.currPage



# capture items that are clicked upon gui item

data modify storage rx:temp ec.items append from storage rx:temp ec.player.EnderItems[{Slot:8b}]

data modify storage rx:temp ec.upgrade set from storage rx:temp ec.player.EnderItems[{Slot:17b}]

data modify storage rx:temp ec.items append from storage rx:temp ec.player.EnderItems[{Slot:26b}]

data remove storage rx:temp ec.items[{tag:{rx:{ec:{gui:1b}}}}]

execute if data storage rx:temp ec.upgrade{tag:{rx:{ec:{gui:1b}}}} run data remove storage rx:temp ec.upgrade



data remove storage rx:temp ec.player.EnderItems[{Slot:8b}]

data remove storage rx:temp ec.player.EnderItems[{Slot:17b}]

data remove storage rx:temp ec.player.EnderItems[{Slot:26b}]



# this checks shift-clicking

execute if data storage rx:temp ec.player.Inventory[{tag:{rx:{ec:{action:'up'}}}}] run scoreboard players set $shift rx.temp -1

execute if data storage rx:temp ec.player.Inventory[{tag:{rx:{ec:{action:'upgrade'}}}}] run scoreboard players set $shift rx.temp 10

execute if data storage rx:temp ec.player.Inventory[{tag:{rx:{ec:{action:'down'}}}}] run scoreboard players set $shift rx.temp 1



# if we didn't shift click, we can clear for normal clicking

execute store result score $cond rx.temp run clear @s minecraft:player_head{rx:{ec:{action:'up'}}} 0

execute if score $cond rx.temp matches 1.. run scoreboard players set $click rx.temp -1

execute store result score $cond rx.temp run clear @s minecraft:player_head{rx:{ec:{action:'upgrade'}}} 0

execute if score $cond rx.temp matches 1.. run scoreboard players set $click rx.temp 10

execute store result score $cond rx.temp run clear @s minecraft:player_head{rx:{ec:{action:'down'}}} 0

execute if score $cond rx.temp matches 1.. run scoreboard players set $click rx.temp 1



# branch out :D

execute unless score $shift rx.temp matches 0 run function rx.ec:gui/shift_click

execute if score $shift rx.temp matches 0 unless score $click rx.temp matches 0 run function rx.ec:gui/click



# chk upgrade

execute if data storage rx:temp ec.upgrade run function rx.ec:upgrade/root



# set page

execute unless score @s rx.ec.currPage = $old.page rx.temp run function rx.ec:page/set

execute if score @s rx.ec.currPage = $old.page rx.temp run function rx.ec:gui/fix



# return items

execute if data storage rx:temp ec.items[] run data remove block -30000000 0 1602 Items

execute if data storage rx:temp ec.items[] run data modify block -30000000 0 1602 Items append from storage rx:temp ec.items[]

execute if data storage rx:temp ec.items[] run loot give @s mine -30000000 0 1602 air{drop_contents:1b}



# debug

# tellraw rx97 [{"score":{"name":"@s", "objective":"rx.ec.currPage"},"color":"gold"}, "/", {"score":{"name":"@s", "objective":"rx.ec.maxPage"},"color":"gold"}, " ", {"score":{"name":"$old.page", "objective":"rx.temp"}}]

# tellraw rx97 [{"score":{"name":"$shift", "objective":"rx.temp"},"color":"gold"}, " ", {"score":{"name":"$click", "objective":"rx.temp"}}, "\n"]



# audiovisual

execute if score @s rx.ec.currPage > $old.page rx.temp at @s run playsound minecraft:entity.item.pickup voice @s ~ ~ ~ 1 1.5

execute if score @s rx.ec.currPage < $old.page rx.temp at @s run playsound minecraft:entity.item.pickup voice @s ~ ~ ~ 1 0.7

execute if score @s rx.ec.currPage = $old.page rx.temp if score $success rx.temp matches 0 if score $shulker rx.temp matches ..0 at @s run playsound minecraft:item.shield.block voice @s ~ ~ ~ 0.7 2

execute if score @s rx.ec.currPage = $old.page rx.temp if score $shulker rx.temp matches 1.. at @s run playsound minecraft:block.barrel.close voice @s ~ ~ ~ 0.75 1.5

execute if score @s rx.ec.currPage = $old.page rx.temp if score $shulker rx.temp matches 1.. at @s run playsound minecraft:block.barrel.open voice @s ~ ~ ~ 0.6 2
