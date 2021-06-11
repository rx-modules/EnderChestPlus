# By: rx97
# 5 Oct 2020
# 
#> @s: player from rx.ec:setup
#> generate upgrade materials

# ✔ ✗

data remove storage rx:io playerdb.player.data.rx.ec.upgrade

scoreboard players operation $max.page rx.temp = @s rx.ec.maxPage
loot spawn -30000000 -1000 1602 loot rx.ec:upgrade

execute positioned -30000000 -1000 1602 run function #rx.ec:augment

execute positioned -30000000 -1000 1602 as @e[type=item,distance=..1,nbt={Item:{tag:{rx:{ec:{spawned:1b}}}}}] run function rx.ec:upgrade/add_item

# sanity
execute store result score $items rx.temp if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[]
execute store result score $ids rx.temp if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[].item.id

scoreboard players add $loop rx.temp 1

# regen upgrades if we are missing one (dirty fix)
execute unless score $items rx.temp = $ids rx.temp if score $loop rx.temp matches ..5 run function rx.ec:upgrade/gen
