-- what in the actual fuck is this garbage as code but why is it so op idk bru
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()



Mouse.KeyDown:Connect(function(Key)
   local Keybind5 = Rise.Misc.LayKeybind:lower()
    if Key == Keybind5 and Rise.Misc.UseLay then
        local Args = {
            [1] = "AnimationPack",
            [2] = "Lay"
        }
        game:GetService("ReplicatedStorage"):FindFirstChild("MainEvent"):FireServer(unpack(Args))
    end
end)

if Rise.Main.AntiAimViewer == true then
    for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= Client and v.Character and v.Character:FindFirstChild("Head") and  v.Character:FindFirstChild("HumanoidRootPart")  then
        local c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
        local d = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(c.X, c.Y)).Magnitude
    end
end
end
if Rise.Main.Resolver then
    local RunService = game:GetService("RunService")

    local function zeroOutYVelocity(hrp)
        hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
        hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
    end

    local function onPlayerAdded(player)
        player.CharacterAdded:Connect(function(character)
            local hrp = character:WaitForChild("HumanoidRootPart")
            zeroOutYVelocity(hrp)
        end)
    end

    local function onPlayerRemoving(player)
        player.CharacterAdded:Disconnect()
    end

    game.Players.PlayerAdded:Connect(onPlayerAdded)
    game.Players.PlayerRemoving:Connect(onPlayerRemoving)

    RunService.Heartbeat:Connect(function()
        pcall(function()
            for i, player in pairs(game.Players:GetChildren()) do
                if player.Name ~= game.Players.LocalPlayer.Name then
                    local hrp = player.Character.HumanoidRootPart
                    zeroOutYVelocity(hrp)
                end
            end
        end)
    end)
-- made by slatti#6944 (oopsie skiddy dasie)
local function get_calculated_velocity(obj)
    if nil_check(obj) and obj.Character and obj.Character:FindFirstChild(script.silent.hitpart) then
        local root = obj.Character.HumanoidRootPart
        local character = obj.Character 

        local currentPosition = root.Position
        local currentTime = tick() 

        wait(0.00350) 

        local newPosition = root.Position
        local newTime = tick()
        
        local distanceTraveled = (newPosition - currentPosition) 

        local timeInterval = newTime - currentTime
        local velocity = distanceTraveled / timeInterval
        currentPosition = newPosition
        currentTime = newTime
        return velocity
    end
end
end
if Rise.Macro.Enabled then
    local Player = game:GetService("Players").LocalPlayer
                local Mouse = Player:GetMouse()
                local SpeedGlitch = false
                Mouse.KeyDown:Connect(function(Key)
                    if Key == Rise.Macro.Keybind then
                        SpeedGlitch = not SpeedGlitch
                        if SpeedGlitch == true then
                            repeat game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                        wait(0.000001)
                                        game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                        wait(0.000001)
                            until SpeedGlitch == false
                        end
                    end
                end)

-- Notifications
local function sendnotif(message, good)
    local gui = Instance.new("ScreenGui")
    gui.Name = "NotificationGui"
    gui.ResetOnSpawn = false
    gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 70)
    frame.Position = UDim2.new(1, -240, 1, -100)
    frame.BackgroundTransparency = 0.5 -- Set background transparency to 0.5
    frame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = frame
    
    if good then
        frame.BackgroundColor3 = Color3.fromRGB(76, 175, 80) -- Green
    elseif good == false then
        frame.BackgroundColor3 = Color3.fromRGB(244, 67, 54) -- Red
    else
        frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Red
    end
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -10, 1, -10)
    textLabel.Position = UDim2.new(0, 5, 0, 5)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = message
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextSize = 20.5
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextWrapped = true
    textLabel.Parent = frame
    
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    
    -- Tween for fading in and moving the notification
    local fadeTween = game:GetService("TweenService"):Create(frame, tweenInfo, { BackgroundTransparency = 0 })
    local popTween = game:GetService("TweenService"):Create(frame, tweenInfo, { Position = UDim2.new(1, -240, 1, -160) })
    fadeTween:Play()
    popTween:Play()
    
    wait(1)
    
    -- Tween for fading out and moving the notification
    local fadeOutTween = game:GetService("TweenService"):Create(frame, tweenInfo, { BackgroundTransparency = 1 })
    local popOutTween = game:GetService("TweenService"):Create(frame, tweenInfo, { Position = UDim2.new(1, -240, 1, -100) })
    
    -- Connect the fade out tween to the completion event
    fadeOutTween.Completed:Connect(function()
        gui:Destroy()
    end)
    fadeOutTween:Play()
    popOutTween:Play()
end

if Rise.Aimbot.Enabled then
local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/k4alt/gray/main/wait"))()
end
-- // Dependencies
local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/k4alt/gray/main/noway.lua"))()
Aiming.TeamCheck(false)

-- // Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- // Vars
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = Workspace.CurrentCamera

local DaHoodSettings = {
    SilentAim = true,
    AimLock = false,
    Prediction = Rise.Silent.Prediction,
    AimLockKeybind = Enum.KeyCode.E
}
getgenv().DaHoodSettings = DaHoodSettings

-- // Overwrite to account downed
function Aiming.Check()
    -- // Check A
    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
        return false
    end

    -- // Check if downed
    local Character = Aiming.Character(Aiming.Selected)
    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil

    -- // Check B
    if (KOd or Grabbed) then
        return false
    end

    -- //
    return true
end

-- // Hook
local __index
__index = hookmetamethod(game, "__index", function(t, k)
    -- // Check if it trying to get our mouse's hit or target and see if we can use it
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
        -- // Vars
        local SelectedPart = Aiming.SelectedPart

        -- // Hit/Target
        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then
            -- // Hit to account prediction
            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

            -- // Return modded val
            return (k == "Hit" and Hit or SelectedPart)
        end
    end

    -- // Return
    return __index(t, k)
end)

-- // Aimlock
RunService:BindToRenderStep("AimLock", 0, function()
    if (DaHoodSettings.AimLock and Aiming.Check() and UserInputService:IsKeyDown(DaHoodSettings.AimLockKeybind)) then
        -- // Vars
        local SelectedPart = Aiming.SelectedPart

        -- // Hit to account prediction
        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

        -- // Set the camera to face towards the Hit
        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)
    
    end
end)


-- // Chat commands
local me = game:GetService("Players").LocalPlayer

me.Chatted:Connect(function(message)
    if getgenv().Rise.Chat.Enabled then
        local args = string.split(message, " ")
        if args[1] == getgenv().Rise.Chat.FOV and args[2] ~= nil then
            getgenv().Rise.FOV.Radius = tonumber(args[2])
        end
    end
    if getgenv().Rise.Chat.Enabled then
        local args = string.split(message, " ")
        if args[1] == getgenv().Rise.Chat.Prediction and args[2] ~= nil then
            getgenv().Rise.Silent.Prediction = tonumber(args[2])
        end
    end
    if getgenv().Rise.Chat.Enabled then
        local args = string.split(message, " ")
        if args[1] == getgenv().Rise.Chat.HitChance and args[2] ~= nil then
            getgenv().Rise.Silent.HitChance = tonumber(args[2])
        end
    end
    if getgenv().Rise.Chat.Enabled then
        local args = string.split(message, " ")
        if args[1] == getgenv().Rise.Chat.AutoPred and args[2] ~= nil then
            getgenv().Rise.AutoPrediction.Enabled = tonumber(args[2])
        end
    end
    if getgenv().Rise.Chat.Enabled then
        local args = string.split(message, " ")
        if args[1] == getgenv().Rise.Chat.ClosestPart and args[2] ~= nil then
            getgenv().Rise.Silent.ClosestPart = tonumber(args[2])
        end
    end
    if getgenv().Rise.Chat.Enabled then
        local args = string.split(message, " ")
        if args[1] == getgenv().Rise.Chat.Part and args[2] ~= nil then
            getgenv().Aiming.TargetPart = tonumber(args[2])
        end
    end
end)


local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

if Rise.InventorySorter.Enabled == true then 
local services = {
   ["Players"] = game:GetService("Players"),
   ["RunService"] = game:GetService("RunService"),
}

local variables = {
   ["LocalPlayer"] = services["Players"].LocalPlayer,
   ["RenderStepped"] = services["RunService"].RenderStepped,
}

local function get_instance(from,name)
   if from ~= nil and name ~= nil then
       local inst = from:FindFirstChildOfClass(name)
       if not inst then
           inst = from:FindFirstChild(name)
       end
       if inst then
           return inst
       end
   end
end
local function update()
   variables["RenderStepped"]:wait()
   local temp = {}
   for i=1,#variables["LocalPlayer"].Backpack:GetChildren() do
       local tool = get_instance(variables["LocalPlayer"].Backpack,"Tool")
       if tool then
           table.insert(temp,tool)
           tool.Parent = game
       end
   end
   for x=1,#Rise.InventorySorter.List do
       for i=1,#temp do
           if string.sub(string.lower(tostring(temp[i])),1,string.len(string.lower(Rise.InventorySorter.List[x]))) == string.lower(Rise.InventorySorter.List[x]) then
               temp[i].Parent = variables["LocalPlayer"].Backpack
               wait(0.105)
           end
       end
   end
   for i=1,#temp do
       temp[i].Parent = variables["LocalPlayer"].Backpack
       wait(0)
   end
end
Mouse.KeyDown:Connect(function(key)
    if key == Rise.InventorySorter.Keybind and Rise.InventorySorter.Enabled then
        update()
    end
end)
end
end

if Rise.Misc.MemSpoofer then
    local Settings = {
        range1 = Rise.Misc.Minimum,
        range2 = Rise.Misc.Maximum,
        
    }

    for __, v in pairs(game.CoreGui.RobloxGui.PerformanceStats:GetChildren()) do
        if v.Name == "PS_Button" and v.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
            Memory = v.StatsMiniTextPanelClass.ValueLabel
        end
    end

    Memory:GetPropertyChangedSignal("Text"):Connect(function()
        local Random = math.random(Settings.range1,Settings.range2)
        Random = Random * 1.23 
        Memory.Text = "".. Random .." MB"
    end)
end

-- // Silent Toggle
if Rise.Silent.UseKeybind then
    local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
    Mouse.KeyDown:Connect(function(key)
        if key == Rise.Silent.Keybind then
            getgenv().Rise.Silent.Enabled = not Rise.Silent.Enabled
            if Rise.Main.Notifications then
                sendnotif(Rise.Silent.Enabled and "Silent Enabled" or "Silent Disabled", Rise.Silent.Enabled)
            end
        end
    end)
end

local custom_theme = {} --soon

local function CreateInstance(cls,props)
local inst = Instance.new(cls)
for i,v in pairs(props) do
	inst[i] = v
end
return inst
end


local localplayer = game:GetService"Players".LocalPlayer
local uis = game:GetService"UserInputService"

local cheats = {
	b_b = Rise.Esp.Bounding_Box;
	b_f = Rise.Esp.Fill_Box;
	b_f_t = Rise.Esp.Fill_Transparency;
	b_sd = Rise.Esp.Show_Distance;
	b_sn = Rise.Esp.Show_Name;
	b_sh = Rise.Esp.Show_Health;
	b_ht = Rise.Esp.Health_Type;
	b_rt = true;
	b_tc = true;
}

local cheatsf = Instance.new("Folder", game.CoreGui) cheatsf.Name = "cheats"
local espf = Instance.new("Folder", cheatsf) espf.Name = "esp"
if Rise.Esp.Enabled then
    function addEsp(player)
        local bbg = Instance.new("BillboardGui", espf)
        bbg.Name = player.Name
        bbg.AlwaysOnTop = true
        bbg.Size = UDim2.new(4,0,5.4,0)
        bbg.ClipsDescendants = false
        
        local outlines = Instance.new("Frame", bbg)
        outlines.Size = UDim2.new(1,0,1,0)
        outlines.BorderSizePixel = 0
        outlines.BackgroundTransparency = 1
        local left = Instance.new("Frame", outlines)
        left.BorderSizePixel = 0
        left.Size = UDim2.new(0,1,1,0)
        local right = left:Clone()
        right.Parent = outlines
        right.Size = UDim2.new(0,-1,1,0)
        right.Position = UDim2.new(1,0,0,0)
        local up = left:Clone()
        up.Parent = outlines
        up.Size = UDim2.new(1,0,0,1)
        local down = left:Clone()
        down.Parent = outlines
        down.Size = UDim2.new(1,0,0,-1)
        down.Position = UDim2.new(0,0,1,0)
        
        local info = Instance.new("BillboardGui", bbg)
        info.Name = "info"
        info.Size = UDim2.new(3,0,0,54)
        info.StudsOffset = Vector3.new(3.6,-3,0)
        info.AlwaysOnTop = true
        info.ClipsDescendants = false
        local namelabel = Instance.new("TextLabel", info)
        namelabel.Name = "namelabel"
        namelabel.BackgroundTransparency = 1
        namelabel.TextStrokeTransparency = 0
        namelabel.TextXAlignment = Enum.TextXAlignment.Left
        namelabel.Size = UDim2.new(0,100,0,18)
        namelabel.Position = UDim2.new(0,0,0,0)
        namelabel.Text = player.Name
        local distancel = Instance.new("TextLabel", info)
        distancel.Name = "distancelabel"
        distancel.BackgroundTransparency = 1
        distancel.TextStrokeTransparency = 0
        distancel.TextXAlignment = Enum.TextXAlignment.Left
        distancel.Size = UDim2.new(0,100,0,18)
        distancel.Position = UDim2.new(0,0,0,18)
        local healthl = Instance.new("TextLabel", info)
        healthl.Name = "healthlabel"
        healthl.BackgroundTransparency = 1
        healthl.TextStrokeTransparency = 0
        healthl.TextXAlignment = Enum.TextXAlignment.Left
        healthl.Size = UDim2.new(0,100,0,18)
        healthl.Position = UDim2.new(0,0,0,36)
        
        local uill = Instance.new("UIListLayout", info)
        
        local forhealth = Instance.new("BillboardGui", bbg)
        forhealth.Name = "forhealth"
        forhealth.Size = UDim2.new(5,0,6,0)
        forhealth.AlwaysOnTop = true
        forhealth.ClipsDescendants = false
        
        local healthbar = Instance.new("Frame", forhealth)
        healthbar.Name = "healthbar"
        healthbar.BackgroundColor3 = Color3.fromRGB(40,40,40)
        healthbar.BorderColor3 = Color3.fromRGB(0,0,0)
        healthbar.Size = UDim2.new(0.04,0,0.9,0)
        healthbar.Position = UDim2.new(0,0,0.05,0)
        local bar = Instance.new("Frame", healthbar)
        bar.Name = "bar"
        bar.BorderSizePixel = 0
        bar.BackgroundColor3 = Color3.fromRGB(94,255,69)
        bar.AnchorPoint = Vector2.new(0,1)
        bar.Position = UDim2.new(0,0,1,0)
        bar.Size = UDim2.new(1,0,1,0)
        
        local co = coroutine.create(function()
            while wait(0.1) do
                if (player.Character and player.Character:FindFirstChild"HumanoidRootPart") then
                    bbg.Adornee = player.Character.HumanoidRootPart
                    info.Adornee = player.Character.HumanoidRootPart
                    forhealth.Adornee = player.Character.HumanoidRootPart
                    
                    if (player.Team ~= localplayer.Team) then
                        bbg.Enabled = true
                        info.Enabled = true
                        forhealth.Enabled = true
                    end
                    if player.Character:FindFirstChild("ForceField") then
                        outlines.BackgroundTransparency = 0.4
                        left.BackgroundTransparency = 0.4
                        right.BackgroundTransparency = 0.4
                        up.BackgroundTransparency = 0.4
                        down.BackgroundTransparency = 0.4
                        healthl.TextTransparency = 0.4
                        healthl.TextStrokeTransparency = 0.8
                        distancel.TextTransparency = 0.4
                        distancel.TextStrokeTransparency = 0.8
                        namelabel.TextTransparency = 0.4
                        namelabel.TextStrokeTransparency = 0.8
                        bar.BackgroundTransparency = 0.4
                        healthbar.BackgroundTransparency = 0.8
                    else
                        outlines.BackgroundTransparency = 0
                        left.BackgroundTransparency = 0
                        right.BackgroundTransparency = 0
                        up.BackgroundTransparency = 0
                        down.BackgroundTransparency = 0
                        healthl.TextTransparency = 0
                        healthl.TextStrokeTransparency = 0
                        distancel.TextTransparency = 0
                        distancel.TextStrokeTransparency = 0
                        namelabel.TextTransparency = 0
                        namelabel.TextStrokeTransparency = 0
                        bar.BackgroundTransparency = 0
                        healthbar.BackgroundTransparency = 0
                    end
                    if cheats.b_b == true then
                        outlines.Visible = true
                    else
                        outlines.Visible = false
                    end
                    if cheats.b_f == true then
                        if player.Character:FindFirstChild("ForceField") then
                            outlines.BackgroundTransparency = 0.9
                        else
                            outlines.BackgroundTransparency = cheats.b_f_t
                        end
                    else
                        outlines.BackgroundTransparency = 1
                    end
                    if cheats.b_sh == true then
                        if (player.Character:FindFirstChild"Humanoid") then
                            healthl.Text = "Health: "..math.floor(player.Character:FindFirstChild"Humanoid".Health)
                            healthbar.bar.Size = UDim2.new(1,0,player.Character:FindFirstChild"Humanoid".Health/player.Character:FindFirstChild"Humanoid".MaxHealth,0)
                        end
                        if cheats.b_ht == "Text" then
                            healthbar.Visible = false
                            healthl.Visible = true
                        end
                        if cheats.b_ht == "Bar" then
                            healthl.Visible = false
                            healthbar.Visible = true
                        end
                        if cheats.b_ht == "Both" then
                            healthl.Visible = true
                            healthbar.Visible = true
                        end
                    else
                        healthl.Visible = false
                        healthbar.Visible = false
                    end
                    if cheats.b_sn then
                        namelabel.Visible = true
                    else
                        namelabel.Visible = false
                    end
                    if cheats.b_sd == true then
                        distancel.Visible = true
                        if (localplayer.Character and localplayer.Character:FindFirstChild"HumanoidRootPart") then
                            distancel.Text = "Distance: "..math.floor(0.5+(localplayer.Character:FindFirstChild"HumanoidRootPart".Position - player.Character:FindFirstChild"HumanoidRootPart".Position).magnitude)
                        end
                    else
                        distancel.Visible = false
                    end
                    if cheats.b_rt == true then
                        if (player.Team == localplayer.Team) then
                            bbg.Enabled = true
                            info.Enabled = true
                            forhealth.Enabled = true
                        end
                    else
                        if (player.Team == localplayer.Team) then
                            bbg.Enabled = false
                            info.Enabled = false
                            forhealth.Enabled = false
                        end
                    end
                    if cheats.b_tc == true then
                        outlines.BackgroundColor3 = player.TeamColor.Color
                        left.BackgroundColor3 = player.TeamColor.Color
                        right.BackgroundColor3 = player.TeamColor.Color
                        up.BackgroundColor3 = player.TeamColor.Color
                        down.BackgroundColor3 = player.TeamColor.Color
                        healthl.TextColor3 = player.TeamColor.Color
                        distancel.TextColor3 = player.TeamColor.Color
                        namelabel.TextColor3 = player.TeamColor.Color
                    else
                        if (player.Team == localplayer.Team) then
                            outlines.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            left.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            right.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            up.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            down.BackgroundColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            healthl.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            distancel.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                            namelabel.TextColor3 = Color3.fromRGB(ct_r.Text, ct_g.Text, ct_b.Text)
                        else
                            outlines.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            left.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            right.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            up.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            down.BackgroundColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            healthl.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            distancel.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                            namelabel.TextColor3 = Color3.fromRGB(ce_r.Text, ce_g.Text, ce_b.Text)
                        end
                    end
                end
                if not (game:GetService"Players":FindFirstChild(player.Name)) then
                    print(player.Name.." has left. Clearing esp.")
                    espf:FindFirstChild(player.Name):Destroy()
                    coroutine.yield()
                end
            end
        end)
        coroutine.resume(co)
    end

    --main
    do
        wait(2)
        --initial player addition
        for _,v in pairs(game:GetService("Players"):GetChildren()) do
            if not (v.Name == localplayer.Name) then
                if not (espf:FindFirstChild(v.Name)) then
                    addEsp(v)
                end
            end
        end
        
        --auto-update
        while wait(10) do
            for _,v in pairs(game:GetService("Players"):GetChildren()) do
                if not (v.Name == localplayer.Name) then
                    if not (espf:FindFirstChild(v.Name)) then
                        addEsp(v)
                    end
                end
            end
        end
    end
end


if Rise.Silent.AutoPredict then 
    sendnotif(true, "Rise Executed Sucessfully")
    if Rise.AutoPrediction.Enabled then 
            if ping < 275 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P275
            elseif ping < 250 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P250
            elseif ping < 225 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P225
            elseif ping < 200 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P200
            elseif ping < 175 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P175
            elseif ping < 150 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P150
            elseif ping < 130 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P130
            elseif ping < 125 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P125
            elseif ping < 110 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P110
            elseif ping < 105 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P105
            elseif ping < 90 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P90
            elseif ping < 80 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P80
            elseif ping < 70 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P70
            elseif ping < 60 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P60
            elseif ping < 50 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P50
            elseif ping < 40 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P40
            elseif ping < 20 then
                Rise.Silent.Prediction = Rise.AutoPrediction.Sets.P20
            end
        else
            if ping < 130 then
                Rise.Silent.Prediction = ping / 1000 + 0.037
            else
                Rise.Silent.Prediction = ping / 1000 + 0.033
            end
    end
end
