local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/tools/toxi_cmd.lua"))()

local Window = Fluent:CreateWindow({
    Icon = "biohazard",
    Title = "Toxi Hub | Admin Access (BETA) 0.1.0-dev",
    SubTitle = "by ShadowIGamingYT",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Info = Window:AddTab({ Title = "Information", Icon = "book" }),
    Admin = Window:AddTab({ Title = "Admin", Icon = "dollar-sign" }),
    Vip = Window:AddTab({ Title = "VIP", Icon = "crown" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Server = Window:AddTab({ Title = "Server", Icon = "radio" }),
    Game = Window:AddTab({ Title = "Game", Icon = "gamepad-2" }),
    Weapon = Window:AddTab({ Title = "Weapon", Icon = "crosshair" }),
    Script = Window:AddTab({ Title = "Scripts", Icon = "scroll" }),
    Tool = Window:AddTab({ Title = "Tools", Icon = "wrench" }),
    Beta = Window:AddTab({ Title = "BETA", Icon = "flask-conical" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Toxi Hub (BETA)",
        Content = "Welcome and Thanks for Using Toxi Hub",
        SubContent = "made by ShadowIGamingYT", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



    Tabs.Info:AddParagraph({
        Title = "Interface",
        Content = "Toggle UI with LeftControl"
    })


-- Admin Section

    Tabs.Admin:AddButton({
        Title = "BTools",
        Description = "This gives you Admin Tools",
        Callback = function()
            Window:Dialog({
                Title = "!Attention!",
                Content = "This will Add Admin Tools into your Inventory!",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
                        print("")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        print("")
                        end
                    }
                }
            })
        end
    })

    Tabs.Admin:AddButton({
        Title = "Admin GUI",
        Description = "This Activates the Admin GUI!",
        Callback = function()
            Window:Dialog({
                Title = "!Attention!",
                Content = "This will Run the Admin GUI Panel!",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/tools/admin_gui.lua"))()
                        print("")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("")
                        end
                    }
                }
            })
        end
    })


-- Player Section

    Tabs.Player:AddButton({
        Title = "Godmode",
        Description = "This Activates Invincibillity",
        Callback = function()
            Window:Dialog({
                Title = "!Attention!",
                Content = "Godmode is Currently Disabled!",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("")
                        end
                    }
                }
            })
        end
    })
    
    local Slider = Tabs.Player:AddSlider("Slider", {
        Title = "Walkspeed",
        Description = "Change your Walkspeed",
        Default = 10,
        Min = 10,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            print(Value)
        end
    })

    local Input = Tabs.Player:AddInput("Input", {
        Title = "Change your Walkspeed",
        Default = "",
        Placeholder = "Walkspeed",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)

    local Slider = Tabs.Player:AddSlider("Slider", {
        Title = "Jumpboost",
        Description = "Change your Jumpboost",
        Default = 50,
        Min = 50,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            print(Value)
        end
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    local Input = Tabs.Player:AddInput("Input", {
        Title = "Change your Jumppower",
        Default = "",
        Placeholder = "Jumpboost",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)

    
-- Script Section

    Tabs.Script:AddButton({
        Title = "Dex Viewer",
        Description = "This is for Developer Only!",
        Callback = function()
            Window:Dialog({
                Title = "!Attention!",
                Content = "Be aware that this Tool is for Developing usage!",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/tools/dex.lua"))()
                            print("")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("")
                        end
                    }
                }
            })
        end
    })

    Tabs.Script:AddButton({
        Title = "Aimhub",
        Description = "This will open an Seperate Window for the Aimbot!",
        Callback = function()
            Window:Dialog({
                Title = "!Attention!",
                Content = "Some Game's will Detect the Usage of an Aimbot!",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
                            print("")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("")
                        end
                    }
                }
            })
        end
    })


-- Tools Section

    local Colorpicker = Tabs.Tool:AddColorpicker("Colorpicker", {
        Title = "Colorpicker",
        Default = Color3.fromRGB(96, 205, 255)
    })

    Colorpicker:OnChanged(function()
        print("Colorpicker changed:", Colorpicker.Value)
    end)

    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



    local TColorpicker = Tabs.Tool:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Description = "but you can change the transparency.",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "TColorpicker changed:", TColorpicker.Value,
            "Transparency:", TColorpicker.Transparency
        )
    end)

-- BETA Section

    Tabs.Beta:AddButton({
        Title = "Teleport GUI",
        Description = "This will open an Seperate Window for the Teleport GUI!",
        Callback = function()
            Window:Dialog({
                Title = "!Attention!",
                Content = "This Tool is still in Beta!",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                                local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()

                                local plrs = game.Players
                                local lp = plrs.LocalPlayer
                            
                                local function updatePlayers(partition)
                                    for _, plr in pairs(plrs:GetPlayers()) do
                                        if plr ~= lp then
                                            partition.new(plr.Name)
                                        end
                                    end
                                end
                            
                                local window1 = engine.new({
                                    text = "Teleport System (BETA)",
                                    size = UDim2.new(300, 200),
                                })
                            
                                window1.open()
                            
                                local tab1 = window1.new({
                                    text = "Manager",
                                })
                            
                                local players = tab1.new("dropdown", {
                                    text = "Players",
                                })
                            
                                updatePlayers(players)
                                    players.event:Connect(function(name)
                                    lp.Character.HumanoidRootPart.CFrame = plrs:FindFirstChild(name).Character.HumanoidRootPart.CFrame
                                end)
                    
                                local refresh_trigger = tab1.new("button", {
                                    text = "Refresh",
                                })
                                refresh_trigger.event:Connect(function()
                                    players:close()
                                    updatePlayers(players)
                                end)
                            print("")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("")
                        end
                    }
                }
            })
        end
    })


    --local Keybind = Tabs.Main:AddKeybind("Keybind", {
    --    Title = "KeyBind (Toggle UI)",
    --    Mode = "Toggle", -- Always, Toggle, Hold
    --    Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

    --    -- Occurs when the keybind is clicked, Value is `true`/`false`
    --    Callback = function(Value)
    --        print("Keybind clicked!", Value)
    --    end,
    --
    --    -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
    --    ChangedCallback = function(New)
    --        print("GUI Toggled!", New)
    --    end
    --})

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    --Keybind:OnClick(function()
    --    print("GUI Toggled!", Keybind:GetState())
    --end)

    --Keybind:OnChanged(function()
    --    print("Keybind changed:", Keybind.Value)
    --end)

    --task.spawn(function()
    --    while true do
    --        wait(1)
    --
    --        -- example for checking if a keybind is being pressed
    --        local state = Keybind:GetState()
    --        if state then
    --            print("Keybind is being held down")
    --        end
    --
    --        if Fluent.Unloaded then break end
    --    end
    --end)

    --Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold

end


    -- local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Toggle", Default = false })

    -- Toggle:OnChanged(function()
    --     print("Toggle changed:", Options.MyToggle.Value)
    -- end)

    -- Options.MyToggle:SetValue(false)

    -- local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    --     Title = "Dropdown",
    --     Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    --     Multi = false,
    --     Default = 1,
    -- })

    -- Dropdown:SetValue("four")

    -- Dropdown:OnChanged(function(Value)
    --     print("Dropdown changed:", Value)
    -- end)


    
    -- local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
    --     Title = "Dropdown",
    --     Description = "You can select multiple values.",
    --     Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    --     Multi = true,
    --     Default = {"seven", "twelve"},
    -- })

    -- MultiDropdown:SetValue({
    --     three = true,
    --     five = true,
    --     seven = false
    -- })

    -- MultiDropdown:OnChanged(function(Value)
    --     local Values = {}
    --     for Value, State in next, Value do
    --         table.insert(Values, Value)
    --     end
    --     print("Mutlidropdown changed:", table.concat(Values, ", "))
    -- end)

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Toxi Hub | Admin Access (BETA)",
    Content = "Toxi Hub has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()