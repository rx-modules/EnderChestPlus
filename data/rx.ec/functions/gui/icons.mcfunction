# By: rx97
# 4 Oct 2020
# 
#> @s: player
#> multiple locations

item block -30000000 0 1602 container.8 replace minecraft:player_head{rx: {ec: {gui: 1b, action: 'up'}}, display: {Name: '[{"text":"U","color":"#661192","italic":false},{"text":"p","color":"#6c17b6"}]', Lore: ['{"text":"Shift to Jump to the Start","color":"#845f86","italic":false}']}, SkullOwner: {Id: [I; 921500126, -1662759197, -1515206466, -1205101373], Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzA0MGZlODM2YTZjMmZiZDJjN2E5YzhlYzZiZTUxNzRmZGRmMWFjMjBmNTVlMzY2MTU2ZmE1ZjcxMmUxMCJ9fX0="}]}}}
item block -30000000 0 1602 container.17 replace minecraft:player_head{rx: {ec: {gui: 1b, action: 'upgrade'}}, display: {Name: '[{"text":"U","color":"#661192","italic":false},{"text":"p","color":"#9820b6"},{"text":"g","color":"#cb2fda"},{"text":"r","color":"light_purple"},{"text":"a","color":"#cd31e6"},{"text":"d","color":"#9c24ce"},{"text":"e","color":"#6c17b6"}]', Lore: ['""', '{"text":"Upgrade item list at the bottom","color":"#845f86","italic":false}', '{"text":"Shulkers will collect all","color":"#845f86","italic":false}', '{"text":"Books will get you a manual","color":"#845f86","italic":false}', '""', '{"text":"Items needed for upgrade:","color":"dark_gray","italic":false}']}, SkullOwner: {Id: [I; 1121675190, -1647227906, -1267169239, -1050533352], Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTZjYzQ4NmMyYmUxY2I5ZGZjYjJlNTNkZDlhM2U5YTg4M2JmYWRiMjdjYjk1NmYxODk2ZDYwMmI0MDY3In19fQ=="}]}}}
item block -30000000 0 1602 container.26 replace minecraft:player_head{rx: {ec: {gui: 1b, action: 'down'}}, display: {Name: '[{"text":"D","color":"#661192","italic":false},{"text":"o","color":"#cb2fda"},{"text":"w","color":"#cd31e6"},{"text":"n","color":"#6c17b6"}]', Lore: ['{"text":"Shift to Jump to the End","color":"#845f86","italic":false}']}, SkullOwner: {Id: [I; 1554395052, -795589818, -2090737185, -577305081], Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzQzNzM0NmQ4YmRhNzhkNTI1ZDE5ZjU0MGE5NWU0ZTc5ZGFlZGE3OTVjYmM1YTEzMjU2MjM2MzEyY2YifX19"}]}}}

data modify block -30000000 0 1602 Items[{Slot:17b}].tag.display.Lore append from storage rx:io playerdb.player.data.rx.ec.upgrade.items[].lore

scoreboard players operation $curr rx.temp = @s rx.ec.currPage
scoreboard players add $curr rx.temp 1
scoreboard players operation $max rx.temp = @s rx.ec.maxPage
scoreboard players add $max rx.temp 1
data modify block -30000000 0 1603 Text1 set value '[{"text": "Page: ","italic":false,"color":"#845f86"}, {"score": {"name":"$curr", "objective":"rx.temp"}}, "/", {"score": {"name":"$max", "objective":"rx.temp"}}]'
data modify block -30000000 0 1602 Items[{tag:{rx:{ec:{gui:1b}}}}].tag.display.Lore prepend from block -30000000 0 1603 Text1
