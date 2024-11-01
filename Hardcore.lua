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
    while wait(math.random(50,100)) do
      game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/A-200Moving/Doors/refs/heads/main/Matcher.lua"))()
    end
end)

spawn(function()
    while wait(math.random(70,140)) do
      game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
      wait(math.random(2,4))
      loadstring(game:HttpGet("https://raw.githubusercontent.com/A-200Moving/Doors/refs/heads/main/Rebound.lua"))()
    end
  end)
