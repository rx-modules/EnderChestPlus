# EnderChest+ v1.3 (1.16+ Datapack)

Upgrade your enderchests allowing for almost **infinite** storage!
Quick Preview: ![preview](gifs/enderchest+.gif)

## Features

- An upgradable ender chest requiring materials and becomes increasingly expensive for balance
- A paging system to navigate through your items inside your enderchest
- A EnderChest+ manual which describes the features as an in-game feature
- A neat way to pack/unpack a shulker box full of items easily for travel
- Multiplayer-Compatible (including servers. *spigot/paper will probably not work*)
- Performance optimized to produce nearly 0 lag (see below section)
- Easily compatible with other datapacks unless they touch the enderchest
- **All** data persists on name change

## Usage

First, you must make sure you have the dependency, PlayerDB, installed. **This is a requirement.** You can get the latest release of PlayerDB (v0.7-beta) [here](https://github.com/rx-modules/PlayerDB/releases)!

Then, if you just plop both of these datapacks into your datapacks folder, you should be set!
To start, craft a normal enderchest and plunk it down. You'll notice upon opening, a cool guide book will appear in your chest. You'll also notice some *strange* items on the right-side. These are your **UI** items. Every UI item will display your current page number.

- **Up**: This item allows you to navigate up a page. Shift-clicking will jump to the first page.
- **Upgrade**: This item allows you to upgrade the enderchest. You can place items on here to perform an action (more later)
- **Down**: This item is the same as the up item except you navigate downwards. Shift-clicking will jump to the last page.

In order to upgrade your ender chest, you'll have to highlight the middle item. This item showcases which items you'll need at the very bottom. Once you acquire the neccessary items (most likely diamonds and obsidian), you can place the item **directly** on the item. Any excess will be given back to you. This will add a new page to your ender chest and generate new items you'll need to ugprade to the next page.

You can also place other *special* items on this upgrade item.

- **Book**: Placing a normal book on the item will return the in-game EnderChest+ Manual.
- **Shulker Box**: Placing a shulker box on the item will **swap** the items inside the shulker box with the items currently displayed. Any items which overlap with any UI items will be returned to you.

As you start rising up the page count, you'll notice more and more expensive upgrades. At the later stages, you may notice some oddly named items such as **Dragon's Soul** and **Elder Essence**. These are *custom* items that EnderChest+ adds when you slay the Ender Dragon and the Elder Guardian. You'll need to defeat a boss mob (either one of the above or the Wither) per upgrade.

Note, if you add this to an existing world, your items will not disappear or anything! They'll just plop into your inventory the next time you open your enderchest. You can just place them back in the enderchest, and all will be well!

## Admin

If you wish, you can **reroll** the upgrade items on your or any players screens through the following function:

    function rx.ec:reroll
    # or
    execute as <player> run function rx.ec:reroll

Alongside this, you may want to give yourself the `rx.admin` tag via:

    tag @s add rx.admin

This will output extra output messages that might be useful to you!


## Wizardry

Not quite. This datapack requires a library I recently wrote called PlayerDB. PlayerDB allows for arbitrary nbt storage per player without incurring a large amount of lag. It's a bit complex, but if you are interested, check out the Github page for that project here!

If you are interested in changing the items required for upgrading, I have designed the system to be completely automatic and dynamic. All you have to do is customize a loot table and the upgrade process will adapt! This includes custom items!

	# modify this loot table however you like!
    rx.ec:upgrade

If you are a datapack savvy, you should check out the above loot table and you should be able to figure out how to tweak or customize the upgrade. (Note, make sure to backup this file just incase)


## Other

I do still have future ideas w/ this pack especially for a 2.0 release!

Thanks all! I'm very active on discord, so if you have any questions, hmu @ rx#1284. Let me know if there are any bugs, and I'll try to fix them!
