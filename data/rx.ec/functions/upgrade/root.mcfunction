# By: rx97

# 4 Oct 2020

# 

#> @s: player from rx.ec:gui

#> Placed item onto upgrade slot



function rx.playerdb:api/get_self



data remove storage rx:temp ec.upgrade.Slot



#> $shulker will be set to 0 if there is no shulkerbox set

scoreboard players set $shulker rx.temp 1



execute store success score $book rx.temp if data storage rx:temp ec.upgrade{id:"minecraft:book"}

execute unless data storage rx:temp ec.upgrade{id:"minecraft:white_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:orange_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:magenta_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:light_blue_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:yellow_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:lime_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:pink_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:gray_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:light_gray_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:cyan_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:purple_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:blue_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:brown_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:green_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:red_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:black_shulker_box"} unless data storage rx:temp ec.upgrade{id:"minecraft:shulker_box"} run scoreboard players set $shulker rx.temp 0



#> cancel shulker if shulkers inside current page

execute if score $shulker rx.temp matches 1.. run scoreboard players set $shulker rx.temp -1

execute if score $shulker rx.temp matches ..-1 unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:white_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:orange_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:magenta_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:light_blue_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:yellow_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:lime_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:pink_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:gray_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:light_gray_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:cyan_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:purple_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:blue_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:brown_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:green_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:red_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:black_shulker_box"}] unless data storage rx:temp ec.player.EnderItems[{id:"minecraft:shulker_box"}] run scoreboard players set $shulker rx.temp 1

execute if score $shulker rx.temp matches ..-1 run tellraw @s [{"text":"","color":"red"},{"nbt": "playerdb.pretty_name", "storage": "rx:info", "interpret": true}, {"text":": ","color":"gray"}, "Sorry, you cannot store shulker boxes inside shulker boxes."]



#> if shulker is fresh, prep it

execute if score $shulker rx.temp matches 1.. unless data storage rx:temp ec.upgrade.tag.BlockEntityTag.Items[] run data modify storage rx:temp ec.upgrade.tag.BlockEntityTag.Items set value []



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



#> Transform into manual

execute if score $book rx.temp matches 1.. run function rx.ec:manual

execute if score $book rx.temp matches 1.. store result storage rx:temp ec.upgrade.Count byte 1 run data get storage rx:temp ec.upgrade.Count 0.9999999999



#> Return items

data modify storage rx:temp ec.items append from storage rx:temp ec.upgrade

data remove storage rx:temp ec.upgrade.tag.display

data remove storage rx:temp ec.upgrade.tag.SkullOwner



#> Test for upgrade items

execute if score $shulker rx.temp matches 0 if score $book rx.temp matches ..0 run function rx.ec:upgrade/test



function rx.playerdb:api/save_self
