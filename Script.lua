
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character.HumanoidRootPart

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()

if LocalPlayer.PlayerGui.MainUI:FindFirstChild("Toggle") then
LocalPlayer.PlayerGui.MainUI.Toggle:Destroy()

local TB = Instance.new("TextButton")
TB.Name = "Toggle"
TB.BackgroundColor3 = Color3.new(1,1,1)
TB.Size = UDim2.new(0.125,0,0.1,0)
TB.Position = UDim2.new(0,0,0.25,0)
TB.Text = "Toggle"
TB.Parent = LocalPlayer.PlayerGui.MainUI
local UICorner = Instance.new("UICorner")
UICorner.Parent = TB

TB.MouseButton1Click:Connect(function()
   Library:ToggleUI()
end)
else
     local TB = Instance.new("TextButton")
TB.Name = "Toggle"
TB.BackgroundColor3 = Color3.new(1,1,1)
TB.Size = UDim2.new(0.125,0,0.1,0)
TB.Position = UDim2.new(0,0,0.25,0)
TB.Text = "Toggle"
TB.Parent = LocalPlayer.PlayerGui.MainUI
local UICorner = Instance.new("UICorner")
UICorner.Parent = TB

TB.MouseButton1Click:Connect(function()
   Library:ToggleUI()
end)
end

local ThemeColor = "GrapeTheme"

local Window = Library.CreateLib("Doors Script", ThemeColor)

local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Main")
local ESPTab = Window:NewTab("ESP")
local ESPSection = ESPTab:NewSection("ESP")
local PlayerTab = Window:NewTab("Player")
local PlayerSection = PlayerTab:NewSection("Player")
