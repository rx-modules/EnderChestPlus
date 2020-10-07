# By: rx97
# 4 Oct 2020
# 
#> @s: player from rx.ec:gui
#> Placed item onto upgrade slot

function rx.playerdb:api/get_self

data remove storage rx:temp ec.upgrade.Slot

#> $shulker will be set to 0 if there is no shulkerbox set
scoreboard players set $shulker rx.temp 1
execute unless data storage rx:temp ec.upgrade{id:"minecraft:white_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:orange_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:magenta_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:light_blue_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:yellow_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:lime_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:pink_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:gray_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:light_gray_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:cyan_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:purple_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:blue_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:brown_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:green_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:red_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:black_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:shulker_box"} run scoreboard players set $shulker rx.temp 0

#> if shulker, swap contents w/ current page, overflow items back to inv
# these items overlap w/ GUI, lets give them back to the player !!!
execute if score $shulker rx.temp matches 1.. run data modify storage rx:temp ec.items append from storage rx:temp ec.upgrade.tag.BlockEntityTag.Items[{Slot:8b}]
execute if score $shulker rx.temp matches 1.. run data modify storage rx:temp ec.items append from storage rx:temp ec.upgrade.tag.BlockEntityTag.Items[{Slot:17b}]
execute if score $shulker rx.temp matches 1.. run data modify storage rx:temp ec.items append from storage rx:temp ec.upgrade.tag.BlockEntityTag.Items[{Slot:26b}]
execute if score $shulker rx.temp matches 1.. run data remove storage rx:temp ec.upgrade.tag.BlockEntityTag.Items[{Slot:8b}]
execute if score $shulker rx.temp matches 1.. run data remove storage rx:temp ec.upgrade.tag.BlockEntityTag.Items[{Slot:17b}]
execute if score $shulker rx.temp matches 1.. run data remove storage rx:temp ec.upgrade.tag.BlockEntityTag.Items[{Slot:26b}]

#> Swap!
#> shulkerbox -> phi box, enderchest -> shulkerbox, phi box -> enderchest
execute if score $shulker rx.temp matches 1.. run data modify block -30000000 0 1602 Items set from storage rx:temp ec.upgrade.tag.BlockEntityTag.Items
execute if score $shulker rx.temp matches 1.. run data modify storage rx:temp ec.upgrade.tag.BlockEntityTag.Items set from storage rx:temp ec.player.EnderItems
execute if score $shulker rx.temp matches 1.. run data remove storage rx:temp ec.upgrade.tag.BlockEntityTag.Items[{tag:{rx:{ec:{}}}}]
execute if score $shulker rx.temp matches 1.. run loot replace entity @s enderchest.0 mine -30000000 0 1602 air{drop_contents:1b}


data modify storage rx:temp ec.items append from storage rx:temp ec.upgrade
data remove storage rx:temp ec.upgrade.tag.display

#> Test for upgrade items
execute if score $shulker rx.temp matches ..0 run function rx.ec:upgrade/test

function rx.playerdb:api/save_self
