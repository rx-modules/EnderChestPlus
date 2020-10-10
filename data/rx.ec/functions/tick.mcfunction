# By: rx97
# 4 Oct 2020
# 
#> schedule tick loop

#> player tick
execute as @a run function rx.ec:player

#> kill thrown GUI items
kill @e[type=item,nbt={Item:{tag:{rx:{ec:{gui:1b}}}}}]

schedule function rx.ec:tick 1t replace
