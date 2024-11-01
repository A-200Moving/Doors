
local ReSt = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")

local RoomsFolder = workspace:WaitForChild("CurrentRooms")


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
wait(4)
Model.Rebound_Cue.TimePosition = 0.4
Model.Rebound_Cue:Play()
Main.CFrame = RoomsFolder:FindFirstChild("0").RoomExit.CFrame
