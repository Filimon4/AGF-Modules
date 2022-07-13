-- Fade Test Controller
-- Username
-- July 13, 2022



local FadeTestController = {}


function FadeTestController:Start()
    print('FadeController started')
    task.wait(10)
    print("Fae In")
	self.Controllers.Fade:Out(2, true) -- true is mean that script doesn't wait for end of animation
    task.wait(2)
    print('Fade Out')
    self.Controllers.Fade:In(0.5) -- false is mean that script does wait for end of animation
end


function FadeTestController:Init()
	
end


return FadeTestController