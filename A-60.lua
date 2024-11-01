
local TS = game:GetService("TweenService")

local can = true

local Spawned = Instance.new("BoolValue")
Spawned.Name = "A-60"
Spawned.Value = true
Spawned.Parent = workspace

local Model = game:GetObjects("rbxassetid://15482662791")[1]
local entity = Instance.new("Model")
entity.Name = "A-60"
entity.Parent = workspace
Model.Parent = entity
Model.Name = "Main"
for _,v in pairs(Model:GetDescendants()) do
   if v:IsA("Script") then
      v:Destroy()
   end
   if v:IsA("ScreenGui") then
      v:Destroy()
   end
end
Model.Static.EmitterSize = 5
Model.Static.DistortionSoundEffect.Level = 0.85
Model.Static.MaxDistance = 500
Model.CanCollide = false
Model.Anchored = true
local faces = {
   "rbxassetid://192267375",
   "rbxassetid://1972219027",
   "rbxassetid://1822114127",
   "rbxassetid://3354536350",
   "rbxassetid://3413871766",
   "rbxassetid://17865063",
   
}
spawn(function()
   while wait(Random.new():NextNumber(0.1,0.5)) do
       if entity and entity.Parent then
    local face = faces[math.random(1, #faces)]
       Model.A1.ImageLabel.Image = face
       local face2 = faces[math.random(1, #faces)]
       Model.A2.ImageLabel.Image = face2
      else
         break
      end
   end
end)

local function Move(target)
   local dist = (Model.Position - target).Magnitude
   local tween = TS:Create(Model, TweenInfo.new(dist / 140, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = target})
   tween:Play()
   tween.Completed:Wait()
end

local Rooms = {}

local rooms = workspace.CurrentRooms
for _,v in pairs(rooms:GetChildren()) do
   table.insert(Rooms, v)
end

rooms.ChildAdded:Connect(function(v)
    table.insert(Rooms, v)
end)

for _,room in pairs(rooms:GetChildren()) do
   if room:FindFirstChild("Assets") then
          if room.Assets:FindFirstChild("Light_Fixtures") then
              for _,v in pairs(room.Assets:GetDescendants()) do
                  if v.ClassName == "MeshPart" and v.Material == Enum.Material.Neon then
                      TS:Create(v, TweenInfo.new(2.5), {Color = Color3.new(1,0,0)}):Play()
                   end
                  if v.ClassName == "PointLight" then
                      TS:Create(v, TweenInfo.new(2.5), {Color = Color3.new(1,0,0)}):Play()
                 end
                 if v.ClassName == "SpotLight" then
                      TS:Create(v, TweenInfo.new(2.5), {Color = Color3.new(1,0,0)}):Play()
                 end
              end
          end
   end
end

Model.CFrame = Rooms[1].RoomEntrance.CFrame

wait(2)

spawn(function()
   local loop
   loop = game:GetService("RunService").RenderStepped:connect(function()
      if entity and entity.Parent then
         local player = game:GetService("Players").LocalPlayer
      local char = player.Character
      if char then
         local hum = char:FindFirstChild("Humanoid")
         local root = char:FindFirstChild("HumanoidRootPart")
local origin = Model.Position
	local charOrigin = root.Position

	if (charOrigin - origin).Magnitude <= 40 then
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Blacklist
		params.FilterDescendantsInstances = {char, Model}

		local result = workspace:Raycast(origin, charOrigin - origin, params)
		if not result then
        if not char:GetAttribute("Hiding") then
                can = false
		    hum:TakeDamage(100)
            ReSt:WaitForChild("GameStats")["Player_".. player.Name].Total.DeathCause.Value = "A-60"
            loop:Disconnect()
        end
		end
	end
         end
      else
         loop:Disconnect()
      end
   end)
end)

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
TS:Create(Model.Static, TweenInfo.new(1.5), {Volume = 0}):Play()
wait(1.5)
entity:Destroy()

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
    Title = "A LightSpeed Thing",
    Desc = "Remember Me?",
    Reason = "Survive A-60.",
    Image = LoadImage("https://github.com/A-200Moving/Doors/blob/main/A-60secondandthirdface.png?raw=true","a60realfr")
})
end
