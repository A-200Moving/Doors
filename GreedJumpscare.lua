--reboundjumpscare

local ReboundJs = Instance.new("ScreenGui")
local Static = Instance.new("ImageLabel")
local Rebound = Instance.new("ImageLabel")
local JSSIZE = Instance.new("ImageLabel")


ReboundJs.Name = "ReboundJs"
ReboundJs.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Static.Name = "Static"
Static.Parent = ReboundJs
Static.BackgroundColor3 = Color3.fromRGB(139, 0, 127)
Static.BackgroundTransparency = 1.000
Static.BorderColor3 = Color3.fromRGB(27, 42, 53)
Static.BorderSizePixel = 0
Static.Size = UDim2.new(1, 0, 1, 0)
Static.Image = "rbxassetid://236543215"
Static.ImageColor3 = Color3.fromRGB(255, 0, 255)
Static.ImageTransparency = 1.000

Rebound.Name = "Rebound"
Rebound.Parent = ReboundJs
Rebound.BackgroundColor3 = Color3.fromRGB(139, 0, 127)
Rebound.BackgroundTransparency = 1.000
Rebound.BorderSizePixel = 0
Rebound.Position = UDim2.new(0.486631036, 0, 0.479363143, 0)
Rebound.Size = UDim2.new(0.0267379656, 0, 0.0387096703, 0)
Rebound.Image = "rbxassetid://10914796550"

JSSIZE.Name = "JSSIZE"
JSSIZE.Parent = ReboundJs
JSSIZE.BackgroundColor3 = Color3.fromRGB(139, 0, 127)
JSSIZE.BackgroundTransparency = 1.000
JSSIZE.BorderSizePixel = 0
JSSIZE.Position = UDim2.new(-0.586452842, 0, -1.25140607, 0)
JSSIZE.Size = UDim2.new(2.12834215, 0, 3.08128953, 0)
JSSIZE.Visible = false
JSSIZE.Image = "rbxassetid://10914796550"

-- Scripts:

local function ODEBL_fake_script() -- Static.yua 
	local script = Instance.new('LocalScript', Static)

	while true do
		script.Parent.Image = "rbxassetid://236543215"
		wait(0.002)
		script.Parent.Rotation = 0
		wait(0.002)
		script.Parent.Rotation = 180
		wait(0.002)
		script.Parent.Image = "rbxassetid://236777652"
		wait(0.002)
		script.Parent.Rotation = 0
		wait(0.002)
		script.Parent.Rotation = 180
		wait(0.002)
	end
end
coroutine.wrap(ODEBL_fake_script)()
local function KLWZC_fake_script() -- ReboundJs.jumpedscare 
	local script = Instance.new('LocalScript', ReboundJs)

	local function GetGitSound(GithubSnd,SoundName)
	
		local url=GithubSnd
		if not isfile(SoundName..".mp3") then
			writefile(SoundName..".mp3", game:HttpGet(url))
		end
		local sound=Instance.new("Sound")
		sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
		return sound
	end

	local ReSt = game.ReplicatedStorage
	local Plr = game.Players.LocalPlayer
	local gui = script.Parent
	local static = gui.Static
	local jspos = gui.JSSIZE
	local JSSOUND = GetGitSound("https://github.com/A-200Moving/Doors/blob/main/greedy_04-03-23_12-06-27-054.mp3?raw=true","ReboundMurder") JSSOUND.Parent = workspace
	JSSOUND.Volume = 1


	local function Jumpscare()
		game.TweenService:Create(static,TweenInfo.new(0.5),{BackgroundTransparency = 0,ImageTransparency = 0.8}):Play()
		game.TweenService:Create(gui.Rebound,TweenInfo.new(0.5),{Size = jspos.Size,Position = jspos.Position}):Play()
		JSSOUND:Play()
		spawn(function()
			wait(0.3)
			Plr.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(100)
			ReSt.GameStats["Player_".. Plr.Name].Total.DeathCause.Value = "Rebound"
			firesignal(game.ReplicatedStorage.Bricks.DeathHint.OnClientEvent, {"You died to who you call Rebound...","He makes his presence known and keeps coming back...","Hide when this happens!"})
		end)
		wait(0.5)
		game.TweenService:Create(static,TweenInfo.new(1),{BackgroundTransparency = 1,ImageTransparency = 1}):Play()
		game.TweenService:Create(gui.Rebound,TweenInfo.new(0.3),{ImageTransparency = 1}):Play()
		wait(1)
		JSSOUND:Destroy()
		gui:Destroy()
	end

	Jumpscare()
end
coroutine.wrap(KLWZC_fake_script)()
