# Deep Hacker Job

by **Uknow and reworked by Nerea_Cassian**

This is a hacker job, which has level system in it. As you successfuly complete hack you gain exp, and when you reach the level's limit you level up.

Each level has more hack options.

Players must have "hacker" job to access the menu.

## Install

- First, make sure you have mythc_notfi mhacking as they are the essential for this to work

- (optional) some hacks require Tokovoip but it isn`t a essential required script

- Second, run sql query

- Last, start deep_hacker from server.cfg

## Configuration

- In config.lua file you can set max, min cash steal amounts.

- You can change exp needed to level up for each level specifically.

- In client.lua you can change which hack gives how many exp and how difficult they are to success.

- If you want to add a required item to attemp hack then you should do the fallowing:

In **client.lua** line 134 uncomments relevant lines, it should look like this:

```lua
local selection = data.current
    ESX.TriggerServerCallback("deep_hacker:checkItem", function(result) -- required item check
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
ESX.RegisterServerCallback("deep_hacker:checkItem", function(source, cb)
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

I basically reworked a broken hacker job script than pass thought my hands I don't know the original code writer because the guy who send it to me renamed the script with his name and it hasn't comments, so all thanks to him because I just corrected the mistakes caused by bad made modifications and made the SQL file. I hope you enjoy it and I will ask any question, Thanks ^^
