local ReSt = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")

local can = true

local Spawned = Instance.new("BoolValue")
Spawned.Name = "Matcher"
Spawned.Value = true
Spawned.Parent = workspace

local Module_Events = require(ReSt.ClientModules.Module_Events)

local Matcher = game:GetObjects("rbxassetid://12445945135")[1]
local Entity = Instance.new("Model")
Entity.Name = "Matcher"
Entity.Parent = workspace
Matcher.Parent = Entity
Matcher.Name = "Main"
Matcher.Matcher.PlaybackSpeed = 0.97
Matcher.Matcher.RollOffMaxDistance = 300
Matcher.Size = Vector3.new(5,5,5)
Entity.PrimaryPart = Matcher

local Rooms = {}
for _,v in pairs(workspace.CurrentRooms:GetChildren()) do
   table.insert(Rooms, v)
end

workspace.CurrentRooms.ChildAdded:Connect(function(v)
   if #Rooms > 7 then
      table.remove(Rooms, 1)
   end
   table.insert(Rooms, v)
end)

for _,v in pairs(Rooms) do
   Module_Events.flicker(v, 2)
end

local function Move(target)
   local dist = (Matcher.Position - target).Magnitude
   local tween = TS:Create(Matcher, TweenInfo.new(dist / 60, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = target})
   tween:Play()
   tween.Completed:Wait()
end

spawn(function()
   local loop
   loop = game:GetService("RunService").RenderStepped:connect(function()
      if Matcher and Matcher.Parent then
         local player = game:GetService("Players").LocalPlayer
      local char = player.Character
      if char then
         local hum = char:FindFirstChild("Humanoid")
         local root = char:FindFirstChild("HumanoidRootPart")
local origin = Matcher.Position
	local charOrigin = root.Position

	if (charOrigin - origin).Magnitude <= 35 then
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Blacklist
		params.FilterDescendantsInstances = {char, Matcher}

		local result = workspace:Raycast(origin, charOrigin - origin, params)
		if not result then
        can = false
		    hum:TakeDamage(100)
            ReSt:WaitForChild("GameStats")["Player_".. player.Name].Total.DeathCause.Value = "Matcher"
            loop:Disconnect()
		end
	end
         end
      else
         loop:Disconnect()
      end
   end)
end)

Matcher.CFrame = Rooms[1].RoomEntrance.CFrame
wait(2)
while wait() do
   for index, room in pairs(Rooms) do
      if room and room.Parent then
          Move(room.RoomEntrance.Position)
      end
      if room and room.Parent then
          Move(room.RoomExit.Position)
      end
      if index == #Rooms then
          break
      end
   end
   break
end
TS:Create(Matcher.Matcher, TweenInfo.new(1.5), {Volume = 0}):Play()
wait(1.5)
Entity:Destroy()

Spawned:Destroy()

if can then
   local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/refs/heads/main/Doors/Custom%20Achievements/Source.lua"))()

local function LoadImage(imageSource, imageName)
-- if the imageSource is a GitHub URL (e.g., it starts with "https://")
    local url = imageSource
        if not isfile(imageName..".png") then
            writefile(imageName..".png", game:HttpGet(url))
        end
        return (getcustomasset or getsynasset)(imageName..".png")
end

achievementGiver({
    Title = "Fair Match",
    Desc = "Please Go Away.",
    Reason = "Survive Matcher.",
    Image = LoadImage("https://github.com/A-200Moving/Doors/blob/main/Fair_matcher.png?raw=true","matcherrrr")
})
end
