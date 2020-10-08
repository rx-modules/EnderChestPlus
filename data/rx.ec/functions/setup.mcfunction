# By: rx97
# 4 Oct 2020
# 
#> Setup player

scoreboard players set @s rx.ec.currPage 0
scoreboard players set @s rx.ec.maxPage 0

function rx.playerdb:api/get_self

# setup data
data modify storage rx:temp ec.player set from entity @s
data modify storage rx:io playerdb.player.data.rx.ec.current_page set value []
data modify storage rx:io playerdb.player.data.rx.ec.up_pages set value []
data modify storage rx:io playerdb.player.data.rx.ec.down_pages set value []
scoreboard players set $loop rx.temp 0

# generate upgrade
function rx.ec:upgrade/gen

# give enderchest items back, if exist
execute if data storage rx:temp ec.player.EnderItems[] run data remove block -30000000 0 1602 Items
execute if data storage rx:temp ec.player.EnderItems[] run loot replace entity @s enderchest.0 mine -30000000 0 1602 air{drop_contents:1b}
execute if data storage rx:temp ec.player.EnderItems[] run data modify block -30000000 0 1602 Items set from storage rx:temp ec.player.EnderItems
execute if data storage rx:temp ec.player.EnderItems[] run loot give @s mine -30000000 0 1602 air{drop_contents:1b}

# set manual in enderchest
replaceitem entity @s enderchest.13 written_book{pages:['["",{"text":"E","color":"#9938fa"},{"text":"n","color":"#ab39fa"},{"text":"d","color":"#bd3afb"},{"text":"e","color":"#d03bfc"},{"text":"r","color":"#e23dfc"},{"text":"C","color":"#f43efd"},{"text":"h","color":"#f33cfd"},{"text":"e","color":"#de37fb"},{"text":"s","color":"#ca32f9"},{"text":"t","color":"#b52df7"},{"text":"s","color":"#a028f5"},{"text":"+","color":"#8c23f3"},{"text":" (tm)","color":"dark_gray","italic":true},{"text":"\\n","color":"reset"},{"text":"The storage solution for the modern age.","italic":true,"color":"gray"},{"text":"\\n\\n","color":"reset"},{"text":"-------------------","color":"dark_gray"},{"text":"\\n\\n","color":"reset"},{"text":"> Intro","color":"gray","clickEvent":{"action":"change_page","value":2},"hoverEvent":{"action":"show_text","contents":"Intro"}},{"text":"\\n","color":"reset"},{"text":"> Navigation","color":"dark_gray","clickEvent":{"action":"change_page","value":3},"hoverEvent":{"action":"show_text","contents":"Navigation"}},{"text":"\\n","color":"reset"},{"text":"> Upgrading","color":"gray","clickEvent":{"action":"change_page","value":4},"hoverEvent":{"action":"show_text","contents":"Upgrading"}},{"text":"\\n","color":"reset"},{"text":"> Shulker Loading","color":"dark_gray","clickEvent":{"action":"change_page","value":5},"hoverEvent":{"action":"show_text","contents":"Shulker Loading"}},{"text":"\\n","color":"reset"},{"text":">","color":"gray","clickEvent":{"action":"change_page","value":6},"hoverEvent":{"action":"show_text","contents":"Credits"}},{"text":" Credits","color":"gray","clickEvent":{"action":"change_page","value":6},"hoverEvent":{"action":"show_text","contents":"Credits"}},{"text":"\\n","color":"reset"},{"text":">","color":"dark_gray","clickEvent":{"action":"change_page","value":7},"hoverEvent":{"action":"show_text","contents":"Legal"}},{"text":" Legal","italic":true,"color":"dark_gray","clickEvent":{"action":"change_page","value":7},"hoverEvent":{"action":"show_text","contents":"Legal"}},{"text":"\\n\\n","color":"reset"},{"text":"-------------------","color":"dark_gray"}]','["",{"text":"<","bold":true,"color":"gold","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":" Intro","bold":true,"color":"gold"},{"text":"\\n\\nWelcome to your new EnderChest+ Storage Solution.\\n\\nThis system augments your EnderChest to be infinitely expandable through the bleeding edge research from EnderChest+ Corp.","color":"reset"}]','["",{"text":"<","bold":true,"color":"gold","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":" Navigation","bold":true,"color":"gold"},{"text":"\\n\\nTo navigate, click on the items on the right side items in your enderchest. Click these items will navigate upwards or downwards.\\n\\nShift-clicking these items will skip to the first or last page.","color":"reset"}]','["",{"text":"<","bold":true,"color":"gold","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":" Upgrading","bold":true,"color":"gold"},{"text":"\\n\\nTo upgrade your system, just place the required materials upon the mini-enderchest item on the right-hand side.\\n\\nEach upgrade will progressively become more expensive!","color":"reset"}]','["",{"text":"<","bold":true,"color":"gold","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":" Shulker Loading","bold":true,"color":"gold"},{"text":"\\n\\nIf you own a Shulker Box, you can load/unload the materials of the box by clicking the box upon the mini-enderchest.\\n\\nThis will also swap the items from the enderchest page to the shulker box!","color":"reset"}]','["",{"text":"<","bold":true,"color":"gold","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":" Credits","bold":true,"color":"gold"},{"text":"\\n\\nThis datapack was created by rx97. \\n\\nIt uses a system called ","color":"reset"},{"text":"PlayerDB","clickEvent":{"action":"open_url","value":"https://github.com/RitikShah/MC-PlayerDB/"},"hoverEvent":{"action":"show_text","contents":"Takes you to PlayerDB Github"}},{"text":".\\n\\nYou can check for updates by looking for the latest release on my Github "},{"text":"here","clickEvent":{"action":"open_url","value":"https://github.com/RitikShah/EnderChestPlus/releases"},"hoverEvent":{"action":"show_text","contents":"Click to head to the Github releases page!"}},{"text":"."}]','["",{"text":"<","bold":true,"color":"gold","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":" Legal","bold":true,"color":"gold"},{"text":"\\n\\n","color":"reset"},{"text":"There are no returns or refunds once you submit your materials for an upgrade. Complaints are sent to the bin. Side effects may include dysphoria, an addiction to upgrading, and a large deficit of netherite disappearing.","italic":true,"color":"dark_gray"}]'],title:"EnderChest+ Manual",author:rx97,display:{Lore:['{"text":"A guide on how to","color":"dark_gray","italic":false}','{"text":"use your brand new","color":"dark_gray","italic":false}','{"text":"EnderChest+(tm) System","color":"dark_gray","italic":false}']}} 1

# set gui icons
function rx.ec:gui/fix

# audiovisual
execute at @s run playsound minecraft:entity.firework_rocket.launch master @s ~ ~ ~ 1 2

function rx.playerdb:api/save_self
scoreboard players add @s rx.ec.openChest 1
