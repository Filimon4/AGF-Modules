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
    print('Fade From 75% to 100%')
    Fade:FromTo(0.75,0)
    task.wait(3)
    print('Fade From 100% to 0%')
    Fade:FromTo(0,1)
end

function FadeTestController:Text(Fade)
    print("Set Text")
    -- // Text Settings // --
    Fade:SetText("Hello world")
    print("Set Size")
    Fade:SetTextSize(25)
    print("Font")
    Fade:SetFont(Enum.Font.FredokaOne)
    print("Text Color")
    Fade:SetTextColor(Color3.new(0, 0.6, 1))
    
    --// Commands // --
    local gui = Fade:GetScreenGui()
    print(gui)
    local frame = Fade:GetFrame()
    print(frame)
    local label = Fade:GetLabel()
    print(label)

    print("Clear Text")
    Fade:ClearText()
end

function FadeTestController:Start()
    warn('FadeController started')
    local Fade = self.Controllers.Fade
    task.wait(6.5)
    -- // Functions

    --self:In_Out(Fade)
    --self:To_FromTo(Fade)
    --self:Text(Fade)

    -- //
    warn('FadeController finished')
end

return FadeTestController