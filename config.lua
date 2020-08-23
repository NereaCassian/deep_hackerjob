RewardType = "black_money" -- earning type from random hack ["black_money", "cash", "bank"]
Dailyhack = 50 -- max hack in one day
SuccessNotify = 70 -- police notify chance if the hack success (percent)
FailNotify = 100 -- police notify chance if the hack fails (percent)
SpamPolice = false --spam notify if police gets notify ?
InformPlayer = false -- inform player if the police notified
FailDecrease = true -- remove one hack life if the hack fails ?  (hack life always spent on successful hacks)
BankReward = {
    max = 2000, -- max amount can be stolen from another player's bank account
    min = 1500 -- min amount (if player has money lower than the min amount then what's in the bank will be stolen)
}
LevelConfig = {
    [1] = {
        total = 7000, -- the amount of exp to reach next level
        maxrnd = 100, -- max amount can be stolen with random hack
        minrnd = 50, -- min amount can be stolen with random hack
    },
    [2] = {
        total = 9500,
        maxrnd = 135,
        minrnd = 75,
    },
    [3] = {
        total = 11000,
        maxrnd = 150,
        minrnd = 100,
    },
    [4] = {
        total = 15500,
        maxrnd = 175,
        minrnd = 125,
    },
    [5] = {
        total = 17400,
        maxrnd = 200,
        minrnd = 150,
    },
    [6] = {
        total = 20800,
        maxrnd = 220,
        minrnd = 175,
    },
    [7] = {
        total = 25000,
        maxrnd = 270,
        minrnd = 200,
    },
    [8] = {
        total = 999999, -- no more level up here, but players still can track their gained exp
        maxrnd = 300,
        minrnd = 210,
    },
}

Diff = { -- stuff about difficulty
[1] = {
    [1] = 5,
    [2] = 20
},
[2] = {
    [1] = 5,
    [2] = 20
},
[3] = {
    [1] = 4,
    [2] = 25
},
[4] = {
    [1] = 4,
    [2] = 20
},
[5] = {
    [1] = 3,
    [2] = 15
},
[6] = {
    [1] = 3,
    [2] = 12
},
[7] = {
    [1] = 2,
    [2] = 12
}
}