
local ReSt = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")

local RoomsFolder = workspace:WaitForChild("CurrentRooms")

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
local function Move(target)
   local dist = (Main.Position - target).Magnitude
   local tween = TS:Create(Main, TweenInfo.new(dist / 80), {Position = target})
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
for i=#Rooms, 1, -1 do
   local room = Rooms[i]
   if room and room.Parent then
       if room:FindFirstChild("RoomExit") then
           Move(room.RoomExit.Position)
       end
   end
   if room and room.Parent then
       if room:FindFirstChild("RoomEntrance") then
           Move(room.RoomEntrance.Position)
       end
   end
end
TS:Create(move, TweenInfo.new(1), {Volume = 0}):Play()
wait(1)
Model:Destroy()

local function Rebound()
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
for i=#Rooms, 1, -1 do
   local room = Rooms[i]
   if room and room.Parent then
       if room:FindFirstChild("RoomExit") then
           Move(room.RoomExit.Position)
       end
   end
   if room and room.Parent then
       if room:FindFirstChild("RoomEntrance") then
           Move(room.RoomEntrance.Position)
       end
   end
end
TS:Create(move, TweenInfo.new(1), {Volume = 0}):Play()
wait(1)
Model:Destroy()
end
for i=1, math.random(3,5) do
   ReSt.GameData.LatestRoom.Changed:Wait()
wait(1)
   Rebound()
end
