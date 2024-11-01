-- Credit to Vynixu for original custom achievement script

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

local moduleScripts = {
    AchievementUnlock = require(playerGui:FindFirstChild("AchievementUnlock", true)),
    Achievements = require(ReplicatedStorage.Achievements)
}

-- Initialize services

local function LoadImage(imageSource, imageName)
-- if the imageSource is a GitHub URL (e.g., it starts with "https://")
    local url = imageSource
        if not isfile(imageName..".png") then
            writefile(imageName..".png", game:HttpGet(url))
        end
        return (getcustomasset or getsynasset)(imageName..".png")
    
end

-- Example usage
local defaultAchievement = {
    Title = "Title",
    Desc = "Description",
    Reason = "Reason",
    -- You can put a GitHub URL or a Roblox asset ID here
    Image = "rbxassetid://12345678"  -- Or use a Roblox ID like "12309073114"
}

-- Main function to set up achievement data
return function(info)
    info = (type(info) == "table") and info or {}
    for i, v in defaultAchievement do
        if info[i] == nil then
            info[i] = v
        end
    end

    -- Call LoadImage function with the image source from info
    LoadImage(info[4], "AchievementImage")
    local stuff = moduleScripts.Achievements.SpecialQATester
    local old = stuff.GetInfo
    stuff.GetInfo = newcclosure(function() return info end)
    moduleScripts.AchievementUnlock(nil, stuff.Name)
    stuff.GetInfo = old
end

