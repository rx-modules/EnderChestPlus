# By: rx97
# 10 Oct 2020
# 
#> Creates Objs. Called from Lantern Load

#define storage rx:global
#define storage rx:info
#define storage rx:temp
#define storage rx:io

#!set version_major = ctx.project_version.split('.')[0]
#!set version_minor = ctx.project_version.split('.')[1]
#!set version_patch = ctx.project_version.split('.')[2]

# objectives
scoreboard objectives add rx.ec.headDrop minecraft.dropped:minecraft.player_head
scoreboard objectives add rx.ec.openChest minecraft.custom:open_enderchest
scoreboard objectives add rx.ec.currPage dummy
scoreboard objectives add rx.ec.maxPage dummy

# fake players
scoreboard players set $64 rx.int 64

# version
data modify storage rx:info ec.version.major set value __version_major__
data modify storage rx:info ec.version.minor set value __version_minor__
data modify storage rx:info ec.version.patch set value __version_patch__

# schedule tick
schedule function rx.ec:tick 1t replace
