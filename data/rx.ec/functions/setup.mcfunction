# By: rx97
# 4 Oct 2020
# 
#> Setup player

scoreboard players set @s rx.ec.currPage 0
scoreboard players set @s rx.ec.maxPage 0

function rx.playerdb:api/get_self
data modify storage rx:io playerdb.player.data.rx.ec.current_page set value []
data modify storage rx:io playerdb.player.data.rx.ec.up_pages set value []
data modify storage rx:io playerdb.player.data.rx.ec.down_pages set value []
scoreboard players set $loop rx.temp 0
function rx.ec:upgrade/gen
function rx.ec:gui/fix
function rx.playerdb:api/save_self
scoreboard players add @s rx.ec.openChest 1
