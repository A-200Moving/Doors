local HardCore = {
    Title = "Hardcore Mode", -- Made by MuhammadGames and Volta
    Desc = "Play Hardcore mode.",
    Reason = "Have Fun!",
    Image = "https://tr.rbxcdn.com/2ed9415e2720e979aeb59c7c0a9e3afb/150/150/Image/Png",
    id = 1,
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------






-- loadstring(game:HttpGet("https://raw.githubusercontent.com/MuhXd/DoorSuff/main/Whitelist/NewKeySystem.lua"))()



caa = 0
tween = game:GetService("TweenService")
local TestMultplayer = true
if game:GetService("ReplicatedStorage"):FindFirstChild("Extacuted") then
    warn("You have Already Loaded")

    return false
end
local Test = Instance.new("Part")
Test.Name = "Extacuted"
Test.Parent = game:GetService("ReplicatedStorage")
Test = 1

loadstring(game:HttpGet("https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/Sprint"))()

local SelfModules = {
    Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))(),
}






------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------







local ModName = "HardCore"
local foldername = "AchievementsSaves   By Muhammadgames,Helped by RegularVynixu"
local Slipt = string.split(foldername,"|")
local valid2 = isfolder(foldername)
if not valid2 then
    makefolder(foldername)
end

local fileName = ModName.."Save's.txt"
local filePath = foldername.. "/".. fileName
local valid = isfile(filePath)

local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/MuhXd/Models/main/RegularVynixu's%20Achievement%20Modifyer"))()

function AchievementsGet(Achievement)
    local read = readfile(filePath)  
    local read2 = tostring(read)
    local read2 = string.split(read,"|")
    FOUND = false
    Find = ""
    for i,v in pairs(Achievement) do
        if i == "id" then
            Find=Find.." "..v
        end
    end

    for i,v in pairs(read2) do
        if v == Find then
            FOUND = true
        end
    end -- Desc
    if FOUND == false then
        Achievements.Get(Achievement)
        Write = ""
        for i,v in pairs(Achievement) do
            if i == "id" then
                Write=Write.." "..v
            end
        end
        appendfile(filePath,Write.."|")
    end
end
-- Creates and displays your custom achievement
-- readfile(<string> path)  
if not valid then
    writefile(filePath, "Helped by RegularVynixu|")
end

AchievementsGet(HardCore)
--[[
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------ 
Start of real Code!
DON'T SHOW ABOVE!
.............     .       .
.     .     .     .       . 
.     .     .     .       .
.     .     .     .       . 
.     .     .     .       . 
.     .     .     .       . 
.     .     .     .       .
.     .     .     .........
--]]












if game:GetService("ReplicatedStorage"):FindFirstChild("Guis") then

else
    Visable = Instance.new("Folder")
    Visable.Name = "Guis"
    Visable.Parent = game.ReplicatedStorage

end
function Gui(Name,Amount1,TextSent)
    if game:GetService("Players").localPlayer.PlayerGui.MainUI.Statistics.Frame:FindFirstChild("!"..Name.."!") then
        game:GetService("Players").localPlayer.PlayerGui.MainUI.Statistics.Frame["!"..Name.."!"]:Destroy()
    end

    Visable = Instance.new("BoolValue")
    Visable.Value = true
    Visable.Name = Name
    Visable.Parent = game.ReplicatedStorage.Guis

    game.Players.localPlayer.PlayerGui.MainUI.Statistics.LocksOpened.Visible = true
    LocksOpened = game.Players.localPlayer.PlayerGui.MainUI.Statistics.LocksOpened:Clone()
    game.Players.localPlayer.PlayerGui.MainUI.Statistics.LocksOpened.Visible = false
    LocksOpened.Parent = game.Players.localPlayer.PlayerGui.MainUI.Statistics.Frame

    LocksOpened.Visible = game.ReplicatedStorage.Guis:FindFirstChild(Name).Value

    local Grad = game.Players.localPlayer.PlayerGui.MainUI.Statistics.Frame["Leftover Gold"].UICorner:Clone()
    Grad.Parent = LocksOpened
    Grad = game.Players.localPlayer.PlayerGui.MainUI.Statistics.Frame["Leftover Gold"].UIGradient:Clone()
    Grad.Parent = LocksOpened
    Grad = game.Players.localPlayer.PlayerGui.MainUI.Statistics.Frame["Leftover Gold"].Amount:Clone()
    Grad.Parent = LocksOpened
    Grad.Text = Amount1
    Grad.Position = Grad.Position - UDim2.new(0.035,0,0,0)
    Grad = game.Players.localPlayer.PlayerGui.MainUI.Statistics.Frame["Leftover Gold"].Icon:Clone()
    Grad.Parent = LocksOpened
    Grad.Position = Grad.Position - UDim2.new(0.035,0,0,0)

    LocksOpened.CloseButton.Position = LocksOpened.CloseButton.Position - UDim2.new(0.021,0,0,0)
    LocksOpened.CloseButton.ImageColor3 =  Color3.new(0.0313725, 0.854902, 1)
    LocksOpened.TextColor3 = Color3.new(0.0313725, 0.854902, 1)
    LocksOpened.TextScaled = false
    LocksOpened.Name = "!"..Name.."!"
    LocksOpened.TextSize = game.Players.localPlayer.PlayerGui.MainUI.Statistics.Frame["Leftover Gold"].TextSize + 16
    LocksOpened.Size = LocksOpened.Parent["Leftover Gold"].Size
    LocksOpened.BackgroundColor3 = Color3.new(0.0196078, 0.552941, 0.647059)
    LocksOpened.BackgroundTransparency = 0.5

    LocksOpened.Text = TextSent



    game.ReplicatedStorage.Guis:FindFirstChild(Name).changed:connect(function()

        LocksOpened.Visible = game.ReplicatedStorage.Guis:FindFirstChild(Name).Value
    end)
end







local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()


-- Run the created entity
local Message = function(Message,Enable,N)
    local msg = Instance.new("Message")  
    msg.Parent = game.Workspace     
    msg.Text = Message
    if Enable ~= true then
        task.wait(0.1)
        msg:Destroy()
    end
end

-- Message("Thank you For Loading MultplayerBeta 1.2")

for ii,vv in pairs(game:GetService("Players"):GetChildren()) do
    PlayersIngame = ii
end -- Gets All Players
if TestMultplayer == true then
    PlayersIngame = 1000 -- TestMultplayer
end

if PlayersIngame > 1 then -- if more then one then waits for link
    if game:GetService("ReplicatedStorage").GameData.LatestRoom.Value > 0 then
        print("Loaded After door 1! Please wait for everyone to die")
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "Load Before Door 1",
            Color = Color3.fromRGB(255, 0, 0),
            Font = Enum.Font.SourceSansBold,
            TextSize = 18,
        })

        firesignal(game.ReplicatedStorage.Bricks.DeathHint.OnClientEvent, {"You didn't Load it Before Door 1!","Please Wait for the next round"})
        game.ReplicatedStorage.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Not Loading Before Door 1"
        game.Players.LocalPlayer.Character.Humanoid.Health = -100
        return false
    end


    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Doors Hardcore Mode By C87FM (C87FM#0689) Credit to MuhammadGames (MuhammadGames#0017) For Sprint Script.",
        Color = Color3.fromRGB(255, 255, 0),
        Font = Enum.Font.SourceSansBold,
        TextSize = 18,
    })

    Gui("HardcoreMode","+500","Hardcore Mode")

    print("Loaded, Wating to Link to Multplayer") -- waiting to link
    c=1

    repeat task.wait()

        if c < 10 then
            -- Message("MultplayerV1.2B",true,"Welcome")
            c=10
        end
        --  msg:Destroy()
        --Kill=true
    until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value > 0
    print("Linked to Clients") -- linked
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Hardcore Mode ON Have Fun!",
        Color = Color3.fromRGB(0, 255, 0),
        Font = Enum.Font.SourceSansBold,
        TextSize = 18,
    })



    Singleplayer = false -- Runs more Then 1 Player Code
else
    print("Loaded in Singleplayer") -- loaded in 1 player
    repeat task.wait()

    until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value > 0
    print("Started")
    Singleplayer = true -- Runs One player Code
end
Testa = 10
getgenv().death = false
Be=false
Many=1
JobId = game:GetService("ReplicatedStorage").GameData.GameStarted.Value
Lowest = string.len(game:GetService("ReplicatedStorage").GameData.GameStarted.Value)
Lowest = tonumber(Lowest)
Stop=Lowest
RanWait2=""
function Depth()
    while true do task.wait()
    pcall(function()
        Be=true

        wait(30)
        wait(10)
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

        -- Create entity
        if  game.ReplicatedStorage.GameData.LatestRoom.Value ~= 50 then
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        else
            Wait(10)
            end
        local Depth = Creator.createEntity({
            CustomName = "A-60", -- Custom name of your entity
            Model = "rbxassetid://12278407049", -- Can be GitHub file or rbxassetid
            Speed = 600, -- Percentage, 100 = default Rush speed
            DelayTime = 5,
            KillRange=100,-- Time before starting cycles (seconds)
            HeightOffset = 1,
            CanKill = true,
            BreakLights = true,
            FlickerLights = {
                true, -- Enabled
                3, -- Time (seconds)
            },
            Cycles = {
                Min = 3,
                Max = 5,
                WaitTime = 1.5,
            },
            CamShake = {
                true, -- Enabled
                {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                true, -- Enabled ('false' if you don't want jumpscare)
                {
                    Image1 = "rbxassetid://11287256498", -- Image1 url
                    Image2 = "rbxassetid://11287256498", -- Image2 url
                    Shake = false,
                    Sound1 = {
                        10483790459, -- SoundId
                        { Volume = 5 }, -- Sound properties
                    },
                    Sound2 = {
                        10483837590, -- SoundId
                        { Volume = 5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled
                        Color3.fromRGB(255, 0, 0), -- Color
                    },
                    Tease = {
                        false, -- Enabled ('false' if you don't want tease)
                        Min = 1,
                        Max = 5,
                    },
                },
            },
            CustomDialog = {"You died to who you call A-60.", "A-60 is faster than Rush and Ambush", "Hide when you see light flicker."}, -- Custom death message (can be as long as you want)
        })
            ------------------------

            -- Run the created entity
            Creator.runEntity(Depth)
                            end)
        end


end

    function VhsSansSpawn()
        while true do wait(150)
            pcall(function()
                local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

                -- Create entity
                game.workspace.Ambience_Ambush:Play()
                game.workspace.Ambience_Ambush.Volume = "5"
                local entity2 = Creator.createEntity({
                    CustomName = "Ambush", -- Custom name of your entity
                    Model = "rbxassetid://12295221435", -- Can be GitHub file or rbxassetid
                    Speed = 600, -- Percentage, 100 = default Rush speed
                    DelayTime = 4, -- Time before starting cycles (seconds)
                    HeightOffset = 0,
                    CanKill = true,
                    KillRange = 120,
                    BreakLights = true,
                    BackwardsMovement = false,
                    FlickerLights = {
                        true, -- Enabled/Disabled
                        3, -- Time (seconds)
                    },
                    Cycles = {
                        Min = 3,
                        Max = 5,
                        WaitTime = 1,
                    },
                    CamShake = {
                        true, -- Enabled/Disabled
                        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
                        100, -- Shake start distance (from Entity to you)
                    },
                    Jumpscare = {
                        true, -- Enabled/Disabled
                        {
                            Image1 = "rbxassetid://1000000000", -- Image1 url
                            Image2 = "rbxassetid://1000000000", -- Image2 url
                            Shake = true,
                            Sound1 = {
                                10483790459, -- SoundId
                                { Volume = 0.5 }, -- Sound properties
                            },
                            Sound2 = {
                                7441118570, -- SoundId
                                { Volume = 5 }, -- Sound properties
                            },
                            Flashing = {
                                true, -- Enabled/Disabled
                                Color3.fromRGB(255, 0, 0), -- Color
                            },
                            Tease = {
                                false, -- Enabled/Disabled
                                Min = 1,
                                Max = 1,
                            },
                        },
                    },
                    CustomDialog = {"You died to Old Ambush.", "When it near light will flicker.", "Try to hide when you hear his arrival."}, -- Custom death message
                })

                ------------------------
                Creator.runEntity(entity2)
                -- Run the created entity
            end)
        end
    end

    local function ZoO()
        repeat
            task.wait()
        until game.Workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value].Assets:FindFirstChild("Wardrobe")
        -- tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(1), {Contrast = 0.45}):Play()
        local ZoO = Creator.createEntity({
            CustomName = "200", -- Custom name of your entity
            Model = "https://github.com/Isth4t/DoorsModels/blob/main/200Moving.rbxm?raw=true", -- Can be GitHub file or rbxassetid
            Speed = 700, -- Percentage, 100 = default Rush speed
            DelayTime = 10, -- Time before starting cycles (seconds)
            KillRange=20,
            HeightOffset = 0,
            CanKill = true,
            BreakLights = true,
            BackwardsMovement = true,
            FlickerLights = {
                true, -- Enabled
                5, -- Time (seconds)
            },
            Cycles = {
                Min = 4,
                Max = 4,
                WaitTime = 2,
            },
            CamShake = {
                true, -- Enabled
                {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                true, -- Enabled ('false' if you don't want jumpscare)
                {
                    Image1 = "rbxassetid://11400868582", -- Image1 url
                    Image2 = "rbxassetid://11400871105", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        530591527, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        530591527, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled
                        Color3.fromRGB(255, 255, 255), -- Color
                    },
                    Tease = {
                        false, -- Enabled ('false' if you don't want tease)
                        Min = 1,
                        Max = 3,
                    },
                },
            },
            CustomDialog = {"You died to 200.", "It's very fast.", "Hide when you hear it!"}, -- Custom death message (can be as long as you want)
        })
        Creator.runEntity(ZoO)
    end




    function Baller()
        wait(500)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()  
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

        local Baller = Creator.createEntity({
            CustomName = "Matcher", -- Custom name of your entity
            Model = "rbxassetid://12295347231",
            KillRange = 200,
            Speed = 70, -- Percentage, 100 = default Rush speed
            DelayTime = 0, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = true,
            BreakLights = false,
            FlickerLights = {
                true, -- Enabled
                1, -- Time (seconds)
            },
            Cycles = {
                Min = 1,
                Max = 1,
                WaitTime = 3,
            },
            CamShake = {
                true, -- Enabled
                {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
                1, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                false, -- Enabled ('false' if you don't want jumpscare)
                {
                    Image1 = "rbxassetid://12147683778", -- Image1 url
                    Image2 = "rbxassetid://12147683778", -- Image2 url
                    Shake = false,
                    Sound1 = { 
                        11400679305, -- SoundId
                        { Volume = 1 }, -- Sound properties
                    },
                    Sound2 = {
                        10483837590, -- SoundId
                        { Volume = 5 }, -- Sound properties
                    },
                    Flashing = {
                        false, -- Enabled
                        Color3.fromRGB(250, 0, 0), -- Color
                    },
                    Tease = {
                        false, -- Enabled ('false' if you don't want tease)
                        Min = 1,
                        Max = 1,
                    },
                },
            },
            CustomDialog = {"You have been kill by Matcher.", "Running will not help, try hiding when you know its near.", "Pay attention for cue that hint its arrival."}, -- Custom death message
        })

        ------------------------

        -- Run the created entity
        Creator.runEntity(Baller)

    end

    caa2=10

    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
        getgenv().death = true
    end)
    workspace.ChildAdded:Connect(function(inst)
        wait(1)
        if inst.Name == "RushMoving" then
            BoolValue = Instance.new("BoolValue")
            BoolValue.Name = "Nightmare"
            BoolValue.Parent = inst
            inst.RushNew.Attachment.ParticleEmitter.Texture = "http://www.roblox.com/asset/?id=10888024887"
            inst.RushNew.Attachment.ParticleEmitter.Brightness = 10
            repeat task.wait()

            until not inst:FindFirstChild("RushNew")

            if getgenv().death == false then


                AchievementsGet(NightmareRush)

            end
            a =game:GetService("ReplicatedStorage").GameData.LatestRoom.Value-1
            b=a+5
            repeat  task.wait()

            until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value >= b
    local BallerPas = coroutine.wrap(Baller)
            BallerPas()

        elseif inst.name == "AmbushMoving" then
            BoolValue = Instance.new("BoolValue")
            BoolValue.Name = "Nightmare"
            BoolValue.Parent = inst
            inst.RushNew.Attachment.ParticleEmitter.Texture = "https://create.roblox.com/marketplace/asset/10826375579/Nightmare-ambush-png-doors"
            inst.RushNew.Attachment.ParticleEmitter.Brightness = 10
            repeat task.wait()

            until not inst:FindFirstChild("RushNew")

            if getgenv().death == false then
                AchievementsGet(NightmareAmbush)
            end
            a =game:GetService("ReplicatedStorage").GameData.LatestRoom.Value-1
            b=a+2
            repeat  task.wait()

            until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value >= b
            ZoO()
            BallerPas()

        end
    end)


    i1=3 
    i2=5
    i3=2















    Be=false
    function TraumaSpawn()
        while true do 
        
            wait(80)
            local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

            -- Create entity
            if  game.ReplicatedStorage.GameData.LatestRoom.Value ~= 50 then
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        else
            Wait(150)
            end
            local Trauma = Creator.createEntity({
                CustomName = "Terror", -- Custom name of your entity
                Model = "rbxassetid://12278723166", -- Can be GitHub file or rbxassetid
                Speed = 250, -- Percentage, 100 = default Rush speed
                DelayTime = 5,
            KillRange = 80,-- Time before starting cycles (seconds)
            HeightOffset = 1,
            CanKill = true,
            BreakLights = true,
                BackwardsMovement = false,
                FlickerLights = {
                    true, -- Enabled/Disabled
                    5, -- Time (seconds)
                },
                Cycles = {
                    Min = 1,
                    Max = 2,
                    WaitTime = 2,
                },
                CamShake = {
                    true, -- Enabled/Disabled
                    {5.5, 50, 0.5, 2}, -- Shake values (don't change if you don't know)
                    100, -- Shake start distance (from Entity to you)
                },
                Jumpscare = {
                    true, -- Enabled/Disabled
                    {
                        Image1 = "rbxassetid://1000000000", -- Image1 url
                        Image2 = "rbxassetid://1000000000", -- Image2 url
                        Shake = true,
                        Sound1 = {
                            10483790459, -- SoundId
                            { Volume = 0 }, -- Sound properties
                        },
                        Sound2 = {
                            10483837590, -- SoundId
                            { Volume = 5 }, -- Sound properties
                        },
                        Flashing = {
                            true, -- Enabled/Disabled
                            Color3.fromRGB(255, 0, 0), -- Color
                        },
                        Tease = {
                            false, -- Enabled/Disabled
                            Min = 1,
                            Max = 3,
                        },
                    },
                },
                CustomDialog = {"You died to Terror...", "Use what you have learned from Rush and Ambush!"}, -- Custom death message
            })

            -----[[ Advanced ]]-----
            ------------------------

            -- Run the created entity
            Creator.runEntity(Trauma)
        end
    end


























pcall(function()
local DepthPas = coroutine.wrap(Depth)
DepthPas()
end)
pcall(function()
    local TraumaPas = coroutine.wrap(TraumaSpawn)   
    TraumaPas()
end)
pcall(function()
local VhsSansPas = coroutine.wrap(VhsSansSpawn)
VhsSansPas()
end)
pcall(function()
local BallerPas = coroutine.wrap(Baller)
BallerPas()
end)
