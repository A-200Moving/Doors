
local ReSt = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")

local can = true

local Spawned = Instance.new("BoolValue")
Spawned.Name = "Rebound"
Spawned.Value = true
Spawned.Parent = workspace

local RoomsFolder = workspace:WaitForChild("CurrentRooms")
local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) 
game.Debris:AddItem(Reboundcolor,24)
				Reboundcolor.Name = "Warn"
				Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
				local tw2 = TS:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0})
local TW = TS:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
tw2:Play()
tw2.Completed:Connect(function()
	Reboundcolor:Destroy()
end)
local Rooms = {}
for _,v in pairs(RoomsFolder:GetChildren()) do
   table.insert(Rooms, v)
end

RoomsFolder.ChildAdded:Connect(function(v)
   if #Rooms > 7 then
      table.remove(Rooms, 1)
   end
   table.insert(Rooms, v)
end)

local Model = game:GetObjects("rbxassetid://12847597717")[1]
Model.Parent = workspace
local Main = Model.RushNew
Main.Name = "Main"
Model.PrimaryPart = Main
Model.Rebound_Cue.Playing = false
for _,v in pairs(Main:GetChildren()) do
   if v.Name ~= "Attachment" then
      v:Destroy()
   end
end
Main.Attachment:FindFirstChild("Smoke").Name = "Particle"
for _,v in pairs(Main.Attachment:GetChildren()) do
   if v.Name == "Smoke" then
      v:Destroy()
   end
end
local sound = Model.Rebound_Cue:Clone()
sound.Name = "Rebound_Cue2"
sound.SoundId = "rbxassetid://9114397505"
sound.Volume = 0.1
sound.Parent = Model
local distort = Instance.new("DistortionSoundEffect")
distort.Level = 1
distort.Parent = sound
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Level = 1
distort2.Parent = sound
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = sound
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = sound
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = sound
pitch3.Octave = 0.5
sound:Play()
Model.Rebound_Cue:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,3,0.1,6,2,0.5)

function GetGitSound(GithubSnd,SoundName)
	local url=GithubSnd
	if not isfile(SoundName..".mp3") then
		writefile(SoundName..".mp3", game:HttpGet(url))
	end
	local sound=Instance.new("Sound")
	sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
	return sound
end
local function Move(target, part)
   local dist = (part.Position - target).Magnitude
   local tween = TS:Create(part, TweenInfo.new(dist / 60), {Position = target})
   tween:Play()
   tween.Completed:Wait()
end
wait(4)
Model.Rebound_Cue.TimePosition = 0.4
Model.Rebound_Cue:Play()
Main.CFrame = Rooms[#Rooms].RoomExit.CFrame
wait(0.5)
local move = GetGitSound("https://github.com/A-200Moving/Doors/blob/main/DoomBegin%20(1).mp3?raw=true","Reboun")
    move.Parent = Main
    move.Name = "Ambience"
    move.Volume = 0.25
    move.Looped = true
local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.75
    distort.Parent = move
	move.RollOffMaxDistance = 300
	move.RollOffMinDistance = 50
    local tree = Instance.new("TremoloSoundEffect")
    tree.Depth = 1
    tree.Duty = 1
    tree.Frequency = 5
    tree.Parent = move
    local eq = Instance.new("EqualizerSoundEffect")
    eq.HighGain = -60
    eq.MidGain = 10
    eq.LowGain = 10
    eq.Parent = move
    move:Play()
wait(2.5)
	spawn(function()
   local loop
   loop = game:GetService("RunService").RenderStepped:connect(function()
      if Model and Model.Parent then
         local player = game:GetService("Players").LocalPlayer
      local char = player.Character
      if char then
         local hum = char:FindFirstChild("Humanoid")
         local root = char:FindFirstChild("HumanoidRootPart")
local origin = Main.Position
	local charOrigin = root.Position

	if (charOrigin - origin).Magnitude <= 40 then
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Blacklist
		params.FilterDescendantsInstances = {char, Main}

		local result = workspace:Raycast(origin, charOrigin - origin, params)
		if not result then
		        if not char:GetAttribute("Hiding") then
			        can = false
		    hum:TakeDamage(100)
            ReSt:WaitForChild("GameStats")["Player_".. player.Name].Total.DeathCause.Value = "Rebound"
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
for i=#Rooms, 1, -1 do
   local room = Rooms[i]
   if room and room.Parent then
       if room:FindFirstChild("RoomExit") then
           Move(room.RoomExit.Position, Main)
       end
   end
   if room and room.Parent then
       if room:FindFirstChild("RoomEntrance") then
           Move(room.RoomEntrance.Position, Main)
       end
   end
end
TS:Create(move, TweenInfo.new(1), {Volume = 0}):Play()
wait(1)
Model:Destroy()

for i=1, math.random(3,5) do
   RoomsFolder.ChildAdded:Wait()
wait(2)
   local Model = game:GetObjects("rbxassetid://12847597717")[1]
Model.Parent = workspace
local Main = Model.RushNew
Main.Name = "Main"
Model.PrimaryPart = Main
Model.Rebound_Cue.Playing = false
for _,v in pairs(Main:GetChildren()) do
   if v.Name ~= "Attachment" then
      v:Destroy()
   end
end
Main.Attachment:FindFirstChild("Smoke").Name = "Particle"
for _,v in pairs(Main.Attachment:GetChildren()) do
   if v.Name == "Smoke" then
      v:Destroy()
   end
end
   Model.Rebound_Cue.TimePosition = 0.4
Model.Rebound_Cue:Play()
Main.CFrame = Rooms[#Rooms].RoomExit.CFrame
wait(0.5)
local move = GetGitSound("https://github.com/A-200Moving/Doors/blob/main/DoomBegin%20(1).mp3?raw=true","Reboun")
    move.Parent = Main
    move.Name = "Ambience"
    move.Volume = 0.25
    move.Looped = true
local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.75
    distort.Parent = move
	move.RollOffMaxDistance = 300
	move.RollOffMinDistance = 50
    local tree = Instance.new("TremoloSoundEffect")
    tree.Depth = 1
    tree.Duty = 1
    tree.Frequency = 5
    tree.Parent = move
    local eq = Instance.new("EqualizerSoundEffect")
    eq.HighGain = -60
    eq.MidGain = 10
    eq.LowGain = 10
    eq.Parent = move
    move:Play()
wait(2.5)
spawn(function()
   local loop
   loop = game:GetService("RunService").RenderStepped:connect(function()
      if Model and Model.Parent then
         local player = game:GetService("Players").LocalPlayer
      local char = player.Character
      if char then
         local hum = char:FindFirstChild("Humanoid")
         local root = char:FindFirstChild("HumanoidRootPart")
local origin = Main.Position
	local charOrigin = root.Position

	if (charOrigin - origin).Magnitude <= 35 then
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Blacklist
		params.FilterDescendantsInstances = {char, Main}

		local result = workspace:Raycast(origin, charOrigin - origin, params)
		if not result then
        can = false
		    hum:TakeDamage(100)
            ReSt:WaitForChild("GameStats")["Player_".. player.Name].Total.DeathCause.Value = "Rebound"
            loop:Disconnect()
		end
	end
         end
      else
         loop:Disconnect()
      end
   end)
end)
for i=#Rooms, 1, -1 do
   local room = Rooms[i]
   if room and room.Parent then
       if room:FindFirstChild("RoomExit") then
           Move(room.RoomExit.Position, Main)
       end
   end
   if room and room.Parent then
       if room:FindFirstChild("RoomEntrance") then
           Move(room.RoomEntrance.Position, Main)
       end
   end
end
TS:Create(move, TweenInfo.new(1), {Volume = 0}):Play()
wait(1)
Model:Destroy()
end	


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
    Title = "No Respawn",
    Desc = "Please Stop Coming Back.",
    Reason = "Survive Rebound.",
    Image = LoadImage("https://github.com/A-200Moving/Doors/blob/main/No_respawn.png?raw=true","Rebound")
})
end
