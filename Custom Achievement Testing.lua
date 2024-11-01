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

local function GetGitHubImage(GitHubUrl, imageName)
    local url = GitHubUrl
    if not isfile(imageName..".png") then
        writefile(imageName..".png", game:HttpGet(url))
    end
    return (getcustomasset or getsynasset)(imageName..".png")
end

local defaultAchievement = {
    Title = "Title",
    Desc = "Description",
    Reason = "Reason",
    Image = GetGitHubImage("","idk")
}

-- Main
return function(info)
    info = (type(info) == "table") and info or {}
    for i, v in defaultAchievement do
        if info[i] == nil then
            info[i] = v
        end
    end
    local stuff = moduleScripts.Achievements.SpecialQATester
    local old = stuff.GetInfo
    stuff.GetInfo = newcclosure(function() return info end)
    moduleScripts.AchievementUnlock(nil, stuff.Name)
    stuff.GetInfo = old
end
