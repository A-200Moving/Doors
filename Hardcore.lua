if game.ReplicatedStorage.GameData.LatestRoom.Value ~= 0 then
  game.Players.LocalPlayer:Kick("Please Execute Script Before Open Door!")
end

if workspace:FindFirstChild("HardcoreModeIsRun") then
  warn("Script Is Already Run")
  return
end

local IsRun = Instance.new("BoolValue")
IsRun.Name = "HardcoreModeIsRun"
IsRun.Value = true
IsRun.Parent = workspace

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

spawn(function()
    while wait(math.random(100,250)) do
      if not workspace:FindFirstChild("Matcher") then
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/A-200Moving/Doors/refs/heads/main/Matcher.lua"))()
      end
    end
end)

spawn(function()
    while wait(math.random(125,300)) do
      if not workspace:FindFirstChild("Rebound") then
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/A-200Moving/Doors/refs/heads/main/Rebound.lua"))()
      end
    end
  end)

spawn(function()
    while wait(math.random(300,600)) do
      if not workspace:FindFirstChild("A-60") then
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/A-200Moving/Doors/refs/heads/main/A-60.lua"))()
      end
    end
  end)
