# By: rx97
# 5 Oct 2020
# 
#> @s: player from rx.ec:setup
#> generate upgrade materials

# ✔ ✗

data remove storage rx:io playerdb.player.data.rx.ec.upgrade
function rx.ec:upgrade/gen/material
execute if score @s rx.ec.maxPage matches 1.. run function rx.ec:upgrade/gen/base
execute if score @s rx.ec.maxPage matches 3.. run function rx.ec:upgrade/gen/augment

# sanity
execute store result score $items rx.temp if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[]
execute store result score $ids rx.temp if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[].item.id

scoreboard players add $loop rx.temp 1

# regen upgrades if we are missing one
# execute unless score $items rx.temp = $ids rx.temp run tellraw rx97 "regenning upgrade"
execute unless score $items rx.temp = $ids rx.temp if score $loop rx.temp matches ..10 run function rx.ec:upgrade/gen
