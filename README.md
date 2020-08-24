# Deep Hacker Job [STANDALONE]

by **Nerea_Cassian**

This is a hacker job, which has level system in it. As you successfuly complete hack you gain exp, and when you reach the level's limit you level up.

Each level has more hack options.

Players must have "hacker" job to access the menu.

## Install

- First, make sure you have mythc_notfiy and mhacking as they are the essential for this to work

- Second, run sql query

- Last, start utk_hacker from server.cfg

## Configuration

- In config.lua file you can set max, min cash steal amounts.

- You can change exp needed to level up for each level specifically.

- In client.lua you can change which hack gives how many exp and how difficult they are to success.

- If you want to add a required item to attemp hack then you should do the fallowing:

In **client.lua** line 134 uncomments relevant lines, it should look like this:

```lua
local selection = data.current
    ESX.TriggerServerCallback("utk_hacker:checkItem", function(result) -- required item check
        if result == true then
            if selection ~= nil then
                if todaysHacks > 0 then
                    ESX.UI.Menu.CloseAll()
                    _G[selection.value](level, selection.exp, selection.difficulty)
                else
                    exports["mythic_notify"]:SendAlert("error", "You have reached your daily hack limit!", 5000)
                end
            end
        else
            exports["mythic_notify"]:SendAlert("error", "You don't have the required equipment!", 5000)
        end
    end)
```

And in **server.lua** line 115 uncomment the whole function and change the item name to the item you want, it should look like this:

```lua
ESX.RegisterServerCallback("utk_hacker:checkItem", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem("phone")

    if item.count >= 1 then
        cb(true)
    else
        cb(false)
    end
end)
```

## Extra Info

This script adds levels as job grades but giving a player grade doesn't work, it has a seperate db table. This was made this way so player can see his/her level in the top right hud. So if you want to give a player level, change the level in hacklevels.

Also check for SQL stuff such as twitter hack or user name. You may have different table structure, and if you do it shouldn't be hard to edit according to your table. If you don't know how to or couldn't get it working contact me, I will gladly help you out.
