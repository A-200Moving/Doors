local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local PlayerScript = LocalPlayer.PlayerScripts
local StarterPlayer = game.StarterPlayer
local StarterPlayerScript = game.StarterPlayer.StarterPlayerScripts
local StarterCharacterScript= StarterPlayer.StarterCharacterScripts
local StarterGui = game.StarterGui
local ReplicatedStorage = game.ReplicatedStorage
local ReplicatedFirst = game:GetService('ReplicatedFirst')
local Backpack = LocalPlayer.Backpack
local Character = LocalPlayer.Character
local Humanoid = Character.Humanoid
local HumanoidRootPart = Character.HumanoidRootPart
local UserInputService = game:GetService("UserInputService")
local SprintUI = Instance.new("ScreenGui")
local FrameROUNDED = Instance.new("Frame")
local Background = Instance.new("ImageLabel")
local FrameROUNDED_2 = Instance.new("Frame")
local Background_2 = Instance.new("ImageLabel")
local HeavyBreathing = Instance.new("Sound")
getgenv().Energy = 300
getgenv().Breathing = false

SprintUI.Name = "SprintUI"
SprintUI.Parent = PlayerGui
SprintUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

FrameROUNDED.Name = "Frame [ROUNDED]"
FrameROUNDED.Parent = SprintUI
FrameROUNDED.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FrameROUNDED.BackgroundTransparency = 1.000
FrameROUNDED.Position = UDim2.new(0.731942177, 0, 0.931764662, 0)
FrameROUNDED.Size = UDim2.new(0, 300, 0, 20)

Background.Name = "Background"
Background.Parent = FrameROUNDED
Background.BackgroundTransparency = 1.000
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Image = "rbxassetid://3570695787"
Background.ImageColor3 = Color3.fromRGB(185, 127, 104)
Background.ScaleType = Enum.ScaleType.Slice
Background.SliceCenter = Rect.new(100, 100, 100, 100)
Background.SliceScale = 0.120

FrameROUNDED_2.Name = "Frame [ROUNDED]"
FrameROUNDED_2.Parent = FrameROUNDED
FrameROUNDED_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FrameROUNDED_2.BackgroundTransparency = 1.000
FrameROUNDED_2.BorderSizePixel = 7
FrameROUNDED_2.Size = UDim2.new(0, 300, 0, 20)

Background_2.Name = "Background"
Background_2.Parent = FrameROUNDED_2
Background_2.BackgroundTransparency = 1.000
Background_2.BorderSizePixel = 0
Background_2.Size = UDim2.new(0, 300, 1, 0)
Background_2.Image = "rbxassetid://3570695787"
Background_2.ImageColor3 = Color3.fromRGB(255, 201, 179)
Background_2.ScaleType = Enum.ScaleType.Slice
Background_2.SliceCenter = Rect.new(100, 100, 100, 100)
Background_2.SliceScale = 0.120

HeavyBreathing.Parent = Character.Head
HeavyBreathing.SoundId = "rbxassetid://199696655"
HeavyBreathing.Volume = 0.5

local NormalSize = Instance.new("Frame")
local NullSize = Instance.new("Frame")

NormalSize.Parent = Workspace
NormalSize.Size = UDim2.new(0, 300, 1, 0)

NullSize.Parent = Workspace
NullSize.Size = UDim2.new(0, 0, 1, 0)

onButtonHold = function(inputObject,gameProcessed)
   if inputObject.KeyCode == Enum.KeyCode.Q then
		if getgenv().Energy == 0 then
		else
			Humanoid.WalkSpeed = 21
			getgenv().Sprinting = true
			while getgenv().Sprinting == true do wait()
				if getgenv().Energy ~= 0 then
					getgenv().Energy = getgenv().Energy - 2
					Background_2.Size = UDim2.new(0, getgenv().Energy, 1, 0)
				else
					HeavyBreathing:Play()
					Humanoid.WalkSpeed = 7
					getgenv().Breathing = true
					wait(4)
					Humanoid.WalkSpeed = 15
					getgenv().Breathing = false
					HeavyBreathing.Playing = false
					HeavyBreathing.TimePosition = 0
				end
			end
		end
   end
end

onButtonRelease = function(inputObject,gameProcessed)
	if inputObject.KeyCode == Enum.KeyCode.Q then
		if getgenv().Breathing == false then
			Humanoid.WalkSpeed = 15
		end
		getgenv().Sprinting = false
		while getgenv().Sprinting == false do wait()
			if getgenv().Energy ~= 300 and getgenv().Sprinting == false and getgenv().Breathing == false then
				getgenv().Energy = getgenv().Energy + 1
				Background_2.Size = UDim2.new(0, getgenv().Energy, 1, 0)
			else
			end
		end
	end
end


UserInputService.InputBegan:Connect(onButtonHold)
UserInputService.InputEnded:Connect(onButtonRelease)
