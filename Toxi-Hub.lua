local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Toxi Hub | Universal v0.1-dev", HidePremium = false, IntroText = "Toxi Hub", SaveConfig = true, ConfigFolder = "OrionTest"})

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
	Name = "Toxi Hub | Universal",
	Content = "Sucessfully Injected, Have Fun!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

-- Player

local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local PlayerSection = Tab:AddSection({
	Name = "Player"
})

PlayerTab:AddSlider({
	Name = "Movement Speed",
	Min = 25,
	Max = 500,
	Default = 25,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
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
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
		print(Value)
	end    
})

-- Misc

local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local MiscSection = Tab:AddSection({
	Name = "Misc"
})

-- Tools

local ToolsTab = Window:MakeTab({
	Name = "Tools",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local ToolsSection = Tab:AddSection({
	Name = "Tools"
})

ToolsTab:AddButton({
	Name = "Dex Viewer",
	Callback = function()
      		print("Loading...")
  	end    
})

ToolsTab:AddButton({
	Name = "AimHub",
	Callback = function()
      		print("Loading...")
  	end    
})

---

-- Without it, the Hub won't Work.

orionlib:Init()
