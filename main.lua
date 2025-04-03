script.Parent = game.ServerScriptService
local function clearWorkspace()
    for _, obj in pairs(workspace:GetChildren()) do
        -- Проверяем, не является ли объект игроком или Terrain
        if not obj:IsA("Terrain") and not obj:IsDescendantOf(game.Players) then
            obj:Destroy()
        end
    end
end

-- Запускаем очистку
clearWorkspace()
