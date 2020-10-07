# By: rx97
# 06 Oct 20
# 
#> @s: player from rx.ec:test
#> iterate test

# copy to test
data modify storage rx:temp ec.test set from storage rx:io playerdb.player.data.rx.ec.upgrade.items[0]

# save test count + remove
execute store result score $test.count rx.temp run data get storage rx:temp ec.test.item.Count
data remove storage rx:temp ec.test.item.Count

# perform match: $match = 0 is success, $match = 1 is failure
execute store result score $match rx.temp run data modify storage rx:temp ec.test.item set from storage rx:temp ec.upgrade

# chk if we have enough items to match
execute if score $match rx.temp matches ..0 if score $count rx.temp < $test.count rx.temp run scoreboard players set $match rx.temp 1
execute if score $match rx.temp matches ..0 if data storage rx:temp ec.test{completed:1b} run scoreboard players set $match rx.temp 1

# fully matched!
execute if score $match rx.temp matches ..0 run data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items[0].completed set value 1b
execute if score $match rx.temp matches ..0 run data modify block -30000000 0 1603 Text1 set value '{"storage": "rx:io", "nbt": "playerdb.player.data.rx.ec.upgrade.items[0].lore", "color": "green", "strikethrough": true, "interpret": true, "italic": true}'
execute if score $match rx.temp matches ..0 run data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items[0].lore set from block -30000000 0 1603 Text1

# deduct resource count
execute if score $match rx.temp matches ..0 run scoreboard players operation $count rx.temp -= $test.count rx.temp

# success!
execute if score $match rx.temp matches ..0 run scoreboard players set $success rx.temp 1

tellraw rx97 ["HI: ", {"score": {"name": "$list", "objective":"rx.temp"},"color":"gold"}, " ", {"score": {"name": "$match", "objective":"rx.temp"}}]
