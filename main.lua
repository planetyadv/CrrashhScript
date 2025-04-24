-- 🔥 Этот LocalScript можно положить в ReplicatedFirst или StarterPlayerScripts
script.Parent = game.ReplicatedFirst
local textureId = "rbxassetid://9676276958" -- замените на ваш ID
local workspace = game:GetService("Workspace")

-- Функция: применяет Decal к Part
local function applyDecal(part)
	if part:IsA("BasePart") and not part:FindFirstChildOfClass("Decal") then
		local decal = Instance.new("Decal")
		decal.Texture = textureId
		decal.Face = Enum.NormalId.Top
		decal.Parent = part
	end
end

-- 🔁 1. Пройтись по всем уже существующим Part
for _, obj in pairs(workspace:GetDescendants()) do
	applyDecal(obj)
end

-- 🆕 2. Автоматически применять к новым Part
workspace.DescendantAdded:Connect(function(obj)
	task.wait() -- чуть подождать, чтобы всё прогрузилось
	applyDecal(obj)
end)

