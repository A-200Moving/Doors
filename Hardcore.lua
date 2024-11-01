if game.ReplicatedStorage.GameData.LatestRoom.Value ~= 0 then
  game.Players.LocalPlayer:Kick("Please Execute Script Before Open Door!")
end

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

spawn(function()
    while wait(math.random(50,100)) do
      game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/A-200Moving/Doors/refs/heads/main/Matcher.lua"))()
    end
end
