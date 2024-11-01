local latestRoom = game.ReplicatedStorage.GameData.LatestRoom

if latestRoom.Value ~= 0 then
  game.Players.LocalPlayer:Kick("Please Execute Script Before Open Door!")
end

if workspace:FindFirstChild("HardcoreModeIsRun") then
  warn("Script Is Already Run")
  return
end

local cantspawn = {49,50,51,52}

local IsRun = Instance.new("BoolValue")
IsRun.Name = "HardcoreModeIsRun"
IsRun.Value = true
IsRun.Parent = workspace

latestRoom.Changed:Wait()

spawn(function()
    while wait(math.random(100,250)) do
      if not workspace:FindFirstChild("Matcher") then
        if not table.find(cantspawn, latestRoom.Value) then
          game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/A-200Moving/Doors/refs/heads/main/Matcher.lua"))()
        end
        end
    end
end)

spawn(function()
    while wait(math.random(125,300)) do
      if not workspace:FindFirstChild("Rebound") then
        if not table.find(cantspawn, latestRoom.Value) then
          game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/A-200Moving/Doors/refs/heads/main/Rebound.lua"))()
        end
      end
    end
  end)

spawn(function()
    while wait(math.random(300,600)) do
      if not workspace:FindFirstChild("A-60") then
        if not table.find(cantspawn, latestRoom.Value) then
          game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/A-200Moving/Doors/refs/heads/main/A-60.lua"))()
        end
      end
    end
  end)
