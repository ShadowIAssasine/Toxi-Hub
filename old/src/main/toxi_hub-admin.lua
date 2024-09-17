local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Toxi Hub // Admin Access", HidePremium = false, IntroText = "Toxi Hub | Admin Access", SaveConfig = true, ConfigFolder = "OrionTest"})


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

PlayerTab:AddToggle({
	Name = "Godmode",
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
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ShadowIAssasine/Toxi-Hub/main/src/tools/dex.lua"))()
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

ToolsTab:AddButton({
	Name = "Teleport GUI",
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
