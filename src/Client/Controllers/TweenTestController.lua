-- Tween Test Controller
-- Username
-- July 19, 2022



local TweenTestController = {}

function TweenTestController:Part()
    local p = Instance.new('Part', game.Workspace)
    p.Anchored = true
    p.CanCollide = false
    p.Transparency = 0.75
    p.Position = Vector3.new(0, 30, 0)
    p.Orientation = Vector3.new(-90,0,0)
    p.Size = Vector3.new(2,2,2)
    return p
end

function TweenTestController:TweenExample()
    local Tween = self.Modules.Tween
    local Camera = game.Workspace.CurrentCamera

    local part = self:Part()
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out) -- tweeninfo

    local tweenCreate = Tween.fromService(Camera, tweenInfo, {CFrame = part.CFrame}) -- create new tween
    tweenCreate:Play()
end

function TweenTestController:Start()
    task.wait(6)
	--self:TweenExample()
end


return TweenTestController