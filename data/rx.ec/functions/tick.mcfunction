# By: rx97
# 4 Oct 2020
# 
#> #minecraft:tick

execute as @a[scores={rx.ec.openChest=1}] run function rx.ec:setup
execute as @a run function rx.ec:gui
execute as @a[scores={rx.ec.headDrop=1..}] run function rx.ec:gui/fix
kill @e[type=item,nbt={Item:{tag:{rx:{ec:{gui:1b}}}}}]
scoreboard players set @a rx.ec.headDrop 0
