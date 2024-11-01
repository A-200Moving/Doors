if game.ReplicatedStorage.GameData.LatestRoom.Value ~= 0 then
  game.Players.LocalPlayer:Kick("Please Execute Script Before Open Door!")
end

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

spawn(function()
    
end
