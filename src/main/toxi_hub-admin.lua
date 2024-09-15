local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Toxi Hub // Admin Access 										v0.7", HidePremium = false, IntroText = "Toxi Hub | Admin Access", SaveConfig = true, ConfigFolder = "OrionTest"})

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
	Name = "Toxi Hub // Admin Access",
	Content = "Successfully Logged in. Welcome back!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

-- Toxi CMD

loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/tools/toxi_cmd.lua"))();

-- Admin Tools

local AdminTab = Window:MakeTab({
	Name = "Admin",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = AdminTab:AddSection({
	Name = "Admin Tools"
})

AdminTab:AddButton({
	Name = "BTools",
	Callback = function()
			loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
      		print("BTools Granted")
  	end    
})

AdminTab:AddButton({
	Name = "Admin GUI",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/tools/admin_gui.lua"))()
      		print("")
  	end    
})

-- Player

local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = PlayerTab:AddSection({
	Name = "Health"
})

PlayerTab:AddButton({
	Name = "Godmode",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
      		print("Godmode Activated!")
  	end    
})

PlayerTab:AddSlider({
	Name = "Health",
	Min = 0,
	Max = 999999999,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "HP",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
		print(Value)
	end    
})


PlayerTab:AddButton({
	Name = "Suicide/Reset",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
      		print("Suicide/Reset Complete!")
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
	ValueName = "MS",
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
	ValueName = "JP",
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

-- Misc

local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local MiscSection = MiscTab:AddSection({
	Name = "Premium Features"
})

MiscTab:AddButton({
	Name = "Red Demon",
	Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/animated/red-demon.lua"))();
      		print("")
  	end    
})

MiscTab:AddButton({
	Name = "Skull Demon",
	Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/animated/skull-demon.lua"))();
      		print("")
  	end    
})

-- Tools

local ToolsTab = Window:MakeTab({
	Name = "Tools",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = ToolsTab:AddSection({
	Name = "Dev Tools"
})

ToolsTab:AddButton({
	Name = "DEX Viewer",
	Callback = function()
			loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
      		print("Loading...")
  	end    
})

local Section = ToolsTab:AddSection({
	Name = "Universal Scripts"
})

ToolsTab:AddButton({
	Name = "AimHub",
	Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
      		print("Loading...")
  	end    
})

-- Test Scripts

AdminTab:AddButton({
	Name = "Test",
	Callback = function()
			
      		print("")
  	end    
})

-- Without it, the Hub won't Work.

orionlib:Init()
