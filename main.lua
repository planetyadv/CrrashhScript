-- Создаём звук (замени путь на нужный, если хочешь другой звук)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://183200567"  -- Замените на нужный ID звука
sound.Volume = 1
sound.Looped = false

-- Пробегаем по всем игрокам
for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        -- Устанавливаем позицию звука
        sound.Parent = player.Character.HumanoidRootPart
        -- Воспроизводим звук
        sound:Play()
        
        -- Создаём взрыв
        local explosion = Instance.new("Explosion")
        explosion.Position = player.Character.HumanoidRootPart.Position
        explosion.BlastRadius = 5
        explosion.BlastPressure = 100000
        explosion.Parent = workspace
        
        -- Задержка, чтобы звук и взрыв проигрались перед смертью
        wait(1)  -- Пауза для взрыва и звука

        -- Убиваем игрока
        if player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = 0
        end
    end
end
