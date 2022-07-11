-- Test Controller
-- Username
-- July 11, 2022



local TestController = {}


function TestController:Start()
	-- print('Test Controller Started')
	-- self.Controllers.TestEventController:Say("I am here")

	local test = self.Modules.TestModule
	self.Shared.Thread.Spawn(function()
		print("Spawned a new thread")
	end)

    -- wait(1)
    -- self:FireEvent('Test', 'This is a test')
end


function TestController:Init()
	--self:RegisterEvent('Test')
end


return TestController