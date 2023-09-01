-- Configuration
getgenv().OldAimPart = "UpperTorso"
getgenv().AimPart = "Head"
getgenv().AimlockKey = Rise.Aimbot.Keybind
getgenv().AimRadius = 30
getgenv().ThirdPerson = Rise.Aimbot.ThirdPerson
getgenv().FirstPerson = Rise.Aimbot.FirstPerson
getgenv().TeamCheck = false
getgenv().PredictMovement = true
getgenv().PredictionVelocity = Rise.Aimbot.Prediction
getgenv().CheckIfJumped = true
getgenv().Smoothness = Rise.Aimbot.Smoothness
getgenv().SmoothnessAmount = Rise.Aimbot.Amount
getgenv().WallCheck = Rise.Aimbot.WallCheck
getgenv().DeathCheck = Rise.Aimbot.DeathCheck
getgenv().ClosestPart = Rise.Aimbot.ClosestPart

local Players, Uis, RService, SGui = game:GetService("Players"), game:GetService("UserInputService"), game:GetService("RunService"), game:GetService("StarterGui")
local Client, Mouse, Camera, CF, RNew, Vec3, Vec2 = Players.LocalPlayer, Players.LocalPlayer:GetMouse(), workspace.CurrentCamera, CFrame.new, Ray.new, Vector3.new, Vector2.new
local Aimlock, MousePressed, CanNotify = true, false, false
local AimlockTarget
local OldPre

getgenv().WorldToViewportPoint = function(P)
    return Camera:WorldToViewportPoint(P)
end

getgenv().WorldToScreenPoint = function(P)
    return Camera.WorldToScreenPoint(Camera, P)
end

getgenv().GetObscuringObjects = function(T)
    if T and T:FindFirstChild(getgenv().AimPart) and Client and Client.Character:FindFirstChild("Head") then
        local RayPos = workspace:FindPartOnRay(RNew(
            T[getgenv().AimPart].Position, Client.Character.Head.Position)
        )
        if RayPos then return RayPos:IsDescendantOf(T) end
    end
end

getgenv().GetNearestTarget = function()
    local players = {}
    local PLAYER_HOLD = {}
    local DISTANCES = {}
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Client then
            table.insert(players, v)
        end
    end
    for i, v in pairs(players) do
        if v.Character and v.Character:FindFirstChild(getgenv().AimPart) then
            local AIM = v.Character:FindFirstChild(getgenv().AimPart)
            local AIM_POSITION = AIM.Position
            local AIM_VELOCITY = AIM.Velocity

            if getgenv().DeathCheck and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health <= 0 then
                continue
            end

            if getgenv().TeamCheck and v.Team ~= Client.Team or not getgenv().TeamCheck then
                local DISTANCE = (AIM_POSITION - Camera.CFrame.p).Magnitude
                local RAY = Ray.new(Camera.CFrame.p, (AIM_POSITION - Camera.CFrame.p).unit * DISTANCE)
                local HIT, POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                local DIFF = math.floor((POS - AIM_POSITION).magnitude)
                local IS_VISIBLE = true

                -- Wall checking
                if getgenv().WallCheck then
                    if getgenv().GetObscuringObjects(v.Character) then
                        IS_VISIBLE = false
                    end
                end

                PLAYER_HOLD[v.Name .. i] = {}
                PLAYER_HOLD[v.Name .. i].dist = DISTANCE
                PLAYER_HOLD[v.Name .. i].plr = v
                PLAYER_HOLD[v.Name .. i].diff = DIFF

                -- Closest part checking
                if getgenv().ClosestPart then
                    local CLOSEST_PART = v.Character:FindPartClosestToPosition(Camera.CFrame.p)
                    if CLOSEST_PART then
                        PLAYER_HOLD[v.Name .. i].closestPart = CLOSEST_PART
                    end
                end

                if IS_VISIBLE then
                    table.insert(DISTANCES, DIFF)
                end
            end
        end
    end

    if #DISTANCES == 0 then
        return nil
    end

    local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
    if L_DISTANCE > getgenv().AimRadius then
        return nil
    end

    for i, v in pairs(PLAYER_HOLD) do
        if v.diff == L_DISTANCE then
            return v.plr, v.closestPart
        end
    end
    return nil
end

Mouse.KeyDown:Connect(function(a)
    if not (Uis:GetFocusedTextBox()) then 
        if a == AimlockKey and AimlockTarget == nil then
            pcall(function()
                if MousePressed ~= true then MousePressed = true end 
                local Target, ClosestPart = GetNearestTarget()
                if Target ~= nil then 
                    AimlockTarget = Target
                    if ClosestPart and ClosestPart:IsA("BasePart") then
                        getgenv().AimPart = ClosestPart.Name
                    end
                end
            end)
        elseif a == AimlockKey and AimlockTarget ~= nil then
            if AimlockTarget ~= nil then AimlockTarget = nil end
            if MousePressed ~= false then 
                MousePressed = false 
            end
        end
    end
end)

RService.RenderStepped:Connect(function()
    if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then 
        if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 or (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
            CanNotify = true 
        else 
            CanNotify = false 
        end
    elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then 
        if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then 
            CanNotify = true 
        else 
            CanNotify = false 
        end
    elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then 
        if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
            CanNotify = true 
        else 
            CanNotify = false 
        end
    end
    if Aimlock == true and MousePressed == true then 
        if AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild(getgenv().AimPart) then 
            if getgenv().FirstPerson == true then
                if CanNotify == true then
                    if getgenv().PredictMovement == true then
                        if getgenv().Smoothness == true then
                            local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                        else
                            Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                        end
                    elseif getgenv().PredictMovement == false then 
                        if getgenv().Smoothness == true then
                            local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                        else
                            Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                        end
                    end
                end
            end
        end
    end
    if CheckIfJumped == true then
        if AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild("Humanoid") then
            if AimlockTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().AimPart = "UpperTorso"
            else
                getgenv().AimPart = getgenv().OldAimPart
            end
        end
    end
end)
