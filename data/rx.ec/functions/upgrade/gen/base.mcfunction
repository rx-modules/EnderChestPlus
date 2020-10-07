# By: rx97
# 5 Oct 2020
# 
#> @s: player from rx.ec:upgrade/gen
#> figure out the shulker shell requirement

# ✔ ✗

# calculate shulker shell count
# (maxPage - 1)^2 <= 64 (capped)
scoreboard players operation $count rx.temp = @s rx.ec.maxPage
scoreboard players operation $count rx.temp *= $count rx.temp
scoreboard players operation $count rx.temp < $64 rx.int

# add item to upgrade list
data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items append value {item:{id:"minecraft:shulker_shell",Count:0b},completed:0b}

# store custom count to item
execute store result storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.Count byte 1 run scoreboard players get $count rx.temp

# add lore to upgrade list
data modify block -30000000 0 1603 Text1 set value '[{"score":{"name":"$count","objective":"rx.temp"},"color":"gold"}, " Shulker Shell"]'
data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].lore set from block -30000000 0 1603 Text1
