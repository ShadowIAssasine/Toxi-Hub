-- TOXI HUB KEY SYSTEM
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer
 
-- Main Window
local MainWindow = OrionLib:MakeWindow({
    Name = "Toxi Hub // LogIn",
    HidePremium = false,
    SaveConfig = true,
    IntroEnabled = false
})
 
OrionLib:MakeNotification({
    Name = "Welcome To Toxi Hub!",
    Content = "You Are Logged In As "..Player.Name..".",
    Image = "rbxassetid://4483345998",
    Time = 5
})
 
-- Global Variables
_G.Key = "Admin"
_G.KeyInput = ""
 
local function LoadToxiHub()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/main/toxi_hub-admin.lua"))() -- This function is now empty since all other content has been removed.
    orionlib:Destroy()
end
 
-- Notifications
local function ShowCorrectKeyNotification()
    OrionLib:MakeNotification({
        Name = "Correct Key!",
        Content = "Loading Toxi Hub...",
        Image = "rbxassetid://4483345998",
        Time = 2
    })
end
 
local function ShowIncorrectKeyNotification()
    OrionLib:MakeNotification({
        Name = "Incorrect Key!",
        Content = "Enter The Correct Key.",
        Image = "rbxassetid://4483345998",
        Time = 2
    })
end
 
-- Key System
local KeySystemTab = MainWindow:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://2790551206",
    PremiumOnly = false
})
 
KeySystemTab:AddTextbox({
    Name = "Enter Key Here!",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        _G.KeyInput = Value
    end    
})
 
KeySystemTab:AddButton({
    Name = "Check Key",
    Callback = function()
        if _G.KeyInput == _G.Key then
            ShowCorrectKeyNotification()
            wait(2)
            LoadToxiHub()
        else
            ShowIncorrectKeyNotification()
        end
    end    
})
