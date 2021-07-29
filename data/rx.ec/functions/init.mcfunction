# By: rx97
# 10 Oct 2020
# 
#> Creates Objs. Called from Lantern Load

#define storage rx:global
#define storage rx:info
#define storage rx:temp
#define storage rx:io

# objectives
scoreboard objectives add rx.ec.headDrop minecraft.dropped:minecraft.player_head
scoreboard objectives add rx.ec.openChest minecraft.custom:open_enderchest
scoreboard objectives add rx.ec.currPage dummy
scoreboard objectives add rx.ec.maxPage dummy

# fake players
scoreboard players set $64 rx.int 64

# version
{%- for sem in ['major', 'minor', 'patch'] -%}
data modify storage rx:info ec.version.{{sem}} set value {{ctx.meta.version[sem]}}
{%- endfor -%}

# schedule tick
schedule function rx.ec:tick 1t replace
