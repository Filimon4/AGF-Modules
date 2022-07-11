-- Another Service
-- Username
-- July 11, 2022



local AnotherService = {Client = {}}


function AnotherService:Start()
	self.Services.MyService:SayHello("Efim2")
end


function AnotherService:Init()
	
end


return AnotherService