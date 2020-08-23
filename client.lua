
--deep_hackerjob by Nerea Cassian


ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)


InUse = false
LevelData = {
    [1] = { -- level
        {label = "Hack random credit card", value = "RandomHack", exp = 100, difficulty = 2}, -- label = menu name, value = function name, exp = exp amount earned if succeed
        {label = "Look ID from phone number", value = "GetIdentity", exp = 100, difficulty = 1} -- difficulty must be between 1 and 7 or the script will break
    },
    [2] = {
        {label = "Hack random credit card", value = "RandomHack", exp = 100, difficulty = 2},
        {label = "Look ID from phone number", value = "GetIdentity", exp = 100, difficulty = 1},
        {label = "Disable vehicle engine", value = "EngineBreak", exp = 100, difficulty = 1},
        {label = "Unlock vehicle lock", value = "VehUnlock", exp = 100, difficulty = 2}
    },
    [3] = {
        {label = "Hack random credit card", value = "RandomHack", exp = 100, difficulty = 2},
        {label = "Look ID from phone number", value = "GetIdentity", exp = 100, difficulty = 1},
        {label = "Disable vehicle engine", value = "EngineBreak", exp = 100, difficulty = 1},
        {label = "Unlock vehicle lock", value = "VehUnlock", exp = 100, difficulty = 2},
        {label = "Look active police number", value = "ActivePolice", exp = 100, difficulty = 3},
    },
    [4] = {
        {label = "Hack random credit card", value = "RandomHack", exp = 100, difficulty = 2},
        {label = "Look ID from phone number", value = "GetIdentity", exp = 100, difficulty = 1},
        {label = "Find location from phone number", value = "Location", exp = 100, difficulty = 3},
        {label = "Disable vehicle engine", value = "EngineBreak", exp = 100, difficulty = 1},
        {label = "Unlock vehicle lock", value = "VehUnlock", exp = 100, difficulty = 2},
        {label = "Look active police number", value = "ActivePolice", exp = 100, difficulty = 3},
    },
    [5] = {
        {label = "Hack random credit card", value = "RandomHack", exp = 100, difficulty = 2},
        {label = "Look ID from phone number", value = "GetIdentity", exp = 100, difficulty = 1},
        {label = "Find location from phone number", value = "Location", exp = 100, difficulty = 3},
        {label = "Drop player from radio from phone number", value = "DropWalkie", exp = 100, difficulty = 4},
        {label = "Steal twitter password from username", value = "Twitter", exp = 100, difficulty = 3},
        {label = "Disable vehicle engine", value = "EngineBreak", exp = 100, difficulty = 1},
        {label = "Unlock vehicle lock", value = "VehUnlock", exp = 100, difficulty = 2},
        {label = "Look active police number", value = "ActivePolice", exp = 100, difficulty = 3},
    },
    [6] = {
        {label = "Hack random credit card", value = "RandomHack", exp = 100, difficulty = 2},
        {label = "Look ID from phone number", value = "GetIdentity", exp = 100, difficulty = 1},
        {label = "Find location from phone number", value = "Location", exp = 100, difficulty = 3},
        {label = "Drop player from radio from phone number", value = "DropWalkie", exp = 100, difficulty = 4},
        {label = "Steal account money from phone number", value = "BankRob", exp = 100, difficulty = 4},
        {label = "Steal twitter password from username", value = "Twitter", exp = 100, difficulty = 3},
        {label = "Disable vehicle engine", value = "EngineBreak", exp = 100, difficulty = 1},
        {label = "Unlock vehicle lock", value = "VehUnlock", exp = 100, difficulty = 2},
        {label = "Upgrade engine software", value = "VehUpgrade", exp = 100, difficulty = 3},
        {label = "Look active police number", value = "ActivePolice", exp = 100, difficulty = 3},
    },
    [7] = {
        {label = "Hack random credit card", value = "RandomHack", exp = 100, difficulty = 2},
        {label = "Look ID from phone number", value = "GetIdentity", exp = 100, difficulty = 1},
        {label = "Find location from phone number", value = "Location", exp = 100, difficulty = 3},
        {label = "Drop player from radio from phone number", value = "DropWalkie", exp = 100, difficulty = 4},
        {label = "Steal account money from phone number", value = "BankRob", exp = 100, difficulty = 4},
        {label = "Steal twitter password from username", value = "Twitter", exp = 100, difficulty = 3},
        {label = "Disable vehicle engine", value = "EngineBreak", exp = 100, difficulty = 1},
        {label = "Unlock vehicle lock", value = "VehUnlock", exp = 100, difficulty = 2},
        {label = "Upgrade engine software", value = "VehUpgrade", exp = 100, difficulty = 3},
        {label = "Look active police number", value = "ActivePolice", exp = 100, difficulty = 3},
        {label = "Enable police locations for 10 mins", value = "Wallhack", exp = 100, difficulty = 5},
    },
    [8] = {
        {label = "Hack random credit card", value = "RandomHack", exp = 100, difficulty = 2},
        {label = "Look ID from phone number", value = "GetIdentity", exp = 100, difficulty = 1},
        {label = "Find location from phone number", value = "Location", exp = 100, difficulty = 3},
        {label = "Drop player from radio from phone number", value = "DropWalkie", exp = 100, difficulty = 4},
        {label = "Enter police radio", value = "EnterWalkie", exp = 300, difficulty = 5},
        {label = "Steal account money from phone number", value = "BankRob", exp = 100, difficulty = 4},
        {label = "Steal twitter password from username", value = "Twitter", exp = 100, difficulty = 3},
        {label = "Disable vehicle engine", value = "EngineBreak", exp = 100, difficulty = 1},
        {label = "Unlock vehicle lock", value = "VehUnlock", exp = 100, difficulty = 2},
        {label = "Upgrade engine software", value = "VehUpgrade", exp = 100, difficulty = 3},
        {label = "Look active police number", value = "ActivePolice", exp = 100, difficulty = 3},
        {label = "Enable police locations for 10 mins", value = "Wallhack", exp = 100, difficulty = 5},
    },
}

local blips = {}
local doingit = false

Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    PlayerData = ESX.GetPlayerData()
    while PlayerData == nil do
        Citizen.Wait(100)
    end
    while PlayerData.job == nil do
        Citizen.Wait(100)
    end
    while true do
        if PlayerData.job.name == "hacker" then
            if IsControlJustReleased(0, 167) and not InUse then
                CheckLevel()
            end
        end
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do
        if doingit then
            DisableControl()
            Citizen.Wait(1)
        else
            Citizen.Wait(1000)
        end
    end
end)

function CheckLevel()
    InUse = true
    ESX.TriggerServerCallback("utk_hacker:getPlayerLevel", function(level, exp, todaysHacks)
        OpenHackMenu(level, exp, todaysHacks)
    end)
    InUse = false
end

function OpenHackMenu(level, exp, todaysHacks)
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "hackermenu", {
        title = "Hack Menu Level: "..level.." - Exp: "..exp.." - Remaining Hacks: "..todaysHacks,
        align = "top-left",
        elements = LevelData[level]
    }, function(data, menu)
        local selection = data.current
        --ESX.TriggerServerCallback("utk_hacker:checkItem", function(result) -- required item check
            --if result == true then
                if selection ~= nil then
                    if todaysHacks > 0 then
                        ESX.UI.Menu.CloseAll()
                        _G[selection.value](level, selection.exp, selection.difficulty)
                    else
                        exports["mythic_notify"]:SendAlert("error", "You have reached your daily hack limit!", 5000)
                    end
                end
            --else
               --exports["mythic_notify"]:SendAlert("error", "You don't have the required equipment!", 5000)
            --end
        --end)
    end, function(data, menu)
        menu.close()
    end)
end

function RandomHack(level, exp, diff)
    Mhack = nil
    doingit = true
    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 0)
    Citizen.Wait(2000)
    exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
    Citizen.CreateThreadNow(function()
        while Mhack == nil do
            Citizen.Wait(100)
        end
        if Mhack == true then
            local reward = math.random(LevelConfig[level].minrnd, LevelConfig[level].maxrnd)
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("success", "Success. You stole "..reward.."$", 5000)
            TriggerServerEvent("utk_hacker:giveMoney", reward)
            TriggerServerEvent("utk_hacker:expUpdate", level, exp)
        else
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
        end
    end)
end

function GetIdentity(level, exp, diff)
    Mhack = nil
    doingit = true
    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
    Citizen.Wait(2000)
    exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
    Citizen.CreateThreadNow(function()
        while Mhack == nil do
            Citizen.Wait(100)
        end
        if Mhack == true then
            local number = F_02537("Enter phone number", "", 12)

            if tonumber(number) == nil then
                exports["mythic_notify"]:SendAlert("error", "Invalid format, you need to enter number.", 5000)
                doingit = false
                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                return
            end
            TriggerServerEvent("utk_hacker:phoneNumber", tonumber(number), "kimlik")
            TriggerServerEvent("utk_hacker:expUpdate", level, exp)
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
        else
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
        end
    end)
end

function Location(level, exp, diff)
    Mhack = nil
    doingit = true
    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
    Citizen.Wait(2000)
    exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
    Citizen.CreateThreadNow(function()
        while Mhack == nil do
            Citizen.Wait(100)
        end
        if Mhack == true then
            local number = F_02537("Enter phone number", "", 12)

            if tonumber(number) == nil then
                exports["mythic_notify"]:SendAlert("error", "Invalid format, you need to enter number.", 5000)
                doingit = false
                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                return
            end
            TriggerServerEvent("utk_hacker:phoneNumber", tonumber(number), "lokasyon")
            TriggerServerEvent("utk_hacker:expUpdate", level, exp)
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
        else
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
        end
    end)
end

function DropWalkie(level, exp, diff)
    Mhack = nil
    doingit = true
    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
    Citizen.Wait(2000)
    exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
    Citizen.CreateThreadNow(function()
        while Mhack == nil do
            Citizen.Wait(100)
        end
        if Mhack == true then
            local number = F_02537("Enter phone number", "", 12)

            if tonumber(number) == nil then
                exports["mythic_notify"]:SendAlert("error", "Invalid format, you need to enter number.", 5000)
                doingit = false
                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                return
            end
            TriggerServerEvent("utk_hacker:phoneNumber", tonumber(number), "dropWalkie")
            TriggerServerEvent("utk_hacker:expUpdate", level, exp)
            exports["mythic_notify"]:SendAlert("success", "Person dropped from thier radio channel.", 5000)
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
        else
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
        end
    end)
end

function EnterWalkie(level, exp, diff)
    Mhack = nil
    doingit = true
    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
    Citizen.Wait(2000)
    exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
    Citizen.CreateThreadNow(function()
        while Mhack == nil do
            Citizen.Wait(100)
        end
        if Mhack == true then
            local number = F_02537("Locally [1, 2, 3]", "", 12)

            if tonumber(number) == nil then
                exports["mythic_notify"]:SendAlert("error", "Invalid format, you need to enter number.", 5000)
                doingit = false
                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                return
            end
            if tonumber(number) > 3 or tonumber(number) <= 0 then
                number = 1
            end
            local name = GetPlayerName(PlayerId())
            local channel = exports.tokovoip_script:getPlayerData(name, "radio:channel")

            exports.tokovoip_script:removePlayerFromRadio(channel)
            exports.tokovoip_script:setPlayerData(name, "radio:channel", tonumber(number), true)
            exports.tokovoip_script:addPlayerToRadio(tonumber(number))
            exports["mythic_notify"]:SendAlert("success", "You have joined the police channel.", 5000)
            TriggerServerEvent("utk_hacker:expUpdate", level, exp)
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
        else
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
        end
    end)
end

function BankRob(level, exp, diff)
    Mhack = nil
    doingit = true
    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
    Citizen.Wait(2000)
    exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
    Citizen.CreateThreadNow(function()
        while Mhack == nil do
            Citizen.Wait(100)
        end
        if Mhack == true then
            local number = F_02537("Enter phone number", "", 12)

            if tonumber(number) == nil then
                exports["mythic_notify"]:SendAlert("error", "Invalid format, you need to enter number.", 5000)
                doingit = false
                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                return
            end
            TriggerServerEvent("utk_hacker:phoneNumber", tonumber(number), "bankaSoy")
            TriggerServerEvent("utk_hacker:expUpdate", level, exp)
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
        else
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
        end
    end)
end

function Twitter(level, exp, diff)
    Mhack = nil
    doingit = true
    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
    Citizen.Wait(2000)
    exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
    Citizen.CreateThreadNow(function()
        while Mhack == nil do
            Citizen.Wait(100)
        end
        if Mhack == true then
            local username = F_02537("Enter Twitter username", "", 12)

            if tostring(username) == nil then
                exports["mythic_notify"]:SendAlert("error", "Invalid format.", 5000)
                doingit = false
                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                return
            end
            TriggerServerEvent("utk_hacker:twitter", tostring(username))
            TriggerServerEvent("utk_hacker:expUpdate", level, exp)
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
        else
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
        end
    end)
end

function EngineBreak(level, exp, diff)
    local vehicle = ESX.Game.GetClosestVehicle()

    if vehicle ~= nil then
        if GetDistanceBetweenCoords(GetEntityCoords(vehicle), GetEntityCoords(PlayerPedId()), true) <= 4.0 then
            Mhack = nil
            doingit = true
            local ped = PlayerPedId()

            FreezeEntityPosition(ped, true)
            TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
            Citizen.Wait(2000)
            exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
            TriggerEvent("mhacking:show")
            TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
            Citizen.CreateThreadNow(function()
                while Mhack == nil do
                    Citizen.Wait(100)
                end
                if Mhack == true then
                    SetVehicleEngineHealth(vehicle, 100.0)
                    TriggerServerEvent("utk_hacker:expUpdate", level, exp)
                    exports["mythic_notify"]:SendAlert("success", "Vehicle engine disabled.", 5000)
                    doingit = false
                    ClearPedTasks(ped)
                    FreezeEntityPosition(ped, false)
                else
                    doingit = false
                    ClearPedTasks(ped)
                    FreezeEntityPosition(ped, false)
                    exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
                end
            end)
        else
            exports["mythic_notify"]:SendAlert("error", "No vehicle nearby.", 5000)
        end
    else
        exports["mythic_notify"]:SendAlert("error", "No vehicle nearby.", 5000)
    end
end

function VehUnlock(level, exp, diff)
    local vehicle = ESX.Game.GetClosestVehicle()

    if vehicle ~= nil then
        if GetDistanceBetweenCoords(GetEntityCoords(vehicle), GetEntityCoords(PlayerPedId()), true) <= 4.0 then
            Mhack = nil
            doingit = true
            local ped = PlayerPedId()

            FreezeEntityPosition(ped, true)
            TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
            Citizen.Wait(2000)
            exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
            TriggerEvent("mhacking:show")
            TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
            Citizen.CreateThreadNow(function()
                while Mhack == nil do
                    Citizen.Wait(100)
                end
                if Mhack == true then
                    SetVehicleDoorsLocked(vehicle, 0)
                    TriggerServerEvent("utk_hacker:expUpdate", level, exp)
                    exports["mythic_notify"]:SendAlert("success", "Vehicle unlocked.", 5000)
                    doingit = false
                    ClearPedTasks(ped)
                    FreezeEntityPosition(ped, false)
                else
                    doingit = false
                    ClearPedTasks(ped)
                    FreezeEntityPosition(ped, false)
                    exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
                end
            end)
        else
            exports["mythic_notify"]:SendAlert("error", "No vehicle nearby.", 5000)
        end
    else
        exports["mythic_notify"]:SendAlert("error", "No vehicle nearby.", 5000)
    end
end

function VehUpgrade(level, exp, diff)
    local vehicle = ESX.Game.GetClosestVehicle()

    if vehicle ~= nil then
        if GetDistanceBetweenCoords(GetEntityCoords(vehicle), GetEntityCoords(PlayerPedId()), true) <= 4.0 then
            Mhack = nil
            doingit = true
            local ped = PlayerPedId()

            FreezeEntityPosition(ped, true)
            TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
            Citizen.Wait(2000)
            exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
            TriggerEvent("mhacking:show")
            TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
            Citizen.CreateThreadNow(function()
                while Mhack == nil do
                    Citizen.Wait(100)
                end
                if Mhack == true then
                    local old = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce")
                    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", old + old * (20 / 100))
                    TriggerServerEvent("utk_hacker:expUpdate", level, exp)
                    exports["mythic_notify"]:SendAlert("success", "Vehicle software upgraded.", 5000)
                    doingit = false
                    ClearPedTasks(ped)
                    FreezeEntityPosition(ped, false)
                else
                    doingit = false
                    ClearPedTasks(ped)
                    FreezeEntityPosition(ped, false)
                    exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
                end
            end)
        else
            exports["mythic_notify"]:SendAlert("error", "No vehicle nearby.", 5000)
        end
    else
        exports["mythic_notify"]:SendAlert("error", "No vehicle nearby.", 5000)
    end
end

function ActivePolice(level, exp, diff)
    Mhack = nil
    doingit = true
    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
    Citizen.Wait(2000)
    exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
    Citizen.CreateThreadNow(function()
        while Mhack == nil do
            Citizen.Wait(100)
        end
        if Mhack == true then
            TriggerServerEvent("utk_hacker:policeCoords", 1)
            TriggerServerEvent("utk_hacker:expUpdate", level, exp)
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
        else
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
        end
    end)
end

function Wallhack(level, exp, diff)
    Mhack = nil
    doingit = true
    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", GetEntityCoords(ped), GetEntityHeading(ped), 0, 0, 1)
    Citizen.Wait(2000)
    exports["mythic_notify"]:SendAlert("success", "Find the correct codes!", 4500)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Diff[diff][1], Diff[diff][2], PhoneHacking)
    Citizen.CreateThreadNow(function()
        while Mhack == nil do
            Citizen.Wait(100)
        end
        if Mhack == true then
            TriggerServerEvent("utk_hacker:policeCoords", 2)
            TriggerServerEvent("utk_hacker:expUpdate", level, exp)
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
        else
            doingit = false
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            exports["mythic_notify"]:SendAlert("error", "You failed..", 5000)
        end
    end)
end

function PhoneHacking(output, time)
    TriggerEvent("mhacking:hide")
    Mhack = output
    if output == false then
        if FailDecrease then
            TriggerServerEvent("utk_hacker:lostLife")
        end
        local rnd = math.random(0, 100)

        if rnd <= FailNotify then

            TriggerServerEvent("utk_hacker:sendPolice", GetEntityCoords(PlayerPedId()))
            if InformPlayer then
                exports["mythic_notify"]:SendAlert("error", "Police informed.", 8000)
            end
        end
    elseif output == true then
        local rnd = math.random(0, 100)

        if rnd <= SuccessNotify then

            TriggerServerEvent("utk_hacker:sendPolice", GetEntityCoords(PlayerPedId()))
            if InformPlayer then
                exports["mythic_notify"]:SendAlert("error", "Police informed.", 8000)
            end
        end
    end
end

function F_02537(arg1, arg2, arg3)
    AddTextEntry('FMMC_KEY_TIP1', arg1)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", arg2, "", "", "", arg3)
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		return result
	else
		Citizen.Wait(500)
		return nil
	end
end

function DisableControl() DisableControlAction(0, 73, false) DisableControlAction(0, 24, true) DisableControlAction(0, 257, true) DisableControlAction(0, 25, true) DisableControlAction(0, 263, true) DisableControlAction(0, 32, true) DisableControlAction(0, 34, true) DisableControlAction(0, 31, true) DisableControlAction(0, 30, true) DisableControlAction(0, 45, true) DisableControlAction(0, 22, true) DisableControlAction(0, 44, true) DisableControlAction(0, 37, true) DisableControlAction(0, 23, true) DisableControlAction(0, 288, true) DisableControlAction(0, 289, true) DisableControlAction(0, 170, true) DisableControlAction(0, 167, true) DisableControlAction(0, 73, true) DisableControlAction(2, 199, true) DisableControlAction(0, 47, true) DisableControlAction(0, 264, true) DisableControlAction(0, 257, true) DisableControlAction(0, 140, true) DisableControlAction(0, 141, true) DisableControlAction(0, 142, true) DisableControlAction(0, 143, true) end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent("utk_hacker:ensureJob")
AddEventHandler("utk_hacker:ensureJob", function(name, grade)
    PlayerData.job.name = name
    PlayerData.job.grade = grade
end)

RegisterNetEvent("utk_hacker:phoneNumber")
AddEventHandler("utk_hacker:phoneNumber", function(data)
    if data.method == "notify" then
        exports["mythic_notify"]:SendAlert("success", data.text, 10000)
    elseif data.method == "lokasyon" then
        exports["mythic_notify"]:SendAlert("success", data.text, 10000)
        if data.id ~= nil then
            local index = GetPlayerFromServerId(data.id)
            local target = GetPlayerPed(index)
            local blip = AddBlipForEntity(target)
            SetBlipSprite(blip, 433)
            SetBlipColour(blip, 1)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Target")
            EndTextCommandSetBlipName(blip)
            SetBlipAsShortRange(blip, false)
            Citizen.CreateThreadNow(function()
                Citizen.Wait(300000)
                RemoveBlip(blip)
            end)
        end
    elseif data.method == "dropWalkie" then
        local name = GetPlayerName(PlayerId())
        local channel = exports.tokovoip_script:getPlayerData(name, "radio:channel")

        exports.tokovoip_script:removePlayerFromRadio(channel)
        exports.tokovoip_script:setPlayerData(name, "radio:channel", "nil", true)
    end
end)

RegisterNetEvent("utk_hacker:policeCoords")
AddEventHandler("utk_hacker:policeCoords", function(cops, method)
    if method == 2 then
        for i = 1, #blips, 1 do
            RemoveBlip(blips[i])
        end
        blips = {}
        for i = 1, #cops, 1 do
            local index = GetPlayerFromServerId(cops[i])
            local player = GetPlayerPed(index)
            local blip = AddBlipForEntity(player)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 38)
            SetBlipScale(blip, 0.85)
            SetBlipRotation(blip, math.ceil(GetEntityHeading(player)))
            SetBlipFlashes(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Police")
            EndTextCommandSetBlipName(blip)
            SetBlipAsShortRange(blip, true)

            table.insert(blips, blip)
        end
        Citizen.CreateThreadNow(function()
            exports["mythic_notify"]:SendAlert("success", "Police locations are marked in the map for 10 minutes.", 5000)
            Citizen.Wait(600000)
            for i = 1, #blips, 1 do
                RemoveBlip(blips[i])
            end
            blips = {}
        end)
    elseif method == 1 then
        exports["mythic_notify"]:SendAlert("success", "Active police: "..#cops, 8000)
    end
end)

RegisterNetEvent("utk_hacker:sendPolice")
AddEventHandler("utk_hacker:sendPolice", function(coords)
    local jobname = ESX.GetPlayerData().job.name

    if jobname == "police" then
        exports["mythic_notify"]:SendAlert("error", "There has been a hack in the marked area.", 5000)
        local blip = AddBlipForCoord(coords)
        SetBlipSprite(blip, 161)
        SetBlipScale(blip, 2.0)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Hack İhbarı")
        EndTextCommandSetBlipName(blip)
        PulseBlip(blip)
        if SpamPolice then
            Citizen.CreateThreadNow(function()
                local count = 0
                repeat
                    Citizen.Wait(4500)
                    exports["mythic_notify"]:SendAlert("error", "There has been a hack in the marked area.", 5000)
                    count = count + 1
                until count == 5
                RemoveBlip(blip)
            end)
        else
            Citizen.CreateThreadNow(function()
                Citizen.Wait(15000)
                RemoveBlip(blip)
            end)
        end
    end
end)