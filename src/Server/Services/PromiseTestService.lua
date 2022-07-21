-- Promise Test Service
-- Username
-- July 21, 2022



local PromiseTestService = {Client = {}}

function PromiseTestService:ExampleNew(Promise,Tween,TweenObj)
    local function tween(obj,Tweenifno, pops)
        return Promise.new(function(resolve,reject,onCancel)
            local tween = Tween:Create(obj,Tweenifno,pops)

            if onCancel(function() tween:Cancel() end) then
                return
            end

            tween.Completed:Connect(resolve)
            tween:Play()
        end)
    end

    local promis = tween(TweenObj, TweenInfo.new(2),{Position = Vector3.zero}):andThen(function()
        print("done")
    end)

    task.wait(4)
    promis:cancel()
    print('Tween was fine')
end

function PromiseTestService:CreatePart()
    local p = Instance.new('Part',game.Workspace)
    p.Anchored = true
    p.CanCollide = false
    p.Position = Vector3.new(-1.35, 25, 2.5)
    p.Size = Vector3.new(2,2,2)
    return p
end

function PromiseTestService:Start()
    -- 1.
    -- Init the modules and other
    task.wait(2)
	local Promise = self.Shared.Promise
    local Tween = game:GetService("TweenService")
    local TweenObj = self:CreatePart()
    self:ExampleNew(Promise,Tween,TweenObj)
end


return PromiseTestService