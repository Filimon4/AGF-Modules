-- My Service
-- Username
-- July 11, 2022



local MyService = {Client = {}}

local EVENT_HELLO = "Hello"

function MyService:SayHello(name)
    print("Helloy, "..name.."!")
end

function MyService.Client:SendMessage(player, message)
    print(player.Name .. " says: \""..message.."\"")
end

function MyService:Start()
    -- for i = 1,10 do
    --     wait(0.1)
    --     self:FireEvent(EVENT_HELLO, "Hello "..i)
    -- end
end


function MyService:Init()
	self:RegisterEvent(EVENT_HELLO)
end


return MyService