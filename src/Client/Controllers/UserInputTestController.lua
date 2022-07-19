-- User Input Test Controller
-- Username
-- July 14, 2022



local UserInputTestController = {}

-- // Functions Example

function UserInputTestController:HideMouse(userinput)
    -- default is false
    userinput.HideMouse = false -- false/true
    --mouse will be hidden when user swithe away from mouse of keyboard,
    --but it will conflict with setting the mouse visibility(the Mouse module)
end

function UserInputTestController:Get_Preferred(userinput)
    local preferred = userinput:GetPreferred() -- return a number from 0 to 3

    if (preferred == userinput.Preferred.Keyboard) then -- if number is 0
        print('Player uses an keyboard')

    elseif (preferred == userinput.Preferred.Mouse) then -- if number is 1
        print('Player uses a mouse')

    elseif (preferred == userinput.Preferred.Gamepad) then -- if number is 2
        print('Player uses a gamepad')

    elseif (preferred == userinput.Preferred.Touch) then -- if number is 3
        print('Player uses a touch')
    end
end

function UserInputTestController:Preferred_Changed(userinput)
    userinput.PreferredChanged:Connect(function(preferred)
        --fire when user change input, return a nubmer like in GetPreferred()
    end)
end

function UserInputTestController:Get(userinput)
    --Get user's input
    local mouse = userinput:Get('Mouse')
    local keyboard = userinput:Get('Keyboard')
    local mobile = userinput:Get('Mobile')
    local gamepad = userinput:Get('Gamepad')

    -- Methods of input
    self:MouseSettings(mouse)
    --self:MobileSettings(mobile)
end

-- //

-- // Mouse Methods Example

function UserInputTestController:MouseSettings(mouse)
    -- // Methods

    --self:MousePosition(mouse)
    --self:Lock_Unlock(mouse)
    --self:MouseDelta(mouse) -- works only if mouse if lock, instead it will return a zero
    --self:LockInCenter(mouse)
    --self:Raycast(mouse)
    --self:RaycastFromXY(mouse)
    self:RaycastWithParams(mouse) -- in documentation there is methods Cast,CastWithIgnoreList and CastWithWhitelist. I will use Raycast methode, bsc it's just simpler

    -- //

    -- // Events

    -- self:MouseClicks(mouse)
    -- self:MouseMove(mouse)
    -- self:MouseScroll(mouse)

    -- //
end

function UserInputTestController:MouseMove(mouse)
    mouse.Moved:Connect(function()
        print('Mouse move')
    end)
end

function UserInputTestController:MouseScroll(mouse)
    mouse.Scrolled:Connect(function(amount)
        print('Mouse scroll ' .. tostring(amount))
    end)
end

function UserInputTestController:MouseClicks(mouse)
    mouse.LeftDown:Connect(function()
        print('Left down')
    end)
    mouse.LeftUp:Connect(function()
        print('Left up')
    end)
    mouse.RightDown:Connect(function()
        print('Right down')
    end)
    mouse.RightUp:Connect(function()
        print('Right Up')
    end)
    mouse.MiddleDown:Connect(function()
        print('Middle down')
    end)
    mouse.MiddleUp:Connect(function()
        print('Middle Up')
    end)
end

function UserInputTestController:RaycastWithParams(mouse)
    local distance = 1000
    local RaycastParams = RaycastParams.new()
    RaycastParams.FilterDescendantsInstances = {}
    RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local ray = mouse:Raycast(RaycastParams, distance)
    -- print(ray.Distance)
    -- print(ray.Instance)
    -- print(ray.Material)
    -- print(ray.Position)

    --[[ Visual Point of collide the ray with a part
        local p = Instance.new("Part", game.Workspace)
        p.Size = Vector3.new(math.random(1, 2),math.random(1, 2),math.random(1, 2))
        p.Anchored = true
        p.CanCollide = false

        if ray.Position and ray.Material and ray.Instance then
            p.Position = ray.Position
            p.BrickColor = ray.Instance.BrickColor
            p.Material = ray.Material
        else
            print("There is not a point of collide")
            p.Position = Vector3.new(0,0,0)
        end
    ]]--
end

function UserInputTestController:RaycastFromXY(mouse)
    local ray = mouse:GetRayFromXY(331, 205) -- you just have to manualy write x and y cordinates

end

function UserInputTestController:Raycast(mouse)
    local distance = 1000
	local ray = mouse:GetRay(distance) -- return Origin position and Dirction of the ray
	
    --[[ Visual
    
    local Originpart = Instance.new('Part',game.Workspace)
    -- settings
    Originpart.Transparency = 0.5
    Originpart.Anchored = true
    Originpart.CanCollide = false
    Originpart.Name = 'Originpart'
    -- Show
    Originpart.BrickColor = BrickColor.new('Really red')
    Originpart.Size = Vector3.new(0.5,0.5,ray.Direction.magnitude)
    Originpart.CFrame = CFrame.new(ray.Origin, ray.Direction)
    ]]--
end

function UserInputTestController:MousePosition(mouse)
    local Pos = mouse:GetPosition()
    print(Pos)
end

function UserInputTestController:Lock_Unlock(mouse)
    mouse:Lock()
    task.wait(1.5)
    mouse:Unlock()
end

function UserInputTestController:MouseDelta(mouse)
    -- Also you should put a wait 
    mouse:Lock()
    task.wait(0.2) -- wait
    print(mouse:GetDelta()) -- get change in position(Delta)
    mouse:Unlock()
end

function UserInputTestController:LockInCenter(mouse)
    mouse:LockCenter()
    task.wait(1.5)
    mouse:Unlock()
end

-- //


function UserInputTestController:Start()
    warn("User Input Test Controller started")
    local UserInput = self.Controllers.UserInput
	task.wait(6)
    -- // Functions

    --self:HideMouse(UserInput)
    self:Get(UserInput)
    --self:Get_Preferred(UserInput)
    --self:Preferred_Changed(UserInput)

    -- //
end
return UserInputTestController