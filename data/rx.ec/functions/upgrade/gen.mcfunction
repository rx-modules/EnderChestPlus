# By: rx97
# 5 Oct 2020
# 
#> @s: player from rx.ec:setup
#> generate upgrade materials

# ✔ ✗

data remove storage rx:io playerdb.player.data.rx.ec.upgrade

execute unless entity af-0-0-0-1 run summon minecraft:armor_stand -30000000 60 1602 {CustomName:'{"text":"Rx Stand"}',NoGravity:1b,Silent:1b,Invulnerable:1b,UUID:[I;175,0,0,1],CustomNameVisible:0b,NoAI:1b,AbsorptionAmount:1e8f, Marker:1b, Small:1b, ShowArms:1b, Invisible:1b}
data modify entity af-0-0-0-1 HandItems[0] set value {id:"minecraft:stick",Count:1b,tag:{Enchantments:[{id:"minecraft:aqua_affinity",lvl:1}]}}

scoreboard players operation $temp rx.temp = @s rx.ec.maxPage
execute as af-0-0-0-1 run scoreboard players operation @s rx.ec.maxPage = $temp rx.temp
execute as af-0-0-0-1 store result entity @s HandItems[0].tag.Enchantments[{id:"minecraft:aqua_affinity"}].lvl short 1 run scoreboard players get @s rx.ec.maxPage
execute at @s as af-0-0-0-1 run loot spawn ~ ~ ~ fish rx.ec:upgrade ~ ~ ~ mainhand
# say @e[type=item]
execute as @e[type=item,nbt={Item:{tag:{rx:{ec:{spawned:1b}}}}}] run tag @s add rx.ec.spawned
execute as @e[type=item,tag=rx.ec.spawned] run function rx.ec:upgrade/add_item

# kill af-0-0-0-1

# sanity
execute store result score $items rx.temp if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[]
execute store result score $ids rx.temp if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[].item.id

scoreboard players add $loop rx.temp 1

# regen upgrades if we are missing one
execute unless score $items rx.temp = $ids rx.temp if score $loop rx.temp matches ..5 run function rx.ec:upgrade/gen
