ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

Hackers = {}

UTK = {
    kimlik = function(player, source)
        if player ~= nil then
            local dat = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {["@identifier"] = player.identifier})
            return {text = "Fullname: "..dat[1].firstname.." "..dat[1].lastname.." Job: "..player.job.label.." Grade: "..tostring(player.job.grade_label), method = "notify", source = source}
        elseif player == nil then
            return {text = "Person not in city.", source = source, method = "notify"}
        end
    end,
    lokasyon = function(player, source)
        if player ~= nil then
            return {id = player.source, text = "Persons locations marked in the map for 5 minutes.", method = "lokasyon", source = source}
        elseif player == nil then
            return {text = "Person not in city.", source = source, method = "notify"}
        end
    end,
    dropWalkie = function(player, source)
        return {method = "dropWalkie", source = player.source}
    end,
    bankaSoy = function(player, source)
        if player ~= nil then
            local dat = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {["@identifier"] = player.identifier})
            local xPlayer = ESX.GetPlayerFromId(source)
            local playermoney = player.getAccount("bank").money
            local reward = math.random(BankReward.min, BankReward.max)
            local notf
            if playermoney < BankReward.min then
                notf = playermoney
                player.removeAccountMoney("bank", playermoney)
                xPlayer.addAccountMoney("bank", playermoney)
            else
                if playermoney < reward then
                    notf = BankReward.min
                    player.removeAccountMoney("bank", BankReward.min)
                    xPlayer.addAccountMoney("bank", BankReward.min)
                else
                    notf = reward
                    player.removeAccountMoney("bank", reward)
                    xPlayer.addAccountMoney("bank", reward)
                end
            end
            return {text = "You stole "..notf.."$ from "..dat[1].firstname.." "..dat[1].lastname.."'s bank account.", method = "notify"}
        else
            return {text = "Person not in city.", method = "notify"}
        end
    end
}

MySQL.ready(function() -- gather todays hack left on server restart
    local result = MySQL.Sync.fetchAll("SELECT identifier, job FROM users")

    for i = 1, #result, 1 do
        if result[i].job == "hacker" then
            table.insert(Hackers, {identifier = result[i].identifier, todaysHacks = Dailyhack})
            CheckUser(result[i].identifier)
        end
    end
end)

function CheckUser(identifier)
    local result = MySQL.Sync.fetchAll("SELECT identifier FROM hackerlevels")
    local found = false

    for i = 1, #result, 1 do
        if result[i].identifier == identifier then
            found = true
        end
    end
    if not found then
        MySQL.Async.execute("INSERT INTO hackerlevels (identifier, level, exp) VALUES (@identifier, @level, @exp)", {
            ["@identifier"] = identifier,
            ["@level"] = 1,
            ["@exp"] = 0
        })
    end
end

ESX.RegisterServerCallback("utk_hacker:getPlayerLevel", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local todaysHacks = nil
    local result = MySQL.Sync.fetchAll("SELECT * FROM hackerlevels WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    })
    for i = 1, #Hackers, 1 do
        if Hackers[i].identifier == xPlayer.identifier then
            todaysHacks = Hackers[i].todaysHacks
            break
        end
    end

    if result ~= nil and result[1] ~= nil then
        if todaysHacks ~= nil then
            cb(result[1].level, result[1].exp, todaysHacks)
        else
            table.insert(Hackers, {indentifier = xPlayer.identifier, todaysHacks = Dailyhack})
            cb(result[1].level, result[1].exp, 3)
        end
    else
        MySQL.Async.execute("INSERT INTO hackerlevels (identifier, level, exp) VALUES (@identifier, @level, @exp)", {
            ["@identifier"] = xPlayer.identifier,
            ["@level"] = 1,
            ["@exp"] = 0
        })
        table.insert(Hackers, {indentifier = xPlayer.identifier, todaysHacks = Dailyhack})
        cb(result[1].level, result[1].exp, 3)
    end
end)

--[[ESX.RegisterServerCallback("utk_hacker:checkItem", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem("phone") -- don't forget to change item name!!!

    if item.count >= 1 then
        cb(true)
    else
        cb(false)
    end
end)]]

RegisterServerEvent("utk_hacker:expUpdate")
AddEventHandler("utk_hacker:expUpdate", function(level, exp)
    local xPlayer = ESX.GetPlayerFromId(source)
    local data = MySQL.Sync.fetchAll("SELECT level, exp FROM hackerlevels WHERE identifier = @identifier", {
        ["@identifier"] = xPlayer.identifier
    })
    for i = 1, #Hackers, 1 do
        if Hackers[i].identifier == xPlayer.identifier then
            Hackers[i].todaysHacks = Hackers[i].todaysHacks - 1
            break
        end
    end
    if level < 8 then -- eğer level 8 altıysa kontrol
        if (data[1].exp + exp) >= LevelConfig[level].total then
            MySQL.Async.execute("UPDATE hackerlevels SET level = @level, exp = @exp WHERE identifier = @identifier", {
                ["@identifier"] = xPlayer.identifier,
                ["@level"] = level + 1,
                ["@exp"] = ((data[1].exp + exp) - LevelConfig[level].total)
            })
            xPlayer.setJob("hacker", level + 1)
            TriggerClientEvent("utk_hacker:ensureJob", xPlayer.source, "hacker", level + 1)
            TriggerClientEvent("mythic_notify:client:SendAlert", xPlayer.source, {type = "success", text = "Level up! "..(level+1), lenght = 6000})
        else
            MySQL.Async.execute("UPDATE hackerlevels SET exp = @exp WHERE identifier = @identifier", {
                ["@identifier"] = xPlayer.identifier,
                ["@exp"] = data[1].exp + exp
            })
        end
    else
        MySQL.Async.execute("UPDATE hackerlevels SET exp = @exp WHERE identifier = @identifier", {
            ["@identifier"] = xPlayer.identifier,
            ["@exp"] = data[1].exp + exp
        })
    end
end)

RegisterServerEvent("utk_hacker:lostLife")
AddEventHandler("utk_hacker:lostLife", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    for i = 1, #Hackers, 1 do
        if Hackers[i].identifier == xPlayer.identifier then
            Hackers[i].todaysHacks = Hackers[i].todaysHacks - 1
        end
    end
end)

RegisterServerEvent("utk_hacker:giveMoney")
AddEventHandler("utk_hacker:giveMoney", function(reward)
    local xPlayer = ESX.GetPlayerFromId(source)

    if RewardType == "black_money" or RewardType == "bank" then
        xPlayer.addAccountMoney(RewardType, reward)
    else
        xPlayer.addMoney(reward)
    end
end)

RegisterServerEvent("utk_hacker:phoneNumber")
AddEventHandler("utk_hacker:phoneNumber", function(number, func)
    local _source = source
    local result = MySQL.Sync.fetchAll("SELECT identifier FROM users WHERE phone_number = @number", {
        ["@number"] = number
    })

    if result ~= nil then
        local target = ESX.GetPlayerFromIdentifier(result[1].identifier)
        local callback = UTK[func](target, _source)

        TriggerClientEvent("utk_hacker:phoneNumber", callback.source, callback)
    end
end)

RegisterServerEvent("utk_hacker:twitter")
AddEventHandler("utk_hacker:twitter", function(username)
    local _source = source
    local result = MySQL.Sync.fetchAll("SELECT password FROM twitter_accounts WHERE username = @username", {
        ["@username"] = username
    })

    if result ~= nil then
        if result[1] ~= nil then
            TriggerClientEvent("mythic_notify:client:SendAlert", _source, {type = "success", text = "Username: "..username.." - Password: "..result[1].password, lenght = 10000})
        end
    end
end)

RegisterServerEvent("utk_hacker:policeCoords")
AddEventHandler("utk_hacker:policeCoords", function(method)
    local _source = source
    local cops = {}
    local players = ESX.GetPlayers()

    for i = 1, #players, 1 do
        local temp = ESX.GetPlayerFromId(players[i])

        if temp.job.name == "police" then
            table.insert(cops, temp.source)
        end
    end
    TriggerClientEvent("utk_hacker:policeCoords", _source, cops, method)
end)

RegisterServerEvent("utk_hacker:sendPolice")
AddEventHandler("utk_hacker:sendPolice", function(coords)
    TriggerClientEvent("utk_hacker:sendPolice", -1, coords)
end)