local ReSt = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")

local Matcher = game:GetObjects("rbxassetid://12445945135")[1]
local Entity = Instance.new("Model")
Entity.Name = "Matcher"
Entity.Parent = workspace
Matcher.Parent = Entity
Matcher.Name = "Main"
Matcher.Matcher.PlaybackSpeed = 0.97
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

local function Move(target)
   local dist = (Matcher.Position - target).Magnitude
   local tween = TS:Create(Matcher, TweenInfo.new(dist / 60), {Position = target})
   tween:Play()
   tween.Completed:Wait()
end

local function IsSeeingPlayer(char)
   local origin = Entity:GetPivot().Position
	local charOrigin = char:GetPivot().Position

	if (charOrigin - origin).Magnitude <= 30 then
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Blacklist
		params.FilterDescendantsInstances = {localChar, Matcher}

		local result = workspace:Raycast(origin, charOrigin - origin, params)
		if result then
		    return true
		end
	end
	return false
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
         if not IsSeeingPlayer(char) then
            hum:TakeDamage(100)
            ReSt:WaitForChild("GameStats")["Player_".. player.Name].Total.DeathCause.Value = "Matcher"
            loop:Disconnect()
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

local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

achievementGiver({
    Title = "Fair Match",
    Desc = "Please Go Away.",
    Reason = "Survive Matcher.",
    Image = "rbxassetid://12309073114"
})
