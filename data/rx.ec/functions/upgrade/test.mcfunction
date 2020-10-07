# By: rx97
# 4 Oct 2020
# 
#> @s: player from rx.ec:gui
#> Testing for upgrade slots. iterate!

# starting vars
execute store result score $list rx.temp if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[]
scoreboard players set $match rx.temp 1

# cache count and remove
execute store result score $count rx.temp run data get storage rx:temp ec.upgrade.Count
data remove storage rx:temp ec.upgrade.Count

# loop
function rx.ec:upgrade/_iter

# return items
execute store result storage rx:temp ec.items[-1].Count byte 1 run scoreboard players get $count rx.temp

tellraw rx97 ["HELLO: ", {"score": {"name": "$count", "objective":"rx.temp"},"color":"gold"}, " ", {"score": {"name": "$test.count", "objective":"rx.temp"}}]

# if success sound
execute if score $success rx.temp matches 1.. at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.75 2

# if we've completed all upgrade sfuff, new page :D
execute store result score $size rx.temp if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[{completed:0b}]
tellraw rx97 {"storage": "rx:io", "nbt":"playerdb.player.data.rx.ec.upgrade.items[].item"}
tellraw rx97 {"storage": "rx:temp", "nbt":"ec.upgrade"}
execute if score $size rx.temp matches ..0 run function rx.ec:page/new
