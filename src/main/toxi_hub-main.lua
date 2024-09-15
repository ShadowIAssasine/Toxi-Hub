local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Toxi Hub // Main Access 										v0.2.1", HidePremium = false, IntroText = "Toxi Hub | Main Access", SaveConfig = true, ConfigFolder = "OrionTest"})

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
	Name = "Toxi Hub // Main Access",
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
	Name = "Admin Access",
	Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/admin_login.lua"))()
      		print("Loading Hub...")
  	end    
})


-- Game Library

local GameTab = Window:MakeTab({
	Name = "Game Library",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = GameTab:AddSection({
	Name = "A"
})

GameTab:AddButton({
	Name = "Airsoft Battles",
	Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/airsoftbattles.lua"))()
      		print("Loading Hub...")
  	end    
})

local Section = GameTab:AddSection({
	Name = "B"
})

local Section = GameTab:AddSection({
	Name = "C"
})

local Section = GameTab:AddSection({
	Name = "D"
})

local Section = GameTab:AddSection({
	Name = "E"
})

local Section = GameTab:AddSection({
	Name = "F"
})

local Section = GameTab:AddSection({
	Name = "G"
})

local Section = GameTab:AddSection({
	Name = "H"
})

local Section = GameTab:AddSection({
	Name = "I"
})

local Section = GameTab:AddSection({
	Name = "J"
})

local Section = GameTab:AddSection({
	Name = "K"
})

local Section = GameTab:AddSection({
	Name = "L"
})

local Section = GameTab:AddSection({
	Name = "M"
})

local Section = GameTab:AddSection({
	Name = "N"
})

local Section = GameTab:AddSection({
	Name = "O"
})

local Section = GameTab:AddSection({
	Name = "P"
})

local Section = GameTab:AddSection({
	Name = "Q"
})

local Section = GameTab:AddSection({
	Name = "R"
})

local Section = GameTab:AddSection({
	Name = "S"
})

local Section = GameTab:AddSection({
	Name = "T"
})

local Section = GameTab:AddSection({
	Name = "U"
})

local Section = GameTab:AddSection({
	Name = "V"
})

local Section = GameTab:AddSection({
	Name = "W"
})

local Section = GameTab:AddSection({
	Name = "X"
})

local Section = GameTab:AddSection({
	Name = "Y"
})

local Section = GameTab:AddSection({
	Name = "Z"
})



-- Without it, the Hub won't Work.

orionlib:Init()
