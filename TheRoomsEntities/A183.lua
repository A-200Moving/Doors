local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
-- Create entity
local entityTable = Spawner.createEntity({
    CustomName = "A-183", -- Custom name of your entity
    Model = "rbxassetid://12584249919", -- Can be GitHub file or rbxassetid
    Speed = 3000, -- Percentage, 100 = default Rush speed
    DelayTime = 5, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    KillRange = 50,
    BackwardsMovement = false,
    BreakLights = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        2, -- Time (seconds)
    },
    Cycles = {
        Min = 10,
        Max = 16,
        WaitTime = 0,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {2.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://11710147805", -- Image1 url
            Image2 = "rbxassetid://11822114518", -- Image2 url
            Shake = true,
            Sound1 = {
                4903742660, -- SoundId
                { Volume = 10 }, -- Sound properties
            },
            Sound2 = {
                3537873683, -- SoundId
                { Volume = 0 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(241, 191, 53,), -- Color
            },
            Tease = {
                false, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, {"Oh... Hello.","How did I come here?", "Anyways, what'd you die to?", "Oh. That one...", "I'll let you know that is A-183.","It can come any doors.","A-183 is very fast.","Find a Hiding spot and wait it despawned, it will rebound in current room"}, "Yellow")
})


-----[[  Debug -=- Advanced  ]]-----
entityTable.Debug.OnEntitySpawned = function()
    print("Entity has spawned:", entityTable)
end

entityTable.Debug.OnEntityDespawned = function()
    print("Entity has despawned:", entityTable)
end

entityTable.Debug.OnEntityStartMoving = function()
    print("Entity has start moving:", entityTable)
end

entityTable.Debug.OnEntityFinishedRebound = function()
    print("Entity has finished rebound:", entityTable)
end

entityTable.Debug.OnEntityEnteredRoom = function(room)
    print("Entity:", entityTable, "has entered room:", room)
end

entityTable.Debug.OnLookAtEntity = function()
    print("Player has looked at entity:", entityTable)
end

entityTable.Debug.OnDeath = function()
    warn("Player has died.")
end
------------------------------------


-- Run the created entity
Spawner.runEntity(entityTable)
