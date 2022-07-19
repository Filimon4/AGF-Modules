-- Smooth Test Controller
-- Username
-- July 19, 2022



local SmoothTestController = {}

function SmoothTestController:Part()
    local p = Instance.new('Part', game.Workspace)
    p.Anchored = true
    p.CanCollide = false
    p.Size = Vector3.new(2,2,2)
    p.BrickColor = BrickColor.new('Really red')
    return p
end

function SmoothTestController:SmoothExample()
    -- // Modules
    local runService = game:GetService("RunService")

    local UserInput = self.Controllers.UserInput
    local Mouse = UserInput:Get('Mouse')

	local SmoothModule = self.Modules.Smooth
    local Part = self:Part()

    -- //

    -- // Functions

    local function RaycastPosition() -- create a function that will be return position
        local RaycastParams = RaycastParams.new()
        RaycastParams.FilterDescendantsInstances = {}
        RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist
        local ray = Mouse:Raycast(RaycastParams, 50000)
        return ray.Position
    end

    -- //

    Mouse.LeftDown:Connect(function() -- Event will be call when the left mouse button is pressed
        local ray = RaycastPosition()
        if ray then
            local Smooth = SmoothModule.new(Part.Position, 0.5) -- smooth init

            runService:BindToRenderStep("Example", 0, function()
                local position = Smooth:Update(ray) -- Smooth update position

                Part.Position = position
            end)
        end
    end)
end

function SmoothTestController:Start()
    task.wait(6)
    --self:SmoothExample()
end

return SmoothTestController