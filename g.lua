getgenv().Rise = {
    ["Main"] = {
        GUI = true,
        Adonis_BP = false, -- Breaks sometimes (no need to use on regular DH)
        Notifications = false,
        AntiAimViewer = true,
        Resolver = true
    },
    ["Silent"] = {
        Enabled = true,
        HitChance = 100,
        Prediction = 0.155,
        Part = "HumanoidRootPart",
        UseKeybind = true,
        Keybind = "k",
        ClosestPart = false,
        HitParts = "8", -- 4, 8, 16
        Checks = {
            DeathCheck = false,
            VisibleCheck = true
        }
    },
    ["Chat"] = {
        Enabled = true,
        FOV = ".fov",
        Prediction = ".pred",
        HitChance = ".hc",
        AutoPred = ".ap",
        ClosestPart = ".cp",
        Part = ".prt"
    },
    ["AutoPrediction"] = {  -- Credits to Evolution for the sets
        Enabled = true, 
        Sets = {
            P20 = 0.102,
            P40 = 0.125,
            P50 = 0.155,
            P60 = 0.132,
            P70 = 0.136,
            P80 = 0.130,
            P90 = 0.136,
            P105 = 0.138,
            P110 = 0.146,
            P125 = 0.149,
            P130 = 0.151,
            P150 = 0.162,
            P175 = 0.172,
            P200 = 0.185,
            P225 = 0.198,
            P250 = 0.206,
            P275 = 0.214,  
        }
    },
    ["FOV"] = {
        Visible = false,
        Radius = 40,
        Sides = 25,
        Color = Color3.fromRGB(255, 255, 255),
    },
    ["Aimbot"] = {
        Enabled = true,
        Keybind = "c",
        Part = "UpperTorso",
        Prediction = 4.5,
        FirstPerson = true,
        ThirdPerson = true,
        Radius = 35,
        Smoothness = false,
        Amount = 0.0327,
        Checks = {
            DeathCheck = true,
            WallCheck = true
        }
    },
    ["InventorySorter"] = {
        Enabled = true, 
        Keybind = "j", 
        List = {"[Double-Barrel SG]","[Revolver]","[TacticalShotgun]", "[Shotgun]", "[SMG]"} -- up to 9
    },
    ["Macro"] = {
        Enabled = true, 
        Keybind = "q"
    },
    ["Misc"] = {
        MemSpoofer = false,
        Minimum = 500,
        Maximum = 800,

        UseLay = true,
        LayKeybind = "v"
    },
    ["Esp"] = {
        Enabled = true,
        Bounding_Box = true,
        Fill_Box = false, 
        Fill_Transparency = 0.75,
        Show_Distance = false,
        Show_Name = true,
        Show_Health = true, 
        Health_Type = "Bar"
    }
}

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/k4alt/gray/main/Library.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/k4alt/gray/main/theme.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/k4alt/gray/main/save.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Rise CC',
    Center = true, 
    AutoShow = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Silent')


LeftGroupBox:AddToggle('MyToggleEn', {
    Text = 'Enabled',
    Default = true, -- Default value (true / false)
    Tooltip = 'Enables/Disables the silent aim', -- Information shown when you hover over the toggle
})

-- Fetching a toggle object for later use:
-- Toggles.MyToggle.Value

-- Toggles is a table added to getgenv() by the library
-- You index Toggles with the specified index, in this case it is 'MyToggle'
-- To get the state of the toggle you do toggle.Value

-- Calls the passed function when the toggle is updated
Toggles.MyToggleEn:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().DaHoodSettings.SilentAim = Toggles.MyToggleEn.Value
end)

-- Tabboxes are a tiny bit different, but here's a basic example:
--[[

local TabBox = Tabs.Main:AddLeftTabbox() -- Add Tabbox on left side

local Tab1 = TabBox:AddTab('Tab 1')
local Tab2 = TabBox:AddTab('Tab 2')

-- You can now call AddToggle, etc on the tabs you added to the Tabbox
]]

-- Groupbox:AddToggle
-- Arguments: Index, Options



LeftGroupBox:AddInput('MyTextbox', {
    Default = '0.155',
    Numeric = true, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Sets the Prediction', -- Information shown when you hover over the textbox

    Placeholder = 'Prediction', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Auto Prediction',
    Default = false, -- Default value (true / false)
    Tooltip = 'Toggles Auto Prediction', -- Information shown when you hover over the toggle
})


Toggles.MyToggle:OnChanged(function()
    -- xhere we get our toggle object & then get its value
    getgenv().Rise.AutoPrediction.Enabled = Toggles.MyToggle.Value
end)

Options.MyTextbox:OnChanged(function()
    getgenv().DaHoodSettings.Prediction = Options.MyTextbox.Value
end)

LeftGroupBox:AddInput('MyTextbox4', {
    Default = '100',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'HitChance',
    Tooltip = 'Sets the HitChance', -- Information shown when you hover over the textbox

    Placeholder = '100', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})
Options.MyTextbox4:OnChanged(function()
    getgenv().Aiming.HitChance = Options.MyTextbox4.Value
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.MyToggle:SetValue(false)


LeftGroupBox:AddToggle('MyToggleRAH', {
    Text = 'Visible Check',
    Default = true, -- Default value (true / false)
    Tooltip = 'Only locks on when target is visible', -- Information shown when you hover over the toggle
})

-- Fetching a toggle object for later use:
-- Toggles.MyToggle.Value

-- Toggles is a table added to getgenv() by the library
-- You index Toggles with the specified index, in this case it is 'MyToggle'
-- To get the state of the toggle you do toggle.Value

-- Calls the passed function when the toggle is updated
Toggles.MyToggleRAH:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Aiming.VisibleCheck = Toggles.MyToggleRAH.Value
end)

LeftGroupBox:AddToggle('MyToggleRAHHH', {
    Text = 'Death Check',
    Default = true, -- Default value (true / false)
    Tooltip = 'Only locks on when target is alive', -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('MyToggleRAHHHHHHH', {
    Text = 'Grabbed Check',
    Default = true, -- Default value (true / false)
    Tooltip = 'Doesnt Lock on when target is grabbed', -- Information shown when you hover over the toggle
})


-- Arguments: None

LeftGroupBox:AddDropdown('MyDropdown', {
    Values = { 'HumanoidRootPart', 'UpperTorso', 'LowerTorso', 'Head'},
    Default = 2, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Part',
    Tooltip = 'What part to aim at (non closest part)', -- Information shown when you hover over the textbox
})

Options.MyDropdown:OnChanged(function()
    getgenv().Aiming.TargetPart = Options.MyDropdown.Value
end)

LeftGroupBox:AddToggle('MyToggle2', {
    Text = 'Closest Part',
    Default = true, -- Default value (true / false)
    Tooltip = 'Sets Part to Nearest From Mouse', -- Information shown when you hover over the toggle
})

Toggles.MyToggle2:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Rise.Silent.ClosestPart = Toggles.MyToggle2.Value
end)

LeftGroupBox:AddInput('MyTextboxers', {
    Default = '8',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'HitParts',
    Tooltip = '4, 8, 16 only', -- Information shown when you hover over the textbox

    Placeholder = '8', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})


LeftGroupBox:AddInput('MyTextboxKeyPl', {
    Default = 'k',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Keybind',
    Tooltip = 'Sets the Keybind', -- Information shown when you hover over the textbox

    Placeholder = 'Toggle Key', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextboxKeyPl:OnChanged(function()
    getgenv().Rise.Silent.Keybind = Options.MyTextboxKeyPl.Value
end)


LeftGroupBox:AddToggle('MyToggleUseKey', {
    Text = 'Use Keybind',
    Default = true, -- Default value (true / false)
    Tooltip = 'Use Silent Keybind', -- Information shown when you hover over the toggle
})

-- Calls the passed function when the toggle is updated
Toggles.MyToggleUseKey:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().usekeybindtoggle = Toggles.MyToggleUseKey.Value
end)

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('FOV')
-- Groupbox:AddSlider
-- Arguments: Idx, Options
LeftGroupBox:AddToggle('MyToggle3', {
    Text = 'Visible: ',
    Default = true, -- Default value (true / false)
    Tooltip = 'Toggles FOV Visibility', -- Information shown when you hover over the toggle
})



-- Calls the passed function when the toggle is updated
Toggles.MyToggle3:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Aiming.ShowFOV = Toggles.MyToggle3.Value
end)

LeftGroupBox:AddSlider('MySlider', {
    Text = 'Radius: ',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 25,
    Min = 1,
    Max = 75,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

-- Options is a table added to getgenv() by the library

local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
    getgenv().Aiming.FOV = Options.MySlider.Value
end)

-- This should print to the console: "MySlider was changed! New value: 3"
Options.MySlider:SetValue(3)
Toggles.MyToggle2:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Rise.Silent.ClosestPart = Toggles.MyToggle.Value
end)



LeftGroupBox:AddLabel('Color: '):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0), -- Bright green
    Title = 'Some color', -- Optional. Allows you to have a custom color picker title (when you open it)
})













local RightGroupBox = Tabs.Main:AddRightGroupbox('Tracer')


RightGroupBox:AddInput('MyTextboxKey', {
    Default = 'q',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Keybind',
    Tooltip = 'Sets the Keybind', -- Information shown when you hover over the textbox

    Placeholder = 'Toggle Key', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextboxKey:OnChanged(function()
    getgenv().AimlockKey = Options.MyTextboxKey.Value
end)

RightGroupBox:AddDropdown('MyDropdown2', {
    Values = { 'HumanoidRootPart', 'UpperTorso', 'LowerTorso', 'Head'},
    Default = 2, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Part',
    Tooltip = 'What part to aim at (non closest part)', -- Information shown when you hover over the textbox
})

Options.MyDropdown2:OnChanged(function()
    key21 = Options.MyDropdown2.Value
end)

RightGroupBox:AddInput('MyTextboxPred', {
    Default = '7.64',
    Numeric = true, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Sets the Prediction', -- Information shown when you hover over the textbox

    Placeholder = 'Prediction Amount', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextboxPred:OnChanged(function()
    getgenv().PredictionVelocity = Options.MyTextboxPred.Value
end)


RightGroupBox:AddToggle('MyToggleSmooth', {
    Text = 'Smoothness',
    Default = true, -- Default value (true / false)
    Tooltip = 'Smoothness (makes you look more legit)', -- Information shown when you hover over the toggle
})
RightGroupBox:AddSlider('MySliderAM', {
    Text = 'Smoothness: ',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 0.5,
    Min = 0.01,
    Max = 1,
    Rounding = 2,

    Compact = false, -- If set to true, then it will hide the label
})

-- Options is a table added to getgenv() by the library

Options.MySliderAM:OnChanged(function()
    getgenv().SmoothnessAmount = Options.MySliderAM.Value
end)

Toggles.MyToggleSmooth:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Smoothness = Toggles.MyToggleSmooth.Value
end)
local RightGroupBox = Tabs.Main:AddRightGroupbox('Checks')

RightGroupBox:AddToggle('MyToggleFP', {
    Text = 'First-Person',
    Default = true, -- Default value (true / false)
    Tooltip = 'Traces in first person', -- Information shown when you hover over the toggle
})

Toggles.MyToggleFP:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().FirstPerson = Toggles.MyToggleFP.Value
end)
RightGroupBox:AddToggle('MyToggleTP', {
    Text = 'Third-Person',
    Default = true, -- Default value (true / false)
    Tooltip = 'Traces in third person', -- Information shown when you hover over the toggle
})

Toggles.MyToggleTP:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().ThirdPerson = Toggles.MyToggleTP.Value
end)

RightGroupBox:AddLabel('-----------------')

RightGroupBox:AddToggle('MyToggleWA', {
    Text = 'Death Check',
    Default = true, -- Default value (true / false)
    Tooltip = 'Unlocks on player death', -- Information shown when you hover over the toggle
})

Toggles.MyToggleWA:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().DeathCheck = Toggles.MyToggleWA.Value
end)

RightGroupBox:AddToggle('MyToggleYE', {
    Text = 'Wall Check',
    Default = true, -- Default value (true / false)
    Tooltip = 'Unlocks if player is behind wall.', -- Information shown when you hover over the toggle
})

local RightGroupBox = Tabs.Main:AddRightGroupbox('Misc')

RightGroupBox:AddToggle('MyToggleINV', {
    Text = 'Inventory Sorter',
    Default = true, -- Default value (true / false)
    Tooltip = 'Sorts inventory on keybind', -- Information shown when you hover over the toggle
})

Toggles.MyToggleINV:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Rise.InventorySorter.Enabled = Toggles.MyToggleWA.Value
end)

RightGroupBox:AddToggle('MyToggleMACRO', {
    Text = 'Macro',
    Default = true, -- Default value (true / false)
    Tooltip = 'Does first person macro', -- Information shown when you hover over the toggle
})

Toggles.MyToggleMACRO:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Rise.Macro.Enabled = Toggles.MyToggleMACRO.Value
end)

RightGroupBox:AddToggle('MyToggleCMD', {
    Text = 'Chat Commands',
    Default = true, -- Default value (true / false)
    Tooltip = 'Uses Chat commands', -- Information shown when you hover over the toggle
})

Toggles.MyToggleCMD:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Rise.Chat.Enabled = Toggles.MyToggleCMD.Value
end)


-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)

-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'V', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Addsƒour MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 
-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config 
-- which has been marked to be one that auto loads!
