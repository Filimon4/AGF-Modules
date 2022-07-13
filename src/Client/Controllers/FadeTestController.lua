-- Fade Test Controller
-- Username
-- July 13, 2022



local FadeTestController = {}

function FadeTestController:In_Out(Fade)
    print("Fade In")
	Fade:Out(2, true) -- true is mean that script doesn't wait for end of animation
    task.wait(2)
    print('Fade Out')
    Fade:In(0.5) -- false is mean that script does wait for end of animation
end

function FadeTestController:To_FromTo(Fade)
    print('Fade To')
    print('75%')
    Fade:To(0.75)
    task.wait(3)
    print('From 75% to 100%')
    Fade:FromTo(0.75,0)
    task.wait(3)
    print('From 100% to 0%')
    Fade:FromTo(0,1)
end

function FadeTestController:Start()
    print('FadeController started')
    local Fade = self.Controllers.Fade
    task.wait(10)
    --self:In_Out(Fade)
    self:To_FromTo(Fade)
end

return FadeTestController