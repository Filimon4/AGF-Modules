-- My Service
-- Username
-- July 11, 2022



local MyService = {Client = {}}

--local EVENT_HELLO = "Hello"

local CLIENT_EVENT_FADE = "Fade"
local CLIENT_EVENT_AN_ANOTHER_EVENT = "AnAnotherEvent"

-- function MyService:SayHello(name)
--     print("Helloy, "..name.."!")
-- end

-- function MyService.Client:SendMessage(player, message)
--     print(player.Name .. " says: \""..message.."\"")
-- end

function MyService:Start()

    self:ConnectClientEvent(CLIENT_EVENT_AN_ANOTHER_EVENT, function(player,msg)
        print(player.Name .. " says: \""..msg.."\"")
    end)

    task.wait(10)
    self:FireAllClients(CLIENT_EVENT_FADE, "out")
    task.wait(3)
    self:FireAllClients(CLIENT_EVENT_FADE, "in")
    -- for i = 1,10 do
    --     wait(0.1)
    --     self:FireEvent(EVENT_HELLO, "Hello "..i)
    -- end
end


function MyService:Init()
	--self:RegisterEvent(EVENT_HELLO)
    self:RegisterClientEvent(CLIENT_EVENT_FADE)
    self:RegisterClientEvent(CLIENT_EVENT_AN_ANOTHER_EVENT)
end


return MyService