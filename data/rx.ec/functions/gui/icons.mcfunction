# By: rx97
# 4 Oct 2020
# 
#> @s: player
#> multiple locations

replaceitem block -30000000 0 1602 container.8 minecraft:player_head{rx:{ec:{gui:1b,action:'up'}},display:{Name:'{"text":"Up","color":"gold","italic":false}',Lore:['{"text":"Shift to Jump","color":"gray","italic":false}']},SkullOwner:{Id:[I;921500126,-1662759197,-1515206466,-1205101373],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzA0MGZlODM2YTZjMmZiZDJjN2E5YzhlYzZiZTUxNzRmZGRmMWFjMjBmNTVlMzY2MTU2ZmE1ZjcxMmUxMCJ9fX0="}]}}}
replaceitem block -30000000 0 1602 container.17 minecraft:player_head{rx:{ec:{gui:1b,action:'upgrade'}},display:{Name:'{"text":"Upgrade","color":"gold","italic":false}',Lore:['{"text":"Place Upgrade Items on Me!","color":"gray","italic":false}']},SkullOwner:{Id:[I;1121675190,-1647227906,-1267169239,-1050533352],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTZjYzQ4NmMyYmUxY2I5ZGZjYjJlNTNkZDlhM2U5YTg4M2JmYWRiMjdjYjk1NmYxODk2ZDYwMmI0MDY3In19fQ=="}]}}}
replaceitem block -30000000 0 1602 container.26 minecraft:player_head{rx:{ec:{gui:1b,action:'down'}},display:{Name:'{"text":"Down","color":"gold","italic":false}',Lore:['{"text":"Shift to Jump","color":"gray","italic":false}']},SkullOwner:{Id:[I;1554395052,-795589818,-2090737185,-577305081],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzQzNzM0NmQ4YmRhNzhkNTI1ZDE5ZjU0MGE5NWU0ZTc5ZGFlZGE3OTVjYmM1YTEzMjU2MjM2MzEyY2YifX19"}]}}}

data modify block -30000000 0 1602 Items[{Slot:17b}].tag.display.Lore append from storage rx:io playerdb.player.data.rx.ec.upgrade.items[].lore

scoreboard players operation $curr rx.temp = @s rx.ec.currPage
scoreboard players add $curr rx.temp 1
scoreboard players operation $max rx.temp = @s rx.ec.maxPage
scoreboard players add $max rx.temp 1
data modify block -30000000 0 1603 Text1 set value '[{"text": "Page: ","italic":false,"color":"gray"}, {"score": {"name":"$curr", "objective":"rx.temp"}}, "/", {"score": {"name":"$max", "objective":"rx.temp"}}]'
data modify block -30000000 0 1602 Items[{tag:{rx:{ec:{gui:1b}}}}].tag.display.Lore prepend from block -30000000 0 1603 Text1
