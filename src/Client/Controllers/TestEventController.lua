-- Test Event Controller
-- Username
-- July 11, 2022



local TestEventController = {}

function TestEventController:Say(mes)
    -- print("Hello, "..mes.."!")
end

function TestEventController:Start()
	-- self.Controllers.TestController:ConnectEvent('Test', function(mes)
    --     print(mes)        
    -- end)
    --self.Services.MyService:SendMessage('Hello from the client')

    self.Services.MyService.Fade:Connect(function(inOut)
        if inOut == "out" then
            --fade out
            print('out')
            self.Controllers.Fade:Out()
            self.Services.MyService.AnAnotherEvent:Fire("Firing this event from the client")
        else
           --fade in
           print('in')
           self.Controllers.Fade:In()
        end
    end)

    local test = self.Modules.TestModule
    test.ABC = 32

end


function TestEventController:Init()
	
end


return TestEventController