-- My Service
-- Username
-- July 11, 2022



local MyService = {Client = {}}

function MyService:SayHello(name)
    print("Helloy, "..name.."!")
end

function MyService:Start()
	self:SayHello("Efim")
end


function MyService:Init()
	
end


return MyService