-- Maid Test Service
-- Username
-- July 21, 2022



local MaidTestService = {Client = {}}

function MaidTestService:CreatePart()
    local p = Instance.new('Part', game.Workspace)
    p.Anchored = true
    p.CanCollide = false
    p.Position = Vector3.new(math.random(0,50), math.random(0,50), math.random(0,50))
    p.Size = Vector3.new(math.random(0,5),math.random(0,5),math.random(0,5))
    return p
end

function MaidTestService:Example(Maid)
    local maid = Maid.new() -- deifne the maid

    for i=1,50,1 do -- create 50 parts and write them in the maid
        local p = self:CreatePart()
        maid:GiveTask(p)
    end
    task.wait(6) -- wait for 6 seconds
    maid:DoCleaning() -- clean the parts
end

function MaidTestService:Start()
	task.wait(6)
    local Maid = self.Shared.Maid
    self:Example(Maid)
end


return MaidTestService