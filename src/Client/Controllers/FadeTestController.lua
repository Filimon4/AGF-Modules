-- Fade Test Controller
-- Username
-- July 13, 2022



local FadeTestController = {}

function FadeTestController:In_Out(Fade)
    --1.
	Fade:Out(2, true) -- true is mean that script doesn't wait for end of animation
    
    --2.
    task.wait(2)
    Fade:In(0.5) -- false is mean that script does wait for end of animation
end

function FadeTestController:To_FromTo(Fade)
    --[[
        0 - visible
        1 - invisible
    ]]--

    --1.
    Fade:To(0.75) -- Fade transperancy is 0.75
    --2.
    task.wait(3)
    Fade:FromTo(0.75,0) -- Fade transperancy from 0.75 to 0
    --3.
    task.wait(3)
    Fade:FromTo(0,1) -- Fade transperancy from 0 to 1
end

function FadeTestController:Text(Fade)
    -- // Text Settings
    
    Fade:SetText("Hello world")
    Fade:SetTextSize(25)
    Fade:SetFont(Enum.Font.FredokaOne)
    Fade:SetTextColor(Color3.new(0, 0.6, 1))

    -- //

    -- // Commands
    local gui = Fade:GetScreenGui() -- get gui
    local frame = Fade:GetFrame() -- get frame
    local label = Fade:GetLabel() -- get label
    -- //

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
end

return FadeTestController