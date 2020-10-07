# By: rx97
# 5 Oct 2020
# 
#> @s: player from rx.ec:upgrade/gen
#> figure out the augment requirement

# spawn item
loot spawn -30000000 60 1602 loot rx.ec:augment

# store and strip
data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items append value {item: {}, completed:0b}
data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item set from entity @e[type=item,nbt={Item:{tag:{rx:{ec:{spawned:1b}}}}},limit=1,sort=nearest,x=-30000000,y=60,z=1602] Item
data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.Slot
data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.rx.ec.spawned

# remove the spawned:1b nbt tag weirdly
execute store result score $count rx.temp run data get storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.rx.ec
execute if score $count rx.temp matches ..0 run data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.rx.ec
execute store result score $count rx.temp run data get storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.rx
execute if score $count rx.temp matches ..0 run data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.rx
execute store result score $count rx.temp run data get storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag
execute if score $count rx.temp matches ..0 run data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag

# count item stack count
execute store result score $count rx.temp run data get storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.Count

# construct lore + save
execute unless data storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.display run data modify block -30000000 0 1603 Text1 set value '[{"score":{"name":"$count","objective":"rx.temp"},"color":"gold"}, " ", {"selector": "@e[type=item,nbt={Item:{tag:{rx:{ec:{spawned:1b}}}}},limit=1,sort=nearest,x=-30000000,y=60,z=1602]"}]'
execute if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.display run data modify block -30000000 0 1603 Text1 set value '[{"score":{"name":"$count","objective":"rx.temp"},"color":"gold"}, " ", {"nbt": "playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.display.Name", "storage": "rx:io", "interpret": true, "italic": true}]'
data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].lore set from block -30000000 0 1603 Text1

# remove display
data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.display

# delete item
kill @e[type=item,nbt={Item:{tag:{rx:{ec:{spawned:1b}}}}}]
