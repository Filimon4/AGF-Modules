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
    self:MouseMethods(mouse)
end

-- //

-- // Mouse Methods Example

function UserInputTestController:MouseMethods(mouse)
    -- // Methods

    --self:MousePosition(mouse)
    --self:Lock_Unlock(mouse)
    --self:MouseDelta(mouse) -- works only if mouse if lock, instead it will return a zero
    --self:LockInCenter(mouse)
    self:Raycast(mouse)

    -- //
end

function UserInputTestController:Raycast(mouse)
    local ray = mouse:GetRay(1000) -- return Origin position and Dirction of the ray

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
    warn("User Input Test Controller finished")
end
return UserInputTestController