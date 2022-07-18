-- Camera Shaker Test Controller
-- Username
-- July 17, 2022



local CameraShakerTestController = {}

function CameraShakerTestController:PRESET_VERSION(ShakeModule,CurrentCamera,Presets)
    
    local Function = function(cframe) -- basic callback function
        CurrentCamera.CFrame = CurrentCamera.CFrame * cframe
    end

    local camShake = ShakeModule.new(Enum.RenderPriority.Camera.Value + 1, Function) -- initialize new shake

    camShake:Start() -- run function
    task.wait(0.5) -- just a wait

    -- 1.
    -- Main function is Shake
    -- camShake:Shake uses Presets(list bellow).
    -- Time of shake is depends on the FadeIn/OutTime, but for shake fade depends on the Preset that you use.
    camShake:Shake(Presets.Bump)
    camShake:Shake(Presets.GentleSway)
    task.wait(0.3)
    camShake:StopSustained( -- Stops all shakes
        0.5 -- FadeOutTime
    )
    -- How you can see above. I start 2 shakes, and if you wanna stop them both you should use StopSustained

    -- 2.
    -- Functions that use CameraShakeInstance. You can use all functions from CameraShakeInstance like in CUSTOM_VERSION
    -- camShake:ShakeOnce() and camShake:StartShake()
    task.wait(0.5)
    local ShakeOnceInstance = camShake:ShakeOnce( -- fully customizeable shake, but it shakes only once(1 time).It uses CameraShakeInstance.new
        17, -- magnitude
        3, -- roughness
        0.5, -- FadeInTime
        0.75, -- FadeOutTime
        Vector3.new(1.55, 0.5, 2.5), -- PositionInfluence
        Vector3.new(1.6, 1.6, 1.6) -- RotationInfluence
    ) -- it will stop automatically, you don't need to stop this.

    task.wait(4)
    -- the same structure
    local ShakeInstance = camShake:StartShake(12,4,2,1.5,Vector3.new(1.55, 0.5, 2.5),Vector3.new(1.6, 1.6, 1.6))
    -- to stop you should use camShake:Stop()(It will stop whole shake) or ShakeInstance:StartFadeOut()(It will stop only this shake)
    task.wait(1.5)
    ShakeInstance:StartFadeOut(2)


    -- 3.
    task.wait(3)
    camShake:ShakeSustain(Presets.Earthquake) -- time(FadeIn/Out) of this shake is indefinitely. You can stop it by camShake:Stop()(like bellow)

    -- 4.
    task.wait(4)
    camShake:Stop() -- stop function

    -- 5. Additional
    --[[
        List of presets for shake:
        1. Bump
        2. Explosion
        3. Earthquake
        4. GentleSway
        5. BadTrip
        6. HandheldCamera
        7. Vibration
        8. RoughDriving
    ]]--
end

function CameraShakerTestController:CUSTOM_VERSION(ShakeModule,CurrentCamera,CameraShakeInstance)
    -- 1.
    -- Let's init new shake
    local camShake = ShakeModule.new(Enum.RenderPriority.Camera.Value + 1, function(cframe)
        CurrentCamera.CFrame = CurrentCamera.CFrame * cframe
    end)

    -- 2.
    -- define settings for shake. That's a preset that you script on your own
    local Example = CameraShakeInstance.new(
        2.5, -- Magnitude (how far the camera can move)
        4,   -- Roughness (how fast the camera can move)
        0.1, -- Fade-in time (how long it takes to reach full magnitude)
        0.75 -- Fade-out time (how long it takes to fade out to no shaking)
    )
    -- How far the position can moved (but will be multiplied by the magnitude):
    Example.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
    -- How much rotation is allowed (in degrees; also multiplied by magnitude):
    Example.RotationInfluence = Vector3.new(1, 1, 1)

    -- 3.
    -- Start the shake and apply custom settings
    camShake:Start()
    camShake:ShakeSustain(Example)
    
    -- 4.
    -- Get stat of shake. It's just show that you can get/check from custom preset.
    -- Scale is a number, that will multiply the preset settings
    print(Example:GetScaleRoughness())
    print(Example:GetScaleMagnitude())
    print(Example:GetNormalizedFadeTime())
    print(Example:IsShaking()) -- boolen value
    print(Example:IsFadingOut()) -- boolean value
    print(Example:IsFadingIn()) -- boolean value

    -- 5.
    -- Let's change some options
    Example:SetScaleRoughness(2) -- multiply the Roughness by 2
    print(Example:GetScaleRoughness())
    Example:SetScaleMagnitude(2) -- multiply the Magnitude by 2
    print(Example:GetScaleMagnitude())

    -- 6.
    -- Let's look at FadeIn/Out functions
    task.wait(2)
    Example:StartFadeOut(3) -- Fade Out function
    task.wait(3.1)
    Example:StartFadeIn(3) -- Fade In Function
end

function CameraShakerTestController:Start()
    warn('Camera Shaker Test Controller started')
    task.wait(7)
    -- // MODULES
	local ShakeModule= self.Modules.CameraShaker -- find camerashaker module
    local CameraShakeInstance = ShakeModule.CameraShakeInstance
    local Presets = ShakeModule.Presets
    local CurrentCamera = workspace.CurrentCamera
    -- //

    -- // 2 Versions of Shake

    --self:PRESET_VERSION(ShakeModule,CurrentCamera,Presets) -- shake made by preset. For this i use CameraShake and CameraShakePresets Modules
    --self:CUSTOM_VERSION(ShakeModule,CurrentCamera,CameraShakeInstance) -- shake make by custom preset. For this i use CameraShake and CameraShakeInstance Modules

    -- //

    -- These 2 versions are just for show you functions of modules. You can freely combine these 2 how ever you want and make amazing camera shake effect.
    -- For my opinion it's much better and esier to use structure of PERSET_VERSION, bcs it's much better and esier
end

return CameraShakerTestController