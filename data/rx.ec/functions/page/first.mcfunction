# By: rx97
# 4 Oct 2020
# 
#> @s: player from rx.ec:gui
#> go to first

data modify storage rx:io playerdb.player.data.rx.ec.down_pages prepend from storage rx:io playerdb.player.data.rx.ec.current_page
data modify storage rx:io playerdb.player.data.rx.ec.down_pages prepend from storage rx:io playerdb.player.data.rx.ec.up_pages[]
data modify storage rx:io playerdb.player.data.rx.ec.current_page set from storage rx:io playerdb.player.data.rx.ec.down_pages[0]
data modify storage rx:io playerdb.player.data.rx.ec.up_pages set value []
data remove storage rx:io playerdb.player.data.rx.ec.down_pages[0]
