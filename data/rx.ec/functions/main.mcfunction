# By: rx97
# 4 Oct 2020
# 
#> schedule tick loop

#> player tick
execute in minecraft:overworld as @a run commands player
	execute if entity @s[scores={rx.ec.openChest=1}] run function ./setup
	execute if entity @s[scores={rx.ec.headDrop=1..}] run function ../gui/fix

#> TODO: try slow clock bc PickupDelay?
kill @e[type=item,nbt={Item:{tag:{rx:{ec:{gui:1b}}}}}]

schedule function rx.ec:tick 1t replace
