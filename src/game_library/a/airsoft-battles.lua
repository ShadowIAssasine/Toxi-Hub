﻿local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Toxi Hub // Airsoft Battles	   								     v0.2.1", HidePremium = false, IntroText = "Toxi Hub | Airsoft Battles", SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

-- Loaded

OrionLib:MakeNotification({
	Name = "Toxi Hub // Airsoft Battles",
	Content = "Successfully Logged in. Welcome back!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

-- Toxi CMD

loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/tools/toxi_cmd.lua"))();

-- General

local GeneralTab = Window:MakeTab({
	Name = "General",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = GeneralTab:AddSection({
	Name = "General"
})

GeneralTab:AddButton({
	Name = "DEX Viewer (Only for Script Dev's)",
	Callback = function()
			loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
      		print("Loading...")
  	end    
})

-- Player Tab

local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = PlayerTab:AddSection({
	Name = "Health"
})

PlayerTab:AddToggle({
	Name = "No Health Mods possible due 1-Shot Tag. (Airsoft Rules)",
	Default = false,
	Callback = function(Value)

		print(Value)
	end    
})

local Section = PlayerTab:AddSection({
	Name = "Movement"
})

PlayerTab:AddSlider({
	Name = "Movement Speed",
	Min = 10,
	Max = 500,
	Default = 15,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		print(Value)
	end    
})

PlayerTab:AddTextbox({
	Name = "Custom Movement Speed",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		print(Value)
	end	  
})

PlayerTab:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 500,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Power",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
		print(Value)
	end    
})

PlayerTab:AddTextbox({
	Name = "Custom Jump Power",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
		print(Value)
	end	  
})


-- Game Tab

GameTab:AddButton({
	Name = "Kill All (Rejoin to Disable)",
	Callback = function()
        local function Get_Weapon_Name()
            for _,v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
                if v:IsA("Tool") then
                    return v.Name
                end
            end
        end
        
        while task.wait() do
            for _,v in next, game:GetService("Players"):GetPlayers() do
                if v ~= game:GetService("Players").LocalPlayer then
                    pcall(function()
                        local BulletID = game:GetService("Players").LocalPlayer.Name .. game:GetService("Players").LocalPlayer.UserId .. tick() .. math.random(111, 999) .. math.random(111, 999)
                        local WeaponName = Get_Weapon_Name()
                        if WeaponName ~= nil and game:GetService("Players").LocalPlayer.Character and v.Character and v.Character:FindFirstChild("Head") then
                            game:GetService("ReplicatedStorage").ACS_Engine.Events.ServerBullet:FireServer(unpack(
                                {
                                    [1] = v.Character.Head.Position,
                                    [2] = Vector3.new(0,0,0),
                                    [3] = {["origin"] = v.Character.Head.Position,["weaponName"] = WeaponName,["bulletID"] = BulletID,["currentPenetrationCount"] = 0,["shellSpeed"] = 1,["maxPenetrationCount"] = 1,["penetrationMultiplier"] = 1,["shellType"] = "Bullet",["shellMaxDist"] = 1,["filterDescendants"] = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = workspace.Camera.Viewmodel}}
                                }
                            ))   
        
                            game:GetService("ReplicatedStorage").ACS_Engine.Events.Damage:InvokeServer(unpack(
                                {
                                    [1] = {["origin"] = v.Character.Head.Position,["weaponName"] = WeaponName,["bulletID"] = BulletID,["currentPenetrationCount"] = 0,["shellSpeed"] = 1,["maxPenetrationCount"] = 1,["registeredParts"] = {[v.Character.Head] = true},["penetrationMultiplier"] = 1,["shellType"] = "Bullet",["shellMaxDist"] = 1,["filterDescendants"] = {[1] = game:GetService("Players").LocalPlayer.Character,[2] = workspace.Camera.Viewmodel}},
                                    [2] = v.Character.Humanoid,
                                    [3] = 200,
                                    [4] = 2,
                                    [5] = v.Character.Head,
                                    [6] = 1
                                }
                            ))
                        end
                    end)
                end
            end
        end
      		print("Loading Hub...")
  	end    
})

-----

-- Settings

local SettingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = SettingsTab:AddSection({
	Name = "Main Hub"
})

SettingsTab:AddButton({
	Name = "Back to Main Hub",
	Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/main/toxi_hub-main.lua"))()
      		print("Loading Menu...")
  	end    
})

-----

-- Without it, the Hub won't Work.

orionlib:Init()
