Player=game:GetService("Players").LocalPlayer
Character=Player.Character 
PlayerGui=Player.PlayerGui 
Backpack=Player.Backpack 
Torso=Character.Torso 
Head=Character.Head 
Humanoid=Character.Humanoid
m=Instance.new('Model',Character)
LeftArm=Character["Left Arm"] 
LeftLeg=Character["Left Leg"] 
RightArm=Character["Right Arm"] 
RightLeg=Character["Right Leg"] 
LS=Torso["Left Shoulder"] 
LH=Torso["Left Hip"] 
RS=Torso["Right Shoulder"] 
RH=Torso["Right Hip"] 
Face = Head.face
Neck=Torso.Neck
it=Instance.new
attacktype=1
vt=Vector3.new
cf=CFrame.new
euler=CFrame.fromEulerAnglesXYZ
angles=CFrame.Angles
cloaked=false
necko=cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
necko2=cf(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
LHC0=cf(-1,-1,0,-0,-0,-1,0,1,0,1,0,0)
LHC1=cf(-0.5,1,0,-0,-0,-1,0,1,0,1,0,0)
RHC0=cf(1,-1,0,0,0,1,0,1,0,-1,-0,-0)
RHC1=cf(0.5,1,0,0,0,1,0,1,0,-1,-0,-0)
RootPart=Character.HumanoidRootPart
RootJoint=RootPart.RootJoint
RootCF=euler(-1.57,0,3.14)
attack = false 
attackdebounce = false 
deb=false
equipped=true
hand=false
MMouse=nil
combo=0
mana=0
trispeed=1
pathtrans=.7
attackmode='none'
local idle=0
local Anim="Idle"
local Effects={}
local gun=false
local shoot=false
player=nil 
cloak=false


----------------------------------------
local p = game.Players.LocalPlayer
local char = p.Character
local mouse = p:GetMouse()
local larm = char["Left Arm"]
local rarm = char["Right Arm"]
local lleg = char["Left Leg"]
local rleg = char["Right Leg"]
local hed = char.Head
local torso = char.Torso
local hum = char.Humanoid
local cam = game.Workspace.CurrentCamera
local root = char.HumanoidRootPart
local rj = root.RootJoint
local deb = false
local shot = 0
local stanceToggle = "Idle1"
local l = game:GetService("Lighting")
local rs = game:GetService("RunService").RenderStepped
local hb = game:GetService("RunService").Heartbeat
local Stepped = game:GetService("RunService").Stepped
math.randomseed(os.time())
----------------------------------------------------
fat = Instance.new("BindableEvent",script)
fat.Name = "Heartbeat"

script:WaitForChild("Heartbeat")

frame = 1/30
tf = 0
allowframeloss = false --if set to true will fire every frame it possibly can. This will result in multiple events happening at the same time whenever delta returns frame*2 or greater.
tossremainder = false --if set to true t will be set to 0 after Fire()-ing.
lastframe = tick()
script.Heartbeat:Fire() --ayy lmao

game:GetService("RunService").Heartbeat:connect(function(s,p) --herp derp
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe=tick()
		else
			--print("FIRED "..math.floor(t/frame).." FRAME(S)","REMAINDER "..(t - frame*(math.floor(t/frame))))
			for i=1, math.floor(tf/frame) do
				script.Heartbeat:Fire()
			end
			lastframe=tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf/frame)
		end
	end
end)

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		fat.Event:wait()
	else
		for i = 1, NUMBER do
			fat.Event:wait()
		end
	end
end
----------------------------------------------------
Debounces = {
CanAttack = true;
CanJoke = true;
NoIdl = false;
Slashing = false;
Slashed = false;
ks = false;
}
----------------------------------------------------

function lerp(a, b, t) -- Linear interpolation
	return a + (b - a)*t
end
 
function slerp(a, b, t) --Spherical interpolation
	dot = a:Dot(b)
	if dot > 0.99999 or dot < -0.99999 then
		return t <= 0.5 and a or b
	else
		r = math.acos(dot)
		return (a*math.sin((1 - t)*r) + b*math.sin(t*r)) / math.sin(r)
	end
end
 
function matrixInterpolate(a, b, t)
	local ax, ay, az, a00, a01, a02, a10, a11, a12, a20, a21, a22 = a:components()
	local bx, by, bz, b00, b01, b02, b10, b11, b12, b20, b21, b22 = b:components()
	local v0 = lerp(Vector3.new(ax, ay, az), Vector3.new(bx , by , bz), t) -- Position
	local v1 = slerp(Vector3.new(a00, a01, a02), Vector3.new(b00, b01, b02), t) -- Vector  right
	local v2 = slerp(Vector3.new(a10, a11, a12), Vector3.new(b10, b11, b12), t) -- Vector  up
	local v3 = slerp(Vector3.new(a20, a21, a22), Vector3.new(b20, b21, b22), t) -- Vector  back
	local t = v1:Dot(v2)
	if not (t < 0 or t == 0 or t > 0) then 	-- Failsafe
		return CFrame.new()
	end
	return CFrame.new(
	v0.x, v0.y, v0.z,
	v1.x, v1.y, v1.z,
	v2.x, v2.y, v2.z,
	v3.x, v3.y, v3.z)
end
----------------------------------------------------
function genWeld(a,b)
    local w = Instance.new("Weld",a)
    w.Part0 = a
    w.Part1 = b
    return w
end
function weld(a, b)
    local weld = Instance.new("Weld")
    weld.Name = "W"
    weld.Part0 = a
    weld.Part1 = b
    weld.C0 = a.CFrame:inverse() * b.CFrame
    weld.Parent = a
    return weld;
end
----------------------------------------------------
function Lerp(c1,c2,al)
	local com1 = {c1.X,c1.Y,c1.Z,c1:toEulerAnglesXYZ()}
	local com2 = {c2.X,c2.Y,c2.Z,c2:toEulerAnglesXYZ()}
	for i,v in pairs(com1) do 
		com1[i] = v+(com2[i]-v)*al
	end
	return CFrame.new(com1[1],com1[2],com1[3]) * CFrame.Angles(select(4,unpack(com1)))
end
----------------------------------------------------
newWeld = function(wp0, wp1, wc0x, wc0y, wc0z)
	local wld = Instance.new("Weld", wp1)
	wld.Part0 = wp0
	wld.Part1 = wp1
	wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
end
----------------------------------------------------
newWeld(torso, larm, -1.5, 0.5, 0)
larm.Weld.C1 = CFrame.new(0, 0.5, 0)
newWeld(torso, rarm, 1.5, 0.5, 0)
rarm.Weld.C1 = CFrame.new(0, 0.5, 0)
newWeld(torso, hed, 0, 1.5, 0)
newWeld(torso, lleg, -0.5, -1, 0)
lleg.Weld.C1 = CFrame.new(0, 1, 0)
newWeld(torso, rleg, 0.5, -1, 0)
rleg.Weld.C1 = CFrame.new(0, 1, 0)
newWeld(root, torso, 0, -1, 0)
torso.Weld.C1 = CFrame.new(0, -1, 0)
----------------------------------------------------

----------------------------------------------------



----{{ Torso Skin }}--------

local TBlast, TBMesh = Instance.new("Part"), Instance.new("SpecialMesh")
	TBlast.BrickColor = BrickColor.new("Deep orange")
	TBlast.Transparency = 1
	TBlast.Anchored = true
	TBlast.CanCollide = false
	TBlast.CFrame = root.CFrame
	TBlast.Size = Vector3.new(2,2,2)
	TBMesh.Parent = TBlast
	TBMesh.MeshType = "Sphere"
	
	local TB, TM = Instance.new("Part"), Instance.new("SpecialMesh")
	TB.BrickColor = BrickColor.new("Deep orange")
	TB.Transparency = 1
	TB.Anchored = true
	TB.CanCollide = false
	TB.CFrame = root.CFrame
	TB.Size = Vector3.new(2,2,2)
	TB.Parent = TBlast
	TM.MeshType = "Sphere"
	
	
	game.Lighting.Brightness = 0
		game.Lighting.OutdoorAmbient = TB.BrickColor.Color
		game.Lighting.TimeOfDay = 0.1
		game.Lighting.FogEnd = 1000
		game.Lighting.FogColor = TB.BrickColor.Color
		game.Lighting.TimeOfDay = "00:00:00"
		game.Lighting.Ambient = Color3.new(0,0,0)
		game.Lighting.FogColor = Color3.new(0,0,0)
		game.Lighting.FogEnd = 500
		game.Lighting.FogStart = 0
		game.Lighting.GlobalShadows = true
		
	
LightOnBody = Instance.new("PointLight", hed)
LightOnBody.Brightness = 3000
LightOnBody.Range = 20
LightOnBody.Color = TBlast.BrickColor.Color
z = Instance.new("Sound",char) --Smile: print("ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?ÃƒÂ¢? ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬ÃƒÂ¢?Ã‚Â¢ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬ ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢??Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢??Ãƒâ€šÃ‚Â¢ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢??Ãƒâ€šÃ‚Â¬ ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’?Ãƒâ€šÃ‚Â¬ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬Ãƒâ€¦Ã‚Â¾ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?ÃƒÂ¢? ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬ÃƒÂ¢?Ã‚Â¢ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’?Ãƒâ€šÃ‚Â¬ÃƒÆ’?ÃƒÂ¢?Ã‚Â¦ÃƒÆ’?Ãƒâ€šÃ‚Â¡ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢??Ãƒâ€šÃ‚Â¬ÃƒÆ’?Ãƒâ€šÃ‚Â¡ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?Ãƒâ€šÃ‚Â¢?ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?ÃƒÂ¢? ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬ÃƒÂ¢?Ã‚Â¢ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬ ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢??Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢??Ãƒâ€šÃ‚Â¢ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢??Ãƒâ€šÃ‚Â¬ÃƒÆ’?Ãƒâ€šÃ‚Â¡ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?Ãƒâ€šÃ‚Â¬ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬Ãƒâ€šÃ‚Â¦ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?Ãƒâ€šÃ‚Â¡ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?ÃƒÂ¢? ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬ÃƒÂ¢?Ã‚Â¢ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’?Ãƒâ€šÃ‚Â¬ÃƒÆ’?ÃƒÂ¢?Ã‚Â¦ÃƒÆ’?Ãƒâ€šÃ‚Â¡ÃƒÆ��?Ãƒâ€ ?ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢??Ãƒâ€šÃ‚Â¬ÃƒÆ’?Ãƒâ€šÃ‚Â¡ÃƒÆ’?Ãƒâ€ ?ÃƒÆ’Ã‚Â¢ÃƒÂ¢?Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’?ÃƒÂ¢??ÃƒÆ’?Ãƒâ€šÃ‚Âº")
z.SoundId = "rbxassetid://621339355"--410761150, 411368002
z.Looped = true
z.Pitch = 1
z.Volume = 7
wait(0.1)
z:Play()

local Orbd = Instance.new("Part", char)
Orbd.Name = "Orbd"
Orbd.Shape = Enum.PartType.Ball
Orbd.CanCollide = false
Orbd.BrickColor = BrickColor.new("Deep orange")
Orbd.Transparency = 0
Orbd.Material = "Neon"
Orbd.Size = Vector3.new(0.2, 0.2, 0.2)
Orbd.TopSurface = Enum.SurfaceType.Smooth
Orbd.BottomSurface = Enum.SurfaceType.Smooth

local Weld = Instance.new("Weld", Orbd)
Weld.Part0 = char.Head
Weld.Part1 = Orbd
Weld.C1 = CFrame.new(-0.2, -0.2, 0.5)

local Orbvc = Instance.new("Part", char)
Orbvc.Name = "Orbvc"
Orbvc.Shape = Enum.PartType.Ball
Orbvc.CanCollide = false
Orbvc.BrickColor = BrickColor.new("Deep orange")
Orbvc.Transparency = 0
Orbvc.Material = "Neon"
Orbvc.Size = Vector3.new(0.2, 0.2, 0.2)
Orbvc.TopSurface = Enum.SurfaceType.Smooth
Orbvc.BottomSurface = Enum.SurfaceType.Smooth

local Weld = Instance.new("Weld", Orbvc)
Weld.Part0 = char.Head
Weld.Part1 = Orbvc
Weld.C1 = CFrame.new(0.2, -0.2, 0.5)

local plr=game.Players.LocalPlayer
local ch=plr.Character
local head=ch.Head


head.BrickColor = BrickColor.new("Really black")
head.Transparency = 1

function doBrick(parent,pos,cf,size,colour,material,transparency,a,cc,bs,bts,fs,ls,rs,ts)
local p=Instance.new('Part',parent);p.BrickColor=colour;p.Material=material;p.Transparency=transparency;p.Anchored=a;p.CanCollide=cc;p.FormFactor="Custom";p.Size=size;p.BackSurface=bs;p.BottomSurface=bts;p.FrontSurface=fs;p.LeftSurface=ls;p.RightSurface=rs;p.TopSurface=ts;p.Position=pos;p.CFrame=p.CFrame*cf;
return p
end

function doMesh(parent,meshType,meshId,scale)
local m=Instance.new('SpecialMesh',parent);m.MeshType=meshType;m.MeshId=meshId;m.Scale=scale
return m
end


local hm=Instance.new("Model",ch);hm.Name="HelmetModel"

local hat=doBrick(hm,Vector3.new(0,0,0),head.CFrame*CFrame.new(0,0.1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),Vector3.new(1,1,1),BrickColor.new("Really black"),"Granite",0,true,false,10,10,10,10,10,10)
local hoodMesh=doMesh(hat,"FileMesh","http://www.roblox.com/asset/?id=6552202",Vector3.new(3,3,3))

hat.Anchored = false

w = Instance.new("Weld", game.Players.LocalPlayer.Character["Head"])
w.Part0 = game.Players.LocalPlayer.Character["Head"]
w.Part1 = hat
w.C0 = CFrame.new(0, .1, 0)*CFrame.Angles(0, 0, 0)



plr:ClearCharacterAppearance()
wait(0.1)
plr.Character.Head.BrickColor = BrickColor.new("Really black")
plr.Character.Torso.BrickColor = BrickColor.new("Really black")
plr.Character["Right Arm"].BrickColor = BrickColor.new("Really black")
plr.Character["Right Leg"].BrickColor = BrickColor.new("Really black")
plr.Character["Left Leg"].BrickColor = BrickColor.new("Really black")
plr.Character["Left Arm"].BrickColor = BrickColor.new("Really black")
plr.Character.Head.face:Destroy()


local runDummyScript = function(f,scri)
local oldenv = getfenv(f)
local newenv = setmetatable({}, {
__index = function(_, k)
if k:lower() == 'script' then
return scri
else
return oldenv[k]
end
end
})
setfenv(f, newenv)
ypcall(function() f() end)
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting")) 
mas.Name = "CompiledModel"
o1 = Instance.new("Model")
o2 = Instance.new("Part")
o3 = Instance.new("Weld")
o4 = Instance.new("Weld")
o5 = Instance.new("Part")
o6 = Instance.new("Part")
o1.Name = "Torso2"
o1.Parent = mas
o2.Parent = o1
o2.Material = Enum.Material.Neon
o2.BrickColor = BrickColor.new("Deep orange")
o2.Position = Vector3.new(3, 3, 11.5)
o2.Size = Vector3.new(2, 2, 1)
o2.CFrame = CFrame.new(3, 3, 11.5, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o2.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o2.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o2.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o2.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o2.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o2.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o2.Color = Color3.new(1, 0.686275, 0)
o2.Position = Vector3.new(3, 3, 11.5)
o3.Name = "MainWeld"
o3.Parent = o2
o3.C0 = CFrame.new(0.0149998665, 0.62999773, -0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o3.Part0 = o2
o3.Part1 = o5
o4.Name = "MainWeld"
o4.Parent = o2
o4.C0 = CFrame.new(0.0149998665, -0.314815998, -0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o4.Part0 = o2
o4.Part1 = o6
o5.Parent = o1
o5.Material = Enum.Material.Granite
o5.BrickColor = BrickColor.new("Really black")
o5.Position = Vector3.new(3.01499987, 3.62999773, 11.4949999)
o5.Size = Vector3.new(2.04999995, 0.839999557, 1.08999991)
o5.CFrame = CFrame.new(3.01499987, 3.62999773, 11.4949999, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o5.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o5.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o5.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o5.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o5.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o5.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o5.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o5.Position = Vector3.new(3.01499987, 3.62999773, 11.4949999)
o6.Parent = o1
o6.Material = Enum.Material.Granite
o6.BrickColor = BrickColor.new("Really black")
o6.Position = Vector3.new(3.01499987, 2.685184, 11.4949999)
o6.Size = Vector3.new(2.04999995, 0.839999557, 1.08999991)
o6.CFrame = CFrame.new(3.01499987, 2.685184, 11.4949999, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o6.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o6.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o6.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o6.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o6.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o6.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o6.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o6.Position = Vector3.new(3.01499987, 2.685184, 11.4949999)
mas.Parent = workspace
mas:MakeJoints()
local mas1 = mas:GetChildren()
for i=1,#mas1 do
	mas1[i].Parent = workspace 
	ypcall(function() mas1[i]:MakeJoints() end)
end
mas:Destroy()
for i=1,#cors do
coroutine.resume(cors[i])
end


wait()

workspace["Torso2"].Parent = game.Players.LocalPlayer.Character

game.Players.LocalPlayer.Character["Torso2"].Name = "Familiar Torso2"

w = Instance.new("Weld", game.Players.LocalPlayer.Character["Torso"])
w.Part0 = game.Players.LocalPlayer.Character["Torso"]
w.Part1 = o2
w.C0 = CFrame.new(0, 0, 0)*CFrame.Angles(0, 0, 0)
game.Players.LocalPlayer.Character["Torso"].Transparency = 1

for i,v in pairs (game.Players.LocalPlayer.Character["Familiar Torso2"]:GetChildren()) do
	if v.ClassName == "Part" then
	v.CanCollide = false
	v.Anchored = false
	end
end



---{{Right Arm}}--------
local runDummyScript = function(f,scri)
local oldenv = getfenv(f)
local newenv = setmetatable({}, {
__index = function(_, k)
if k:lower() == 'script' then
return scri
else
return oldenv[k]
end
end
})
setfenv(f, newenv)
ypcall(function() f() end)
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting")) 
mas.Name = "CompiledModel"
o1 = Instance.new("Model")
o2 = Instance.new("Part")
o3 = Instance.new("Weld")
o4 = Instance.new("Weld")
o5 = Instance.new("Weld")
o6 = Instance.new("Weld")
o7 = Instance.new("Weld")
o8 = Instance.new("Weld")
o9 = Instance.new("Weld")
o10 = Instance.new("Weld")
o11 = Instance.new("Part")
o12 = Instance.new("Part")
o13 = Instance.new("Part")
o14 = Instance.new("Model")
o15 = Instance.new("Part")
o16 = Instance.new("Weld")
o17 = Instance.new("Weld")
o18 = Instance.new("Weld")
o19 = Instance.new("Weld")
o20 = Instance.new("Part")
o21 = Instance.new("Part")
o22 = Instance.new("Part")
o23 = Instance.new("Part")
o1.Name = "RightArm"
o1.Parent = mas
o2.Parent = o1
o2.Material = Enum.Material.Neon
o2.BrickColor = BrickColor.new("Deep orange")
o2.Position = Vector3.new(-3.5987432, 0.987944722, 11.4995985)
o2.Rotation = Vector3.new(-0.00999999978, 0, 0.00999999978)
o2.Size = Vector3.new(1, 2, 1)
o2.CFrame = CFrame.new(-3.5987432, 0.987944722, 11.4995985, 1, -0.00018174194, 7.21687247e-05, 0.000181727533, 0.99999994, 0.000199583432, -7.22049954e-05, -0.000199570306, 1)
o2.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o2.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o2.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o2.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o2.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o2.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o2.Color = Color3.new(1, 0.686275, 0)
o2.Position = Vector3.new(-3.5987432, 0.987944722, 11.4995985)
o3.Name = "MainWeld"
o3.Parent = o2
o3.C0 = CFrame.new(-0.00500011444, 0.00169897079, 0.00500106812, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o3.Part0 = o2
o3.Part1 = o12
o4.Name = "MainWeld"
o4.Parent = o2
o4.C0 = CFrame.new(-0.00500011444, -0.587784529, 0.00500106812, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o4.Part0 = o2
o4.Part1 = o13
o5.Name = "MainWeld"
o5.Parent = o2
o5.C0 = CFrame.new(0.0796999931, 1.02396202, 0.208361626, -0.529894114, 0, 0.848072529, 0, 1, 0, -0.848072529, 0, -0.529894114)
o5.Part0 = o2
o5.Part1 = o23
o6.Name = "MainWeld"
o6.Parent = o2
o6.C0 = CFrame.new(-0.107108831, 1.02396202, 0.158407211, 0.601842105, 0, 0.798615098, 0, 1, 0, -0.798615098, 0, 0.601842105)
o6.Part0 = o2
o6.Part1 = o21
o7.Name = "MainWeld"
o7.Parent = o2
o7.C0 = CFrame.new(0.0340138674, 1.02396202, -0.0815076828, 0.104554683, 0, 0.994519114, 0, 1, 0, -0.994519174, 0, 0.104554668)
o7.Part0 = o2
o7.Part1 = o22
o8.Name = "MainWeld"
o8.Parent = o2
o8.C0 = CFrame.new(-0.00500011444, 0.734998703, 0.00500106812, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o8.Part0 = o2
o8.Part1 = o11
o9.Name = "MainWeld"
o9.Parent = o2
o9.C0 = CFrame.new(0.112232327, 1.02396202, 0.00985622406, 0.933583438, 0, 0.358360171, 0, 1, 0, -0.358360112, 0, 0.933583498)
o9.Part0 = o2
o9.Part1 = o20
o10.Name = "MainWeld"
o10.Parent = o2
o10.C0 = CFrame.new(-0.190126657, 1.02396202, -0.0120782852, 0.956306815, 0, -0.292364985, 0, 1, 0, 0.292364985, 0, 0.956306815)
o10.Part0 = o2
o10.Part1 = o15
o11.Parent = o1
o11.Material = Enum.Material.Granite
o11.BrickColor = BrickColor.new("Really black")
o11.Position = Vector3.new(-3.60387659, 1.72294354, 11.5044537)
o11.Rotation = Vector3.new(-0.00999999978, 0, 0.00999999978)
o11.Size = Vector3.new(1.08999991, 0.610000014, 1.04999995)
o11.CFrame = CFrame.new(-3.60387659, 1.72294354, 11.5044537, 1, -0.00018174194, 7.21687247e-05, 0.000181727533, 0.99999994, 0.000199583432, -7.22049954e-05, -0.000199570306, 1)
o11.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o11.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o11.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o11.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o11.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o11.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o11.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o11.Position = Vector3.new(-3.60387659, 1.72294354, 11.5044537)
o12.Parent = o1
o12.Material = Enum.Material.Granite
o12.BrickColor = BrickColor.new("Really black")
o12.Position = Vector3.new(-3.60374331, 0.989643812, 11.5045996)
o12.Rotation = Vector3.new(-0.00999999978, 0, 0.00999999978)
o12.Size = Vector3.new(1.08999991, 0.610000014, 1.04999995)
o12.CFrame = CFrame.new(-3.60374331, 0.989643812, 11.5045996, 1, -0.00018174194, 7.21687247e-05, 0.000181727533, 0.99999994, 0.000199583432, -7.22049954e-05, -0.000199570306, 1)
o12.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o12.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o12.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o12.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o12.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o12.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o12.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o12.Position = Vector3.new(-3.60374331, 0.989643812, 11.5045996)
o13.Parent = o1
o13.Material = Enum.Material.Granite
o13.BrickColor = BrickColor.new("Really black")
o13.Position = Vector3.new(-3.60363603, 0.400160372, 11.5047169)
o13.Rotation = Vector3.new(-0.00999999978, 0, 0.00999999978)
o13.Size = Vector3.new(1.08999991, 0.329999954, 1.04999995)
o13.CFrame = CFrame.new(-3.60363603, 0.400160372, 11.5047169, 1, -0.00018174194, 7.21687247e-05, 0.000181727533, 0.99999994, 0.000199583432, -7.22049954e-05, -0.000199570306, 1)
o13.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o13.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o13.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o13.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o13.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o13.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o13.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o13.Position = Vector3.new(-3.60363603, 0.400160372, 11.5047169)
o14.Name = "Star"
o14.Parent = o1
o15.Parent = o14
o15.Material = Enum.Material.Granite
o15.BrickColor = BrickColor.new("Deep orange")
o15.Position = Vector3.new(-3.78905678, 2.01186967, 11.4873295)
o15.Rotation = Vector3.new(-0.00999999978, -17, 0.00999999978)
o15.Size = Vector3.new(0.0500000007, 0.0500000007, 1)
o15.CFrame = CFrame.new(-3.78905678, 2.01186967, 11.4873295, 0.956327915, -0.00018174194, -0.292295963, 0.000232138496, 0.99999994, 0.000137732219, 0.292295933, -0.000199570306, 0.956327915)
o15.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o15.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o15.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o15.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o15.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o15.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o15.Color = Color3.new(1, 0.686275, 0)
o15.Position = Vector3.new(-3.78905678, 2.01186967, 11.4873295)
o16.Name = "MainWeld"
o16.Parent = o15
o16.C0 = CFrame.new(0.194045544, 0, -0.131924629, -0.190776467, 0, 0.981634915, 0, 1, 0, -0.981634796, 0, -0.190776095)
o16.Part0 = o15
o16.Part1 = o22
o17.Name = "MainWeld"
o17.Parent = o15
o17.C0 = CFrame.new(0.129232407, 0, 0.138762474, 0.34205988, 0, 0.939684212, 0, 1, 0, -0.939682126, 0, 0.34206447)
o17.Part0 = o15
o17.Part1 = o21
o18.Name = "MainWeld"
o18.Parent = o15
o18.C0 = CFrame.new(0.295556545, 0, -0.0674219131, 0.788021266, 0, 0.615649581, 0, 1, 0, -0.615650117, 0, 0.78802079)
o18.Part0 = o15
o18.Part1 = o20
o19.Name = "MainWeld"
o19.Parent = o15
o19.C0 = CFrame.new(0.322481155, 0, 0.131917953, -0.754688084, 0, 0.656095028, 0, 1, 0, -0.656095028, 0, -0.754688084)
o19.Part0 = o15
o19.Part1 = o23
o20.Parent = o14
o20.Material = Enum.Material.Granite
o20.BrickColor = BrickColor.new("Deep orange")
o20.Position = Vector3.new(-3.48669624, 2.01192904, 11.5092421)
o20.Rotation = Vector3.new(-0.0199999996, 21, 0.00999999978)
o20.Size = Vector3.new(0.0500000119, 0.0500000007, 1)
o20.CFrame = CFrame.new(-3.48669624, 2.01192904, 11.5092421, 0.93355757, -0.00018174194, 0.358427554, 9.81350677e-05, 0.99999994, 0.000251451711, -0.358427525, -0.000199570306, 0.93355763)
o20.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o20.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o20.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o20.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o20.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o20.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o20.Color = Color3.new(1, 0.686275, 0)
o20.Position = Vector3.new(-3.48669624, 2.01192904, 11.5092421)
o21.Parent = o14
o21.Material = Enum.Material.Granite
o21.BrickColor = BrickColor.new("Deep orange")
o21.Position = Vector3.new(-3.70602679, 2.01191878, 11.6578093)
o21.Rotation = Vector3.new(-0.0299999993, 53, 0.0199999996)
o21.Size = Vector3.new(0.0500000007, 0.0500000007, 1)
o21.CFrame = CFrame.new(-3.70602679, 2.01191878, 11.6578093, 0.601784468, -0.00018174194, 0.79865855, -5.00190654e-05, 0.99999994, 0.000265248062, -0.79865855, -0.000199570306, 0.601784468)
o21.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o21.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o21.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o21.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o21.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o21.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o21.Color = Color3.new(1, 0.686275, 0)
o21.Position = Vector3.new(-3.70602679, 2.01191878, 11.6578093)
o22.Parent = o14
o22.Material = Enum.Material.Granite
o22.BrickColor = BrickColor.new("Deep orange")
o22.Position = Vector3.new(-3.56492138, 2.01189661, 11.4178839)
o22.Rotation = Vector3.new(-0.109999999, 84, 0.100000001)
o22.Size = Vector3.new(0.0500000007, 0.0500000007, 1)
o22.CFrame = CFrame.new(-3.56492138, 2.01189661, 11.4178839, 0.104482912, -0.00018174194, 0.994526684, -0.000179489085, 0.99999994, 0.000201598872, -0.994526744, -0.000199570306, 0.104482859)
o22.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o22.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o22.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o22.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o22.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o22.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o22.Color = Color3.new(1, 0.686275, 0)
o22.Position = Vector3.new(-3.56492138, 2.01189661, 11.4178839)
o23.Parent = o14
o23.Material = Enum.Material.Granite
o23.BrickColor = BrickColor.new("Deep orange")
o23.Position = Vector3.new(-3.51921415, 2.01196265, 11.7077503)
o23.Rotation = Vector3.new(-179.990005, 58, 179.979996)
o23.Size = Vector3.new(0.0500000007, 0.0500000007, 0.930000067)
o23.CFrame = CFrame.new(-3.51921415, 2.01196265, 11.7077503, -0.529955328, -0.00018174194, 0.848034263, -0.000265557581, 0.99999994, 4.83600379e-05, -0.848034263, -0.000199570306, -0.529955328)
o23.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o23.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o23.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o23.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o23.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o23.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o23.Color = Color3.new(1, 0.686275, 0)
o23.Position = Vector3.new(-3.51921415, 2.01196265, 11.7077503)
mas.Parent = workspace
mas:MakeJoints()
local mas1 = mas:GetChildren()
for i=1,#mas1 do
	mas1[i].Parent = workspace 
	ypcall(function() mas1[i]:MakeJoints() end)
end
mas:Destroy()
for i=1,#cors do
coroutine.resume(cors[i])
end



wait()

workspace["RightArm"].Parent = game.Players.LocalPlayer.Character

game.Players.LocalPlayer.Character["RightArm"].Name = "Familiar Right Arm"

w = Instance.new("Weld", game.Players.LocalPlayer.Character["Right Arm"])
w.Part0 = game.Players.LocalPlayer.Character["Right Arm"]
w.Part1 = o2
w.C0 = CFrame.new(0, 0, 0)*CFrame.Angles(0, 0, 0)
game.Players.LocalPlayer.Character["Right Arm"].Transparency = 1

for i,v in pairs (game.Players.LocalPlayer.Character["Familiar Right Arm"]:GetChildren()) do
	if v.ClassName == "Part" then
	v.CanCollide = false
	v.Anchored = false
	end
end



----{{ Right Leg }}------
--Created with PenguinAnonymous's compiler
--PenguinAnonymous is not responsible for damages caused to your game
--This plugin does not remove things
--PenguinAnonymous cannot be held resonsible for manual deletion for the purpose of testing
--Keep in mind, any items that cause errors in compilation will be skipped and documented within the last line of the disclaimer comments
--Thank you for using my plugin and enjoy :)
--It is free to use
--If you use this plugin to create your own, please give me credit
--Z_V edited my plugin to look like his own and published it without giving me credit, and that makes me very angry
--Errors: 
local runDummyScript = function(f,scri)
local oldenv = getfenv(f)
local newenv = setmetatable({}, {
__index = function(_, k)
if k:lower() == 'script' then
return scri
else
return oldenv[k]
end
end
})
setfenv(f, newenv)
ypcall(function() f() end)
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting")) 
mas.Name = "CompiledModel"
o1 = Instance.new("Model")
o2 = Instance.new("Part")
o3 = Instance.new("Weld")
o4 = Instance.new("Weld")
o5 = Instance.new("Weld")
o6 = Instance.new("Weld")
o7 = Instance.new("Part")
o8 = Instance.new("Part")
o9 = Instance.new("Part")
o10 = Instance.new("Part")
o1.Name = "RightLeg"
o1.Parent = mas
o2.Parent = o1
o2.Material = Enum.Material.Neon
o2.BrickColor = BrickColor.new("Deep orange")
o2.Position = Vector3.new(-4.19035339, 1.01002204, 4.73999977)
o2.Size = Vector3.new(1, 2.01999998, 1)
o2.CFrame = CFrame.new(-4.19035339, 1.01002204, 4.73999977, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o2.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o2.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o2.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o2.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o2.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o2.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o2.Color = Color3.new(1, 0.686275, 0)
o2.Position = Vector3.new(-4.19035339, 1.01002204, 4.73999977)
o3.Name = "MainWeld"
o3.Parent = o2
o3.C0 = CFrame.new(-0.0150003433, -0.154792666, 0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o3.Part0 = o2
o3.Part1 = o9
o4.Name = "MainWeld"
o4.Parent = o2
o4.C0 = CFrame.new(-0.0150003433, -0.639977336, 0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o4.Part0 = o2
o4.Part1 = o10
o5.Name = "MainWeld"
o5.Parent = o2
o5.C0 = CFrame.new(-0.0150003433, 0.345878243, 0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o5.Part0 = o2
o5.Part1 = o8
o6.Name = "MainWeld"
o6.Parent = o2
o6.C0 = CFrame.new(-0.0150003433, 0.799999952, 0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o6.Part0 = o2
o6.Part1 = o7
o7.Parent = o1
o7.Material = Enum.Material.Granite
o7.BrickColor = BrickColor.new("Really black")
o7.Position = Vector3.new(-4.20535374, 1.810022, 4.74499989)
o7.Size = Vector3.new(1.08999991, 0.379999936, 1.06999993)
o7.CFrame = CFrame.new(-4.20535374, 1.810022, 4.74499989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o7.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o7.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o7.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o7.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o7.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o7.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o7.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o7.Position = Vector3.new(-4.20535374, 1.810022, 4.74499989)
o8.Parent = o1
o8.Material = Enum.Material.Granite
o8.BrickColor = BrickColor.new("Really black")
o8.Position = Vector3.new(-4.20535374, 1.35590029, 4.74499989)
o8.Size = Vector3.new(1.08999991, 0.379999936, 1.06999993)
o8.CFrame = CFrame.new(-4.20535374, 1.35590029, 4.74499989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o8.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o8.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o8.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o8.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o8.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o8.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o8.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o8.Position = Vector3.new(-4.20535374, 1.35590029, 4.74499989)
o9.Parent = o1
o9.Material = Enum.Material.Granite
o9.BrickColor = BrickColor.new("Really black")
o9.Position = Vector3.new(-4.20535374, 0.855229378, 4.74499989)
o9.Size = Vector3.new(1.08999991, 0.379999936, 1.06999993)
o9.CFrame = CFrame.new(-4.20535374, 0.855229378, 4.74499989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o9.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o9.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o9.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o9.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o9.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o9.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o9.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o9.Position = Vector3.new(-4.20535374, 0.855229378, 4.74499989)
o10.Parent = o1
o10.Material = Enum.Material.Granite
o10.BrickColor = BrickColor.new("Really black")
o10.Position = Vector3.new(-4.20535374, 0.370044708, 4.74499989)
o10.Size = Vector3.new(1.08999991, 0.379999936, 1.06999993)
o10.CFrame = CFrame.new(-4.20535374, 0.370044708, 4.74499989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o10.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o10.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o10.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o10.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o10.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o10.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o10.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o10.Position = Vector3.new(-4.20535374, 0.370044708, 4.74499989)
mas.Parent = workspace
mas:MakeJoints()
local mas1 = mas:GetChildren()
for i=1,#mas1 do
	mas1[i].Parent = workspace 
	ypcall(function() mas1[i]:MakeJoints() end)
end
mas:Destroy()
for i=1,#cors do
coroutine.resume(cors[i])
end



wait()

workspace["RightLeg"].Parent = game.Players.LocalPlayer.Character

game.Players.LocalPlayer.Character["RightLeg"].Name = "Familiar Right Leg"

w = Instance.new("Weld", game.Players.LocalPlayer.Character["Right Leg"])
w.Part0 = game.Players.LocalPlayer.Character["Right Leg"]
w.Part1 = o2
w.C0 = CFrame.new(0, 0, 0)*CFrame.Angles(0, 0, 0)
game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1

for i,v in pairs (game.Players.LocalPlayer.Character["Familiar Right Leg"]:GetChildren()) do
	if v.ClassName == "Part" then
	v.CanCollide = false
	v.Anchored = false
	end
end




----{{ Left Leg}}--------
local runDummyScript = function(f,scri)
local oldenv = getfenv(f)
local newenv = setmetatable({}, {
__index = function(_, k)
if k:lower() == 'script' then
return scri
else
return oldenv[k]
end
end
})
setfenv(f, newenv)
ypcall(function() f() end)
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting")) 
mas.Name = "CompiledModel"
o1 = Instance.new("Model")
o2 = Instance.new("Part")
o3 = Instance.new("Weld")
o4 = Instance.new("Weld")
o5 = Instance.new("Weld")
o6 = Instance.new("Weld")
o7 = Instance.new("Part")
o8 = Instance.new("Part")
o9 = Instance.new("Part")
o10 = Instance.new("Part")
o1.Name = "LeftLeg"
o1.Parent = mas
o2.Parent = o1
o2.Material = Enum.Material.Neon
o2.BrickColor = BrickColor.new("Deep orange")
o2.Position = Vector3.new(3.73664784, 1.01502204, 4.73999977)
o2.Size = Vector3.new(1, 2.02999997, 1)
o2.CFrame = CFrame.new(3.73664784, 1.01502204, 4.73999977, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o2.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o2.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o2.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o2.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o2.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o2.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o2.Color = Color3.new(1, 0.686275, 0)
o2.Position = Vector3.new(3.73664784, 1.01502204, 4.73999977)
o3.Name = "MainWeld"
o3.Parent = o2
o3.C0 = CFrame.new(-0.0150003433, 0.794999957, 0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o3.Part0 = o2
o3.Part1 = o7
o4.Name = "MainWeld"
o4.Parent = o2
o4.C0 = CFrame.new(-0.0150003433, 0.340878248, 0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o4.Part0 = o2
o4.Part1 = o8
o5.Name = "MainWeld"
o5.Parent = o2
o5.C0 = CFrame.new(-0.0150003433, -0.644977331, 0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o5.Part0 = o2
o5.Part1 = o10
o6.Name = "MainWeld"
o6.Parent = o2
o6.C0 = CFrame.new(-0.0150003433, -0.159792662, 0.00500011444, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o6.Part0 = o2
o6.Part1 = o9
o7.Parent = o1
o7.Material = Enum.Material.Granite
o7.BrickColor = BrickColor.new("Really black")
o7.Position = Vector3.new(3.7216475, 1.810022, 4.74499989)
o7.Size = Vector3.new(1.08999991, 0.379999936, 1.06999993)
o7.CFrame = CFrame.new(3.7216475, 1.810022, 4.74499989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o7.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o7.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o7.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o7.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o7.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o7.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o7.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o7.Position = Vector3.new(3.7216475, 1.810022, 4.74499989)
o8.Parent = o1
o8.Material = Enum.Material.Granite
o8.BrickColor = BrickColor.new("Really black")
o8.Position = Vector3.new(3.7216475, 1.35590029, 4.74499989)
o8.Size = Vector3.new(1.08999991, 0.379999936, 1.06999993)
o8.CFrame = CFrame.new(3.7216475, 1.35590029, 4.74499989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o8.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o8.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o8.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o8.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o8.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o8.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o8.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o8.Position = Vector3.new(3.7216475, 1.35590029, 4.74499989)
o9.Parent = o1
o9.Material = Enum.Material.Granite
o9.BrickColor = BrickColor.new("Really black")
o9.Position = Vector3.new(3.7216475, 0.855229378, 4.74499989)
o9.Size = Vector3.new(1.08999991, 0.379999936, 1.06999993)
o9.CFrame = CFrame.new(3.7216475, 0.855229378, 4.74499989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o9.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o9.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o9.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o9.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o9.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o9.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o9.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o9.Position = Vector3.new(3.7216475, 0.855229378, 4.74499989)
o10.Parent = o1
o10.Material = Enum.Material.Granite
o10.BrickColor = BrickColor.new("Really black")
o10.Position = Vector3.new(3.7216475, 0.370044708, 4.74499989)
o10.Size = Vector3.new(1.08999991, 0.379999936, 1.06999993)
o10.CFrame = CFrame.new(3.7216475, 0.370044708, 4.74499989, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o10.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o10.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o10.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o10.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o10.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o10.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o10.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o10.Position = Vector3.new(3.7216475, 0.370044708, 4.74499989)
mas.Parent = workspace
mas:MakeJoints()
local mas1 = mas:GetChildren()
for i=1,#mas1 do
	mas1[i].Parent = workspace 
	ypcall(function() mas1[i]:MakeJoints() end)
end
mas:Destroy()
for i=1,#cors do
coroutine.resume(cors[i])
end

wait()

workspace["LeftLeg"].Parent = game.Players.LocalPlayer.Character

game.Players.LocalPlayer.Character["LeftLeg"].Name = "Familiar Left Leg"

w = Instance.new("Weld", game.Players.LocalPlayer.Character["Left Leg"])
w.Part0 = game.Players.LocalPlayer.Character["Left Leg"]
w.Part1 = o2
w.C0 = CFrame.new(0, 0, 0)*CFrame.Angles(0, 0, 0)
game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

for i,v in pairs (game.Players.LocalPlayer.Character["Familiar Left Leg"]:GetChildren()) do
	if v.ClassName == "Part" then
	v.CanCollide = false
	v.Anchored = false
	end
end



-----{{ Left Arm}}------
local runDummyScript = function(f,scri)
local oldenv = getfenv(f)
local newenv = setmetatable({}, {
__index = function(_, k)
if k:lower() == 'script' then
return scri
else
return oldenv[k]
end
end
})
setfenv(f, newenv)
ypcall(function() f() end)
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting")) 
mas.Name = "CompiledModel"
o1 = Instance.new("Model")
o2 = Instance.new("Part")
o3 = Instance.new("Weld")
o4 = Instance.new("Weld")
o5 = Instance.new("Weld")
o6 = Instance.new("Weld")
o7 = Instance.new("Weld")
o8 = Instance.new("Weld")
o9 = Instance.new("Weld")
o10 = Instance.new("Weld")
o11 = Instance.new("Part")
o12 = Instance.new("Part")
o13 = Instance.new("Part")
o14 = Instance.new("Model")
o15 = Instance.new("Part")
o16 = Instance.new("Weld")
o17 = Instance.new("Weld")
o18 = Instance.new("Weld")
o19 = Instance.new("Weld")
o20 = Instance.new("Part")
o21 = Instance.new("Part")
o22 = Instance.new("Part")
o23 = Instance.new("Part")
o1.Name = "LeftArm"
o1.Parent = mas
o2.Parent = o1
o2.Material = Enum.Material.Neon
o2.BrickColor = BrickColor.new("Deep orange")
o2.Position = Vector3.new(18.4260292, 0.987944722, 11.4995985)
o2.Rotation = Vector3.new(-0.00999999978, 0, 0.00999999978)
o2.Size = Vector3.new(1, 2, 1)
o2.CFrame = CFrame.new(18.4260292, 0.987944722, 11.4995985, 1, -0.000181492287, 7.22773766e-05, 0.000181477895, 0.99999994, 0.000198908368, -7.23134726e-05, -0.000198895257, 1)
o2.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o2.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o2.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o2.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o2.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o2.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o2.Color = Color3.new(1, 0.686275, 0)
o2.Position = Vector3.new(18.4260292, 0.987944722, 11.4995985)
o3.Name = "MainWeld"
o3.Parent = o2
o3.C0 = CFrame.new(-0.190127373, 1.02396202, -0.0120782852, 0.956306815, 0, -0.292364985, 0, 1, 0, 0.292364985, 0, 0.956306815)
o3.Part0 = o2
o3.Part1 = o15
o4.Name = "MainWeld"
o4.Parent = o2
o4.C0 = CFrame.new(0.112231255, 1.02396202, 0.00985622406, 0.933583438, 0, 0.358360171, 0, 1, 0, -0.358360112, 0, 0.933583498)
o4.Part0 = o2
o4.Part1 = o20
o5.Name = "MainWeld"
o5.Parent = o2
o5.C0 = CFrame.new(-0.107109547, 1.02396202, 0.158407211, 0.601842105, 0, 0.798615098, 0, 1, 0, -0.798615098, 0, 0.601842105)
o5.Part0 = o2
o5.Part1 = o21
o6.Name = "MainWeld"
o6.Parent = o2
o6.C0 = CFrame.new(-0.00500011444, 0.00169897079, 0.00500106812, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o6.Part0 = o2
o6.Part1 = o12
o7.Name = "MainWeld"
o7.Parent = o2
o7.C0 = CFrame.new(0.0340137482, 1.02396202, -0.0815076828, 0.104554683, 0, 0.994519114, 0, 1, 0, -0.994519174, 0, 0.104554668)
o7.Part0 = o2
o7.Part1 = o22
o8.Name = "MainWeld"
o8.Parent = o2
o8.C0 = CFrame.new(0.0796995163, 1.02396202, 0.208361626, -0.529894114, 0, 0.848072529, 0, 1, 0, -0.848072529, 0, -0.529894114)
o8.Part0 = o2
o8.Part1 = o23
o9.Name = "MainWeld"
o9.Parent = o2
o9.C0 = CFrame.new(-0.00500011444, -0.587784529, 0.00500106812, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o9.Part0 = o2
o9.Part1 = o13
o10.Name = "MainWeld"
o10.Parent = o2
o10.C0 = CFrame.new(-0.00500011444, 0.734998703, 0.00500106812, 1, 0, 0, 0, 1, 0, 0, 0, 1)
o10.Part0 = o2
o10.Part1 = o11
o11.Parent = o1
o11.Material = Enum.Material.Granite
o11.BrickColor = BrickColor.new("Really black")
o11.Position = Vector3.new(18.4208965, 1.72294354, 11.5044537)
o11.Rotation = Vector3.new(-0.00999999978, 0, 0.00999999978)
o11.Size = Vector3.new(1.08999991, 0.610000014, 1.04999995)
o11.CFrame = CFrame.new(18.4208965, 1.72294354, 11.5044537, 1, -0.000181492287, 7.22773766e-05, 0.000181477895, 0.99999994, 0.000198908368, -7.23134726e-05, -0.000198895257, 1)
o11.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o11.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o11.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o11.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o11.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o11.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o11.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o11.Position = Vector3.new(18.4208965, 1.72294354, 11.5044537)
o12.Parent = o1
o12.Material = Enum.Material.Granite
o12.BrickColor = BrickColor.new("Really black")
o12.Position = Vector3.new(18.42103, 0.989643753, 11.5045996)
o12.Rotation = Vector3.new(-0.00999999978, 0, 0.00999999978)
o12.Size = Vector3.new(1.08999991, 0.610000014, 1.04999995)
o12.CFrame = CFrame.new(18.42103, 0.989643753, 11.5045996, 1, -0.000181492287, 7.22773766e-05, 0.000181477895, 0.99999994, 0.000198908368, -7.23134726e-05, -0.000198895257, 1)
o12.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o12.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o12.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o12.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o12.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o12.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o12.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o12.Position = Vector3.new(18.42103, 0.989643753, 11.5045996)
o13.Parent = o1
o13.Material = Enum.Material.Granite
o13.BrickColor = BrickColor.new("Really black")
o13.Position = Vector3.new(18.4211369, 0.400160372, 11.5047169)
o13.Rotation = Vector3.new(-0.00999999978, 0, 0.00999999978)
o13.Size = Vector3.new(1.08999991, 0.329999954, 1.04999995)
o13.CFrame = CFrame.new(18.4211369, 0.400160372, 11.5047169, 1, -0.000181492287, 7.22773766e-05, 0.000181477895, 0.99999994, 0.000198908368, -7.23134726e-05, -0.000198895257, 1)
o13.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o13.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o13.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o13.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o13.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o13.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o13.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
o13.Position = Vector3.new(18.4211369, 0.400160372, 11.5047169)
o14.Name = "Star"
o14.Parent = o1
o15.Parent = o14
o15.Material = Enum.Material.Granite
o15.BrickColor = BrickColor.new("Deep orange")
o15.Position = Vector3.new(18.2357159, 2.01186991, 11.4873304)
o15.Rotation = Vector3.new(-0.00999999978, -17, 0.00999999978)
o15.Size = Vector3.new(0.0500000007, 0.0500000007, 1)
o15.CFrame = CFrame.new(18.2357159, 2.01186991, 11.4873304, 0.956327975, -0.000181492287, -0.292295873, 0.000231702375, 0.99999994, 0.000137159645, 0.292295843, -0.000198895257, 0.956327975)
o15.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o15.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o15.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o15.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o15.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o15.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o15.Color = Color3.new(1, 0.686275, 0)
o15.Position = Vector3.new(18.2357159, 2.01186991, 11.4873304)
o16.Name = "MainWeld"
o16.Parent = o15
o16.C0 = CFrame.new(0.295556068, 0, -0.0674219131, 0.788021266, 0, 0.615649581, 0, 1, 0, -0.615650117, 0, 0.78802079)
o16.Part0 = o15
o16.Part1 = o20
o17.Name = "MainWeld"
o17.Parent = o15
o17.C0 = CFrame.new(0.194046021, 0, -0.131924629, -0.190776467, 0, 0.981634915, 0, 1, 0, -0.981634796, 0, -0.190776095)
o17.Part0 = o15
o17.Part1 = o22
o18.Name = "MainWeld"
o18.Parent = o15
o18.C0 = CFrame.new(0.129232407, 0, 0.138762474, 0.34205988, 0, 0.939684212, 0, 1, 0, -0.939682126, 0, 0.34206447)
o18.Part0 = o15
o18.Part1 = o21
o19.Name = "MainWeld"
o19.Parent = o15
o19.C0 = CFrame.new(0.322481155, 0, 0.131917953, -0.754688084, 0, 0.656095028, 0, 1, 0, -0.656095028, 0, -0.754688084)
o19.Part0 = o15
o19.Part1 = o23
o20.Parent = o14
o20.Material = Enum.Material.Granite
o20.BrickColor = BrickColor.new("Deep orange")
o20.Position = Vector3.new(18.5380745, 2.01192904, 11.509243)
o20.Rotation = Vector3.new(-0.0199999996, 21, 0.00999999978)
o20.Size = Vector3.new(0.0500000119, 0.0500000007, 1)
o20.CFrame = CFrame.new(18.5380745, 2.01192904, 11.509243, 0.93355751, -0.000181492287, 0.358427644, 9.81439371e-05, 0.99999994, 0.000250732031, -0.358427614, -0.000198895257, 0.93355757)
o20.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o20.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o20.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o20.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o20.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o20.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o20.Color = Color3.new(1, 0.686275, 0)
o20.Position = Vector3.new(18.5380745, 2.01192904, 11.509243)
o21.Parent = o14
o21.Material = Enum.Material.Granite
o21.BrickColor = BrickColor.new("Deep orange")
o21.Position = Vector3.new(18.3187447, 2.01191854, 11.6578102)
o21.Rotation = Vector3.new(-0.0299999993, 53, 0.0199999996)
o21.Size = Vector3.new(0.0500000007, 0.0500000007, 1)
o21.CFrame = CFrame.new(18.3187447, 2.01191854, 11.6578102, 0.601784408, -0.000181492287, 0.798658609, -4.96301873e-05, 0.99999994, 0.000264642411, -0.798658609, -0.000198895257, 0.601784348)
o21.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o21.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o21.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o21.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o21.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o21.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o21.Color = Color3.new(1, 0.686275, 0)
o21.Position = Vector3.new(18.3187447, 2.01191854, 11.6578102)
o22.Parent = o14
o22.Material = Enum.Material.Granite
o22.BrickColor = BrickColor.new("Deep orange")
o22.Position = Vector3.new(18.4598503, 2.01189661, 11.4178848)
o22.Rotation = Vector3.new(-0.109999999, 84, 0.100000001)
o22.Size = Vector3.new(0.0500000007, 0.0500000007, 1)
o22.CFrame = CFrame.new(18.4598503, 2.01189661, 11.4178848, 0.1044828, -0.000181492287, 0.994526684, -0.000178843824, 0.99999994, 0.00020128004, -0.994526744, -0.000198895257, 0.104482748)
o22.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o22.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o22.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o22.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o22.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o22.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o22.Color = Color3.new(1, 0.686275, 0)
o22.Position = Vector3.new(18.4598503, 2.01189661, 11.4178848)
o23.Parent = o14
o23.Material = Enum.Material.Granite
o23.BrickColor = BrickColor.new("Deep orange")
o23.Position = Vector3.new(18.505558, 2.01196241, 11.7077503)
o23.Rotation = Vector3.new(-179.990005, 58, 179.979996)
o23.Size = Vector3.new(0.0500000007, 0.0500000007, 0.930000067)
o23.CFrame = CFrame.new(18.505558, 2.01196241, 11.7077503, -0.529955387, -0.000181492287, 0.848034203, -0.000264852803, 0.99999994, 4.85060373e-05, -0.848034203, -0.000198895257, -0.529955447)
o23.BackSurface = Enum.SurfaceType.SmoothNoOutlines
o23.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
o23.FrontSurface = Enum.SurfaceType.SmoothNoOutlines
o23.LeftSurface = Enum.SurfaceType.SmoothNoOutlines
o23.RightSurface = Enum.SurfaceType.SmoothNoOutlines
o23.TopSurface = Enum.SurfaceType.SmoothNoOutlines
o23.Color = Color3.new(1, 0.686275, 0)
o23.Position = Vector3.new(18.505558, 2.01196241, 11.7077503)
mas.Parent = workspace
mas:MakeJoints()
local mas1 = mas:GetChildren()
for i=1,#mas1 do
	mas1[i].Parent = workspace 
	ypcall(function() mas1[i]:MakeJoints() end)
end
mas:Destroy()
for i=1,#cors do
coroutine.resume(cors[i])
end

wait()

workspace["LeftArm"].Parent = game.Players.LocalPlayer.Character

game.Players.LocalPlayer.Character["LeftArm"].Name = "Familiar Left Arm"

w = Instance.new("Weld", game.Players.LocalPlayer.Character["Left Arm"])
w.Part0 = game.Players.LocalPlayer.Character["Left Arm"]
w.Part1 = o2
w.C0 = CFrame.new(0, 0, 0)*CFrame.Angles(0, 0, 0)
game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1

for i,v in pairs (game.Players.LocalPlayer.Character["Familiar Left Arm"]:GetChildren()) do
	if v.ClassName == "Part" then
	v.CanCollide = false
	v.Anchored = false
	end
end




function smooth(obj)
	local sides = {"Left", "Right", "Top", "Bottom", "Front", "Back"}
	for i,v in pairs(sides) do
		obj[v.."Surface"] = "SmoothNoOutlines"
	end
end
function fade(obj, dest, grow)
	spawn(function()
		local oldcf = obj.CFrame
		for i = 0, 10 do
			if grow then
				obj.Size = obj.Size +Vector3.new(1,1,1)
				obj.CFrame = oldcf
			end
			obj.Transparency = obj.Transparency +0.1
			Swait()
		end
		if dest then
		obj:Destroy()
		end
	end)
end





IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor


function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NoOutlines(NEWPART)
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

function CreateSound(ID, PARENT, VOLUME, PITCH)
	coroutine.resume(coroutine.create(function()
		local NEWSOUND = IT("Sound", PARENT)
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		Swait()
		NEWSOUND:play()
		game:GetService("Debris"):AddItem(NEWSOUND, 10)
	end))
end


function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function FirePillar(POSITION1, POSITION2, SIZE, RISE, RANGE, LOWDAMAGE, HIGHDAMAGE, LASTINGTIME)
	local POS1 = POSITION1
	local POS2 = POSITION2
	local MOUSELOOK = CF((POS1 + POS2) / 2, POS2)
	local FIREPILLARHITSOUNDS = {"171378971", --[["646619365",--]] "472579737"--[[, "144140670"--]]}
	local FIREPILLARCOLORS = {"Really black", "Black", "Deep orange"}
	local FIREPILLAR1HIT, FIREPILLAR1POS = Raycast(POS1, MOUSELOOK.lookVector, RANGE * Player_Size, Character)
	local FirePillarRefpart1 = CreatePart(3, Effects, "SmoothPlastic", 0, 1, "Really black", "Effect", VT())
	FirePillarRefpart1.Anchored = true
	FirePillarRefpart1.CFrame = CF(FIREPILLAR1POS) * CF(0, 10, 0)
	game:GetService("Debris"):AddItem(FirePillarRefpart1, 5)
	local FIREPILLAR2HIT, FIREPILLAR2POS = Raycast(FirePillarRefpart1.Position, CF(FirePillarRefpart1.Position, FirePillarRefpart1.Position + VT(0, -1, 0)).lookVector, 999, Character)
	if FIREPILLAR2HIT ~= nil then
		FirePillarRefpart1.Parent = nil
		local FirePillarRefpart2 = CreatePart(3, Effects, "SmoothPlastic", 0, 1, "Really black", "Effect", VT())
		FirePillarRefpart2.Anchored = true
		FirePillarRefpart2.CFrame = CF(FIREPILLAR2POS)
		game:GetService("Debris"):AddItem(FirePillarRefpart2, 5)
		CreateSound(FIREPILLARHITSOUNDS[MRANDOM(1, #FIREPILLARHITSOUNDS)], FirePillarRefpart2, 1.2, MRANDOM(11, 13) / 10)
		for i = 1, MRANDOM(5, 10) do
			MagicBlock(FIREPILLARCOLORS[MRANDOM(1, #FIREPILLARCOLORS)], "Neon", FirePillarRefpart2.CFrame * ANGLES(RAD(MRANDOM(-60, 60)), 0, RAD(MRANDOM(-60, 60))), CF(0, MRANDOM(5, 7) / 10 * Player_Size, 0), VT(0, 0, 0), 30, 30, 30, 0, 0, 0, MRANDOM(3, 5) / 100)
		end
		for i = 1, MRANDOM(15, 20) do
			local FIREEFFECTSIZE = MRANDOM(1, 2)
			MagicBlock(FIREPILLARCOLORS[MRANDOM(1, #FIREPILLARCOLORS)], "Neon", FirePillarRefpart2.CFrame, CF(0, MRANDOM(5, 10) / 100, 0) * ANGLES(0, RAD(MRANDOM(-20, 20)), 0), VT(MRANDOM(SIZE / 6, SIZE / 4), 0, 0), FIREEFFECTSIZE, FIREEFFECTSIZE, FIREEFFECTSIZE, -0.02, -0.02, -0.02, MRANDOM(1, 2) / 100)
		end
		MagicCylinder("Really black", "Neon", CF(FIREPILLAR2POS), ANGLES(0, 0, 0), VT(0, 0, 0), SIZE, 0.1, SIZE, 1.5, 0, 1.5, LASTINGTIME)
		MagicSphere("Really black", "Neon", FirePillarRefpart2.CFrame, ANGLES(0, 0, 0), VT(0, 0, 0), SIZE, 0.1, SIZE, 1.5, RISE, 1.5, LASTINGTIME)
		MagicSphere("Black", "Neon", FirePillarRefpart2.CFrame, ANGLES(0, 0, 0), VT(0, 0, 0), SIZE * 0.5, 0.1, SIZE * 0.5, 1.5, RISE * 0.75, 1.5, LASTINGTIME)
		MagicSphere("Dark indigo", "Neon", FirePillarRefpart2.CFrame, ANGLES(0, 0, 0), VT(0, 0, 0), SIZE * 0.25, 0.1, SIZE * 0.25, 1.5, RISE * 0.375, 1.5, LASTINGTIME)
		MagnitudeDamage("", "", "", "", 10, 10, 10, 1, FirePillarRefpart2, SIZE / 3, false, LOWDAMAGE, HIGHDAMAGE, 0, "Normal", RootPart, 0, 1, MRANDOM(10, 15), nil, false, true, "Movement", -0.1, 3, true)
	end
end





mouse.KeyDown:connect(function(key)
  if key == "b" then
    hum.WalkSpeed = 0
    if Debounces.CanAttack == true then
      Debounces.CanAttack = false
      Debounces.NoIdl = true
      Debounces.on = true
      v = Instance.new("Sound")
      v.SoundId = "http://www.roblox.com/asset/?id=800952230"
      v.Parent = char
      v.Looped = false
      v.Pitch = 1
      v.Volume =  3000
      
wait()
        larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(75), 0, math.rad(30)), 0.1)
        rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(75), 0, math.rad(-30)), 0.1)
        hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(-20), math.rad(0), 0), 0.1)
        torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-30), math.rad(0), 0), 0.1)
        lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(30), 0, math.rad(-5)), 0.1)
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(30), 0, math.rad(5)), 0.1)
        if Debounces.on == false then
        end
        wait()
      end
      wait()
          
		      v:Play()

      for i = 1, 15 do
        larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-130)), 0.2)
        rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(70)), 0.2)
        hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0.2) * CFrame.Angles(math.rad(45), math.rad(30), 0), 0.1)
        torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(30), math.rad(20), math.rad(0)), 0.2)
        lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(-40)), 0.1)
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(0)), 0.1)
        if Debounces.on == false then
          break
        end
        wait()
      end
      for i = 1, 15 do
        larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-70)), 0.2)
        rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(130)), 0.2)
        hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0.2) * CFrame.Angles(math.rad(45), math.rad(-30), 0), 0.1)
        torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(30), math.rad(-20), math.rad(0)), 0.2)
        lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(0)), 0.1)
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(40)), 0.1)
        if Debounces.on == false then
          break
        end
        wait()
      end
      for i = 1, 15 do
        larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-130)), 0.2)
        rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(70)), 0.2)
        hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0.2) * CFrame.Angles(math.rad(45), math.rad(30), 0), 0.1)
        torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(30), math.rad(20), math.rad(0)), 0.2)
        lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(-40)), 0.1)
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(0)), 0.1)
        if Debounces.on == false then
          break
        end
        wait()
      end
      for i = 1, 15 do
        larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-70)), 0.2)
        rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(130)), 0.2)
        hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0.2) * CFrame.Angles(math.rad(45), math.rad(-30), 0), 0.1)
        torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(30), math.rad(-20), math.rad(0)), 0.2)
        lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(0)), 0.1)
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(40)), 0.1)
        if Debounces.on == false then
          break
        end
        wait()
      end
      for i = 1, 15 do
        larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-130)), 0.2)
        rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(70)), 0.2)
        hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0.2) * CFrame.Angles(math.rad(45), math.rad(30), 0), 0.1)
        torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(30), math.rad(20), math.rad(0)), 0.2)
        lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(-40)), 0.1)
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(0)), 0.1)
        if Debounces.on == false then
          break
        end
        wait()
      end
      for i = 1, 10 do
        larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-70)), 0.2)
        rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(130)), 0.2)
        hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, 0.2) * CFrame.Angles(math.rad(45), math.rad(-30), 0), 0.1)
        torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(30), math.rad(-20), math.rad(0)), 0.2)
        lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(0)), 0.1)
        rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-30), 0, math.rad(40)), 0.1)
        if Debounces.on == false then
          break
        end
        wait()
      end

      wait(1.4)
      Debounces.NoIdl = false
      hum.WalkSpeed = 5
      Debounces.on = false
      wait()
      if Debounces.CanAttack == false then
        Debounces.CanAttack = true
        v:Destroy()
       
      end
    end
  end)








function Ragdoll(Format, Character, Force)
  if Force ~= true then
    if Character:FindFirstChild("Ragdoll") ~= nil and Format == true then
      return false
    end
    if Character:FindFirstChild("Ragdoll") == nil and Format == false then
      return false
    end
  end
  local Head, Torso, Humanoid
  local Dead = false
  for _, Children in pairs(Character:GetChildren()) do
    if Children.ClassName == "ForceField" then
      Children:Remove()
    end
    if Children.Name == "" then
      Children:Remove()
    end
    if Children.Name == "Head" then
      Head = Children
    end
    if Children.Name == "Torso" then
      Torso = Children
    end
    if Children.ClassName == "Humanoid" then
      Humanoid = Children
    end
    if Children:IsA("Accoutrement") then
      if Children:FindFirstChild("Handle") ~= nil then
        if math.random(1, 3) == 1 then
          coroutine.wrap(function()
            Children.Parent = Workspace
            wait()
            Children.Parent = Character
            Children.Handle.CanCollide = true
          end)()
        else
          Children.Parent = Workspace
          Children.Handle.CanCollide = true
        end
      else
        Children:Remove()
      end
    end
  end
  if Humanoid ~= nil and Humanoid.Health <= 0 then
    Dead = true
  end
  if Torso ~= nil then
    for _, Children2 in pairs(Torso:GetChildren()) do
      if Children2:IsA("JointInstance") then
        Children2:Remove()
      end
    end
  end
  if Head ~= nil then
    if (function()
      if Dead == true and math.random(1, 2) == 1 then
        return true
      else
        return false
      end
    end)() == false then
      local Neck = Instance.new("Motor6D")
      Neck.Name = "Neck"
      Neck.Part0 = Torso
      Neck.Part1 = Head
      Neck.C0 = CFrame.new(0, 1, 0) * CFrame.fromEulerAnglesXYZ(math.rad(-90), 0, math.rad(180))
      Neck.C1 = CFrame.new(0, -0.5, 0) * CFrame.fromEulerAnglesXYZ(math.rad(-90), 0, math.rad(180))
      Neck.MaxVelocity = 0.1
      Neck.Parent = Torso
    end
  end
  if Format == true then
    local Ragdoll = Instance.new("IntValue")
    Ragdoll.Name = "Ragdoll"
    Ragdoll.Parent = Character
    if Torso ~= nil then
      Torso.Velocity = Torso.Velocity / 1.25
      Torso.RotVelocity = Torso.RotVelocity / 1.25 + Head.CFrame.lookVector * 80
      if Dead == true and Humanoid ~= nil then
        local Humanoid2 = Humanoid:Clone()
        wait()
        Humanoid:Remove()
        Humanoid2.Parent = Character
        Humanoid = Humanoid2
      end
      local Limb = Character:FindFirstChild("Right Arm")
      if Limb ~= nil then
        Limb.Velocity = Torso.Velocity
        Limb.CFrame = Torso.CFrame * CFrame.new(1.5, 0, 0)
        local Joint = Instance.new("Glue")
        Joint.Name = "RightShoulder"
        Joint.Part0 = Torso
        Joint.Part1 = Limb
        Joint.C0 = CFrame.new(1.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Joint.C1 = CFrame.new(0, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Joint.Parent = Torso
        local Weight = Instance.new("Part")
        Weight.Name = ""
        Weight.TopSurface = 0
        Weight.BottomSurface = 0
        Weight.Shape = "Block"
        Weight.FormFactor = "Custom"
        Weight.Size = Vector3.new(1, 1, 1)
        Weight.Transparency = 1
        Weight.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
        Weight.Parent = Character
        local Weld = Instance.new("Weld")
        Weld.Part0 = Limb
        Weld.Part1 = Weight
        Weld.C0 = CFrame.new(0, -0.5, 0)
        Weld.Parent = Limb
      end
      local Limb = Character:FindFirstChild("Left Arm")
      if Limb then
        Limb.Velocity = Torso.Velocity
        Limb.CFrame = Torso.CFrame * CFrame.new(-1.5, 0, 0)
        local Joint = Instance.new("Glue")
        Joint.Name = "LeftShoulder"
        Joint.Part0 = Torso
        Joint.Part1 = Limb
        Joint.C0 = CFrame.new(-1.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Joint.C1 = CFrame.new(0, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Joint.Parent = Torso
        local Weight = Instance.new("Part")
        Weight.Name = ""
        Weight.TopSurface = 0
        Weight.BottomSurface = 0
        Weight.Shape = "Block"
        Weight.FormFactor = "Custom"
        Weight.Size = Vector3.new(1, 1, 1)
        Weight.Transparency = 1
        Weight.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
        Weight.Parent = Character
        local Weld = Instance.new("Weld")
        Weld.Part0 = Limb
        Weld.Part1 = Weight
        Weld.C0 = CFrame.new(0, -0.5, 0)
        Weld.Parent = Limb
      end
      local Limb = Character:FindFirstChild("Right Leg")
      if Limb then
        Limb.Velocity = Torso.Velocity
        Limb.CFrame = Torso.CFrame * CFrame.new(0.5, -2, 0)
        local Joint = Instance.new("Glue")
        Joint.Name = "RightHip"
        Joint.Part0 = Torso
        Joint.Part1 = Limb
        Joint.C0 = CFrame.new(0.5, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Joint.C1 = CFrame.new(0, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
        Joint.Parent = Torso
        local Weight = Instance.new("Part")
        Weight.Name = ""
        Weight.TopSurface = 0
        Weight.BottomSurface = 0
        Weight.Shape = "Block"
        Weight.FormFactor = "Custom"
        Weight.Size = Vector3.new(1, 1, 1)
        Weight.Transparency = 1
        Weight.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
        Weight.Parent = Character
        local Weld = Instance.new("Weld")
        Weld.Part0 = Limb
        Weld.Part1 = Weight
        Weld.C0 = CFrame.new(0, -0.5, 0)
        Weld.Parent = Limb
      end
      local Limb = Character:FindFirstChild("Left Leg")
      if Limb then
        Limb.Velocity = Torso.Velocity
        Limb.CFrame = Torso.CFrame * CFrame.new(-0.5, -2, 0)
        local Joint = Instance.new("Glue")
        Joint.Name = "LeftHip"
        Joint.Part0 = Torso
        Joint.Part1 = Limb
        Joint.C0 = CFrame.new(-0.5, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Joint.C1 = CFrame.new(0, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Joint.Parent = Torso
        local Weight = Instance.new("Part")
        Weight.Name = ""
        Weight.TopSurface = 0
        Weight.BottomSurface = 0
        Weight.Shape = "Block"
        Weight.FormFactor = "Custom"
        Weight.Size = Vector3.new(1, 1, 1)
        Weight.Transparency = 1
        Weight.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
        Weight.Parent = Character
        local Weld = Instance.new("Weld")
        Weld.Part0 = Limb
        Weld.Part1 = Weight
        Weld.C0 = CFrame.new(0, -0.5, 0)
        Weld.Parent = Limb
      end
      local Weight = Instance.new("Part")
      Weight.Name = ""
      Weight.TopSurface = 0
      Weight.BottomSurface = 0
      Weight.Shape = "Block"
      Weight.FormFactor = "Custom"
      Weight.Size = Vector3.new(1.75, 1.5, 1.1)
      Weight.Transparency = 1
      Weight.CFrame = Torso.CFrame * CFrame.new(0, 0.5, 0)
      Weight.Parent = Character
      local Weld = Instance.new("Weld")
      Weld.Part0 = Torso
      Weld.Part1 = Weight
      Weld.C0 = CFrame.new(0, 0.5, 0)
      Weld.Parent = Torso
    end
  elseif Format == false then
    if Character:FindFirstChild("Ragdoll") ~= nil then
      Character.Ragdoll:Remove()
    end
    if Torso ~= nil then
      local Limb = Character:FindFirstChild("Right Arm")
      if Limb ~= nil then
        local Joint = Instance.new("Motor6D")
        Joint.Name = "Right Shoulder"
        Joint.Part0 = Torso
        Joint.Part1 = Limb
        Joint.C0 = CFrame.new(1.5, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
        Joint.C1 = CFrame.new(0, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
        Joint.MaxVelocity = 0.15
        Joint.Parent = Torso
      end
      local Limb = Character:FindFirstChild("Left Arm")
      if Limb ~= nil then
        local Joint = Instance.new("Motor6D")
        Joint.Name = "Left Shoulder"
        Joint.Part0 = Torso
        Joint.Part1 = Limb
        Joint.C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(-90), 0)
        Joint.C1 = CFrame.new(0, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(-90), 0)
        Joint.MaxVelocity = 0.15
        Joint.Parent = Torso
      end
      local Limb = Character:FindFirstChild("Right Leg")
      if Limb ~= nil then
        local Joint = Instance.new("Motor6D")
        Joint.Name = "Right Hip"
        Joint.Part0 = Torso
        Joint.Part1 = Limb
        Joint.C0 = CFrame.new(0.5, -1, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
        Joint.C1 = CFrame.new(0, 1, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
        Joint.MaxVelocity = 0.1
        Joint.Parent = Torso
      end
      local Limb = Character:FindFirstChild("Left Leg")
      if Limb ~= nil then
        local Joint = Instance.new("Motor6D")
        Joint.Name = "Left Hip"
        Joint.Part0 = Torso
        Joint.Part1 = Limb
        Joint.C0 = CFrame.new(-0.5, -1, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(-90), 0)
        Joint.C1 = CFrame.new(0, 1, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(-90), 0)
        Joint.MaxVelocity = 0.1
        Joint.Parent = Torso
      end
      local Animate = Character:FindFirstChild("Animate")
      if Animate ~= nil then
        local Animate2 = Animate:Clone()
        Animate:Remove()
        Animate2.Parent = Character
      end
    end
  else
    return false
  end
  return true, Format
end





function weld5(part0, part1, c0, c1)
    weeld=Instance.new("Weld", part0)
    weeld.Part0=part0
    weeld.Part1=part1
    weeld.C0=c0
    weeld.C1=c1
    return weeld
end





Grab = false
mouse.KeyDown:connect(function(key)
    if key == "z" then
        Debounces.on = true
        Debounces.NoIdl = true
		Debounces.ks = true
        if Grab == false then
        gp = nil
        for i = 1, 20 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65,0)*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(20)), 0.2)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.65,0)*CFrame.Angles(math.rad(80),math.rad(0),math.rad(-80)), 0.2)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-.2)*CFrame.Angles(math.rad(-10),math.rad(-70),0), 0.2)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(0, math.rad(70), 0), 0.2)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(30), math.rad(-20)), 0.2)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(-15), math.rad(20)), 0.2)
            if Debounces.on == false then break end
            rs:wait(2)
        end
        con1=larm.Touched:connect(function(hit) -- this is grab
            ht = hit.Parent
            hum1=ht:FindFirstChild('Humanoid')
            if hum1 ~= nil then
			    if Debounces.ks==true then
                z = Instance.new("Sound",hed)
                z.SoundId = "rbxassetid://200632821"
                z.Volume = 1
                z:Play()
                Debounces.ks=false
				end
                hum1.PlatformStand=true
                gp = ht
                Grab = true
                asd=weld5(larm,ht:FindFirstChild("Torso"),CFrame.new(0,-1,1.5),CFrame.new(0,0,0))
                asd.Parent = larm
                asd.Name = "asd"
                asd.C0=asd.C0*CFrame.Angles(math.rad(-90),math.rad(180),0)
				stanceToggle = "Grabbed"

            --[[elseif hum1 == nil then
                con1:disconnect()
                wait() return]]--
            end
        end)
        for i = 1, 20 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65,0)*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(20)), 0.2)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.65,0)*CFrame.Angles(math.rad(70),math.rad(0),math.rad(20)), 0.2)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-.2)*CFrame.Angles(math.rad(-10),math.rad(30),0), 0.2)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(0, math.rad(-30), 0), 0.2)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(30), math.rad(-20)), 0.2)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(-15), math.rad(20)), 0.2)
            if Debounces.on == false then break end
            rs:wait(2)
        end
    con1:disconnect()
    Debounces.on = false
    Debounces.NoIdl = false
    elseif Grab == true then
        Grab = false
			--[[for i = 1, 16 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65,0)*CFrame.Angles(math.rad(0),math.rad(50),math.rad(60)), 0.3)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.65,-.5)*CFrame.Angles(math.rad(130),math.rad(0),math.rad(-60)), 0.3)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-.2)*CFrame.Angles(math.rad(14),math.rad(70),0), 0.3)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(0, math.rad(-70), 0), 0.3)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(30), math.rad(-20)), 0.3)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(-15), math.rad(20)), 0.3)
			cor.Weld.C1 = Lerp(cor.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(40), 0), 0.3)
			if Debounces.on == false then end
			rs:wait()
		end]]--
			for i = 1, 16 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65,0)*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(20)), 0.3)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.65,0)*CFrame.Angles(math.rad(140),math.rad(0),math.rad(-73)), 0.3)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-.2)*CFrame.Angles(math.rad(20),math.rad(-60),0), 0.3)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(0, math.rad(50), 0), 0.3)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(30), math.rad(-20)), 0.3)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(-15), math.rad(20)), 0.3)
			if Debounces.on == false then end
			rs:wait()
		end
       Grabee = gp:FindFirstChild("Torso")
		par,loc=workspace:FindPartOnRay(Ray.new(Character.Torso.Position,(Character.Torso.Position-(Character.Torso.Position-Vector3.new(0,2,0))).unit*-500),Character)
			for i=1, 30 do
			p=Instance.new("Part")
			p.FrontSurface=par.TopSurface
			p.Material=par.Material
			p.BottomSurface=0
			p.Anchored=true p.CanCollide=false
			p.BrickColor=par.BrickColor
			p.Size=Vector3.new(math.random(15,35)/5,math.random(15,35)/5,math.random(4,5))
			p.CFrame=CFrame.new(Grabee.Position-Vector3.new(math.random(-i,i)/1,3,math.random(-i,i)/1),loc+Vector3.new(0,1000-i*20,0))*CFrame.fromEulerAnglesXYZ(math.random(-10,10)/30,math.random(-10,10)/30,math.random(-10,10)/30)
			p.Parent=Character
			game:GetService("Debris"):AddItem(p,2+i*.1)
			if math.random(1,5)==5 then
				coroutine.resume(coroutine.create(function(p) f=Instance.new("Smoke") f.Parent=p f.Size=30 f.RiseVelocity=0 f.Opacity=.025 Swait(.1) f.Enabled=false Swait(1) f:Remove() end),p)
			end
		end
		for i=1, 30 do
			for i=1, 1 do
			p=Instance.new("Part")
			p.TopSurface=par.TopSurface
			p.BottomSurface=par.BottomSurface
			p.Material=par.Material
			p.BottomSurface=0
			p.Anchored=false p.CanCollide=true
			p.BrickColor=par.BrickColor
			p.formFactor="Custom"
			p.Size=Vector3.new(math.random(15,35)/12,math.random(13,35)/12,math.random(15,35)/12)
			p.CFrame=CFrame.new(Grabee.Position-Vector3.new(math.random(-4,4),-2,math.random(-4,4)))*CFrame.fromEulerAnglesXYZ(math.random(-10,10)/20,math.random(-10,10)/5,math.random(-10,10)/20)
			p.Parent=Character
			game:GetService("Debris"):AddItem(p,3+i*.1)
			p.Velocity=Vector3.new(math.random(-10,10)*4,math.random(40,80),math.random(-10,10)*4)
			p.RotVelocity=p.Velocity
			if math.random(1,5)==5 then
				coroutine.resume(coroutine.create(function(p) f=Instance.new("Smoke") f.Parent=p f.Size=15 f.RiseVelocity=10 f.Opacity=.1 Swait(.1) f.Enabled=false Swait(1) f:Remove() end),p)
			end
			end
			Swait(.025)
		end	
		        
		for i = 1, 13 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65,0)*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(20)), 0.3)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.65,-.4)*CFrame.Angles(math.rad(70),math.rad(0),math.rad(-13)), 0.3)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-.2)*CFrame.Angles(math.rad(0),math.rad(20),0), 0.3)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-60), math.rad(-30), 0), 0.3)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(80), math.rad(30), math.rad(-20)), 0.3)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(70), math.rad(-15), math.rad(20)), 0.3)
			if Debounces.on == false then end
			rs:wait()
		end
		wait(0.3)
		hum1:TakeDamage(math.random(10000020,10000030))
		if gp ~= nil then
			for i,v in pairs(larm:GetChildren()) do
				if v.Name == "asd" and v:IsA("Weld") then
					v:Remove()
				end
			end
		wait(0.3)
		stanceToggle = "Idle1"
		

        --[[bv = Instance.new("BodyVelocity",gp:FindFirstChild("Torso"))
        bv.maxForce = Vector3.new(400000, 400000, 400000)
        bv.P = 125000
        bv.velocity = char.Head.CFrame.lookVector * 200]]--
        ht=nil
        Debounces.on = false
        Debounces.NoIdl = false
        elseif ht == nil then wait()
        Grab = false
        Debounces.on = false
        Debounces.NoIdl = false
            end
        end
    end
end)






mouse.KeyDown:connect(function(key)
	if key == "q" then
		Character.Humanoid.WalkSpeed = 0
		Debounces.on = true
        Debounces.NoIdl = true
		Debounces.ks = true
		for i = 1, 20 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65,0)*CFrame.Angles(2.5,0,1.3), 0.2)
			rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(0,0,0), 0.5)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(0,-1,0),0.2)
			torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0,-1,0)*CFrame.Angles(0,0,0), 0.5)
			if Debounces.on == false then break end
            rs:wait()
		    end
		local HitBox = Instance.new("Part",Character["Right Arm"])
		HitBox.Size = Vector3.new(3,3,3)
		HitBox.Transparency = 1
		HitBox.CanCollide = false
		local HitBox2 = Instance.new("Weld",HitBox)
		HitBox2.Part0 = Character["Right Arm"]
		HitBox2.Part1 = HitBox
		HitBox2.C0 = CFrame.new(0,-1.1,0)
		HitBox.Touched:connect(function(hit)
			if hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= nil then
				HitBox:remove()
				hit.Parent.Head.Transparency = 1e9
				local SFXZ = Instance.new("Sound",hit.Parent.Torso)
			SFXZ.SoundId = "rbxassetid://206082273"
			SFXZ.Volume = 1
			SFXZ.Pitch = 1
			SFXZ.Looped = false
			wait(0.01)
			SFXZ:Play()
		local HitBox = Instance.new("Part",Character["Right Arm"])
		HitBox.Transparency = 0
		HitBox.Size = Vector3.new(1,1,1)
		HitBox.BrickColor = hit.Parent.Head.BrickColor
		HitBox.CanCollide = false
		local HitBoxM = Instance.new("SpecialMesh",HitBox)
		HitBoxM.MeshType = "Head"
		HitBoxM.Scale = Vector3.new(1.25,1.25,1.25)
		local HitBox2 = Instance.new("Weld",HitBox)
		HitBox2.Part0 = Character["Right Arm"]
		HitBox2.Part1 = HitBox
		HitBox2.C0 = CFrame.new(0,-1.1,0)
		local D = Instance.new("Decal",HitBox)
		D.Face = "Front"
		D.Texture = hit.Parent.Head.face.Texture
		hit.Parent.Head.face:remove()
		local partasdeff = Instance.new("ParticleEmitter",hit.Parent.Torso)
			partasdeff.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(.5, 0, 0))
			partasdeff.LightEmission = .1
			partasdeff.Size = NumberSequence.new(0.2)
			partasdeff.Texture = "http://www.roblox.com/asset/?ID=771221224"
			aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2),NumberSequenceKeypoint.new(1, 5)})
			bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
			partasdeff.Transparency = bbb
			partasdeff.Size = aaa
			partasdeff.ZOffset = .9
			partasdeff.Acceleration = Vector3.new(0, -5, 0)
			partasdeff.LockedToPart = false
			partasdeff.EmissionDirection = "Top"
			partasdeff.Lifetime = NumberRange.new(1, 2)
			partasdeff.Rate = 1000
			partasdeff.Rotation = NumberRange.new(-100, 100)
			partasdeff.RotSpeed = NumberRange.new(-100, 100)
			partasdeff.Speed = NumberRange.new(10)
			partasdeff.VelocitySpread = 20
			partasdeff.Enabled=true
			hit.Parent.Head:remove()
			wait(1)
			for i = 1,14 do
				HitBoxM.Scale = HitBoxM.Scale - Vector3.new(0.1,0.1,0.1)
				game:GetService("RunService").RenderStepped:wait()
			end
			HitBox:remove()
			wait(0.5)
			partasdeff.Enabled = false
			HitBox:remove()
			Debounces.on = false
        Debounces.NoIdl = false
		Debounces.ks = false
		Character.Humanoid.WalkSpeed = 16
		local a = Instance.new("Part",game.Players.LocalPlayer.Character.Head)
a.Transparency = 1
a.Size = Vector3.new(.2,.2,.2)
local b = Instance.new("Weld",a.Parent.Parent)
b.Part0 = a
b.Part1 = a.Parent
b.C0 = CFrame.new(0,.3,0.65)
local p2mit = Instance.new("ParticleEmitter",a)
p2mit.Texture = "http://www.roblox.com/asset/?id=243132757"
p2mit.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(.6,0,0)),ColorSequenceKeypoint.new(1,Color3.new(.6,0,0))})
p2mit.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,.2),NumberSequenceKeypoint.new(1,.2)})
p2mit.Lifetime = NumberRange.new(1)
p2mit.Rate = 10
p2mit.VelocitySpread = 10
p2mit.Acceleration = Vector3.new(0,-10,0)
p2mit.Speed = NumberRange.new(0)
coroutine.wrap(function()
    wait(15)
    p2mit.Enabled=false
    game:service'Debris':AddItem(a,2)
end)()
			end
		end)
		for i = 1, 20 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65,0)*CFrame.Angles(2.9,0,0), 0.2)
			rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(0,0,0), 0.5)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(0,1,0),0.2)
			torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0,-1,0)*CFrame.Angles(0,0,0), 0.5)
			if Debounces.on == false then break end
            fat.Event:wait()
		    end
		wait(0.5)
		HitBox:remove()
		wait(3)
		Debounces.on = false
        Debounces.NoIdl = false
		Debounces.ks = false
		Character.Humanoid.WalkSpeed = 5
	end
end)

Humanoid.WalkSpeed = 5

function FindNearestTorso(Position,Distance,SinglePlayer)
    if SinglePlayer then return(SinglePlayer.Torso.CFrame.p -Position).magnitude < Distance end
        local List = {}
        for i,v in pairs(workspace:GetChildren())do
            if v:IsA("Model")then
                if v:findFirstChild("Torso")then
                    if v ~= char then
                        if(v.Torso.Position -Position).magnitude <= Distance then
                            table.insert(List,v)
                        end
                    end
                end
            end
        end
    return List
end





local HandCF = CFrame.new(root.Position - Vector3.new(0,3,0)) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
        local valuer = 5
        local valuer2 = 10
        local valuer3 = 15

	
mouse.KeyDown:connect(function(key)
	if key == "f" then
		 if Debounces.CanAttack == true then
			Debounces.CanAttack = false
			Debounces.NoIdl = true
			Debounces.on = true
			
			
			local en = Instance.new("Part",hed)
			en.Material = "Neon"
			en.BrickColor = BrickColor.new("Deep orange")
			en.CanCollide = false
			en.Size = Vector3.new(.1,.1,.1)
			en.Shape = "Ball"
			en.TopSurface = "SmoothNoOutlines"
	        en.BottomSurface = "SmoothNoOutlines"
	
	        for i = 1,200 do
		en.Size = en.Size + Vector3.new(.01,.01,.01)
		en.CFrame = hed.CFrame * CFrame.new(0,1.35,-0.86)
		if Debounces.on == false then break end
		rs:wait()
	end
	
	en:Destroy()
	wait(0.1)
	local X = Instance.new("Part",char)
	X.BrickColor = BrickColor.new("Deep orange")
	X.Name = "Shell"
	X.Shape = "Ball"
	X.Material = "Neon"
	X.Size = Vector3.new(1,1,1)
	X.CFrame = hed.CFrame * CFrame.new(0,1.35,-1.66)
	local bv = Instance.new("BodyVelocity",X)
	bv.maxForce = Vector3.new(99999,99999,99999)
	X.CFrame = CFrame.new(X.Position,mouse.Hit.p)
	bv.velocity = X.CFrame.lookVector*65
	
	 Explode = X.Touched:connect(function(hit)
		if hit ~= char and hit.Name ~= "Shell" then
			local cf = X.CFrame
			bv:Destroy()
			X.Anchored = true
			Explode:disconnect()
			X.Size = Vector3.new(3,3,3)
			X.Touched:connect(function(hit) end)
			X.CanCollide = false
			X.Transparency = 1
		
		local part3 = Instance.new("Part", rarm)
			part3.Anchored=true
			part3.CanCollide=false
			part3.Locked = true
			part3.TopSurface = "SmoothNoOutlines"
			part3.BottomSurface = "SmoothNoOutlines"
			part3.FormFactor='Custom'
			part3.Size=Vector3.new(2,2, 2)
			part3.CFrame=X.CFrame
			part3.Transparency=0
			part3.BrickColor=BrickColor.new("Deep orange")
			local mesh3 = Instance.new("SpecialMesh",part3)
			mesh3.MeshType = "Sphere"
			mesh3.Scale = Vector3.new(2,2,2)
			--debris:AddItem(X,8)
			local part4 = Instance.new("Part", rarm)
			part4.Material = "Neon"
			part4.Anchored=true
			part4.CanCollide=false
			part4.Locked = true
			part4.TopSurface = "SmoothNoOutlines"
			part4.BottomSurface = "SmoothNoOutlines"
			part4.FormFactor='Custom'
			part4.Size=Vector3.new(2,2, 2)
			part4.CFrame=X.CFrame
			part4.Transparency=0
			part4.BrickColor=BrickColor.new("Really black")
			local mesh4 = Instance.new("SpecialMesh",part4)
			mesh4.MeshType = "Sphere"
			mesh4.Scale = Vector3.new(1,1,1)
			local part7 = Instance.new("Part", rarm)
			part7.Material = "Neon"
			part7.Anchored=true
			part7.CanCollide=false
			part7.Locked = true
			part7.TopSurface = "SmoothNoOutlines"
			part7.BottomSurface = "SmoothNoOutlines"
			part7.FormFactor='Custom'
			part7.Size=Vector3.new(2,2, 2)
			part7.CFrame=X.CFrame
			part7.Transparency=0
			part7.BrickColor=BrickColor.new("Really black")
			local mesh7 = Instance.new("SpecialMesh",part7)
			mesh7.MeshType = "Sphere"
			mesh7.Scale = Vector3.new(0.2, 0.2, 0.2)
		--[[X.Touched:connect(function(ht)
				hit = ht.Parent
			if ht and hit:IsA("Model") then
					if hit:FindFirstChild("Humanoid") then
						if hit.Name ~= p.Name then
							hit:FindFirstChild("Humanoid"):TakeDamage(math.random(4,6))
							wait(.3)
						end
					end
			elseif ht and hit:IsA("Hat") then
				if hit.Parent.Name ~= p.Name then
					if hit.Parent:FindFirstChild("Humanoid") then
						hit.Parent:FindFirstChild("Humanoid"):TakeDamage(math.random(4,6))
						wait(.3)
					end
				end
			end
		end)
		part3.Touched:connect(function(ht)
				hit = ht.Parent
			if ht and hit:IsA("Model") then
					if hit:FindFirstChild("Humanoid") then
						if hit.Name ~= p.Name then
							hit:FindFirstChild("Humanoid"):TakeDamage(math.random(4,6))
							wait(.3)
						end
					end
			elseif ht and hit:IsA("Hat") then
				if hit.Parent.Name ~= p.Name then
					if hit.Parent:FindFirstChild("Humanoid") then
						hit.Parent:FindFirstChild("Humanoid"):TakeDamage(math.random(4,6))
						wait(.3)
					end
				end
			end
		end)]]--
		 for i,v in pairs(FindNearestTorso(X.CFrame.p,50000))do
        if v:FindFirstChild('Humanoid') then
            v.Humanoid:TakeDamage(math.random(10000020,10000030))
            v.Humanoid.PlatformStand = true
            v:FindFirstChild("Torso").Velocity = head.CFrame.lookVector * 200
        end
    end 

		local acos = math.acos
		local sqrt = math.sqrt
		local Vec3 = Vector3.new
		local fromAxisAngle = CFrame.fromAxisAngle

		local function toAxisAngle(CFr)
			local X,Y,Z,R00,R01,R02,R10,R11,R12,R20,R21,R22 = CFr:components()
			local Angle = math.acos((R00+R11+R22-1)/2)
			local A = (R21-R12)^2+(R02-R20)^2+(R10-R01)^2
			A = A == 0 and 0.00001 or A
			local B = (R21-R12)^2+(R02-R20)^2+(R10-R01)^2
			B = B == 0 and 0.00001 or B
			local C = (R21-R12)^2+(R02-R20)^2+(R10-R01)^2
			C = C == 0 and 0.00001 or C
			local x = (R21-R12)/sqrt(A)
			local y = (R02-R20)/sqrt(B)
			local z = (R10-R01)/sqrt(C)
			return Vec3(x,y,z),Angle
		end

		function ApplyTrig(Num,Func)
			local Min,Max = Func(0),Func(1)
			local i = Func(Num)
			return (i-Min)/(Max-Min)
		end

		function LerpCFrame(CFrame1,CFrame2,Num)
			local Vec,Ang = toAxisAngle(CFrame1:inverse()*CFrame2)
			return CFrame1*fromAxisAngle(Vec,Ang*Num) + (CFrame2.p-CFrame1.p)*Num
		end

		function Crater(Torso,Radius)
			Spawn(function()
				local Ray = Ray.new(Torso.Position,Vector3.new(0,-1,0)*10)
				local Ignore = {}
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Character ~= nil then
						Ignore[#Ignore+1] = v.Character
					end
				end
				local Hit,Pos,SurfaceNorm = Workspace:FindPartOnRayWithIgnoreList(Ray,Ignore)
				if Hit == nil then return end
					local Parts = {}
					for i = 1,360,10 do
						local P = Instance.new("Part",Torso.Parent)
						P.Anchored = true
						P.FormFactor = "Custom"
						P.BrickColor = Hit.BrickColor
						P.Material = Hit.Material
						P.TopSurface = "Smooth"
						P.BottomSurface = "Smooth"
						P.Size = Vector3.new(10,20,20)*(math.random(80,100)/100)
						P.CFrame = ((CFrame.new(Pos,Pos+SurfaceNorm)*CFrame.Angles(math.rad(90),0,0))-Vector3.new(0,7,0))*CFrame.Angles(math.rad(math.random(-50,50)),math.rad(math.random(-50,50)),math.rad(math.random(-50,50)))
						Parts[#Parts+1] = {P,P.CFrame,((CFrame.new(Pos,Pos+SurfaceNorm)*CFrame.Angles(math.rad(90),0,0))-Vector3.new(0,1,0))*CFrame.Angles(0,math.rad(i),0)*CFrame.new(0,0,-Radius)*CFrame.Angles(math.rad(math.random(-50,-20)),math.rad(math.random(-15,15)),math.rad(math.random(-15,15))),P.Size}
						if math.random(0,5) == 0 then -- rubble
							local P = Instance.new("Part",Torso.Parent)
							P.Anchored = true
							P.FormFactor = "Custom"
							P.BrickColor = Hit.BrickColor
							P.Material = Hit.Material
							P.TopSurface = "Smooth"
							P.BottomSurface = "Smooth"
							P.Size = Vector3.new(4,4,4)*(math.random(80,100)/100)
							P.CFrame = ((CFrame.new(Pos,Pos+SurfaceNorm)*CFrame.Angles(math.rad(90),0,0))-Vector3.new(0,2.5,0))*CFrame.Angles(math.rad(math.random(-50,50)),math.rad(math.random(-50,50)),math.rad(math.random(-50,50)))
							Parts[#Parts+1] = {P,P.CFrame,(CFrame.new(Pos,Pos+SurfaceNorm)*CFrame.Angles(math.rad(90),0,0))*CFrame.Angles(0,math.rad(i),0)*CFrame.new(0,0,-Radius-8)*CFrame.Angles(math.rad(math.random(-90,90)),math.rad(math.random(-90,90)),math.rad(math.random(-90,90))),P.Size}
							end
						end
						for i = 0,1,0.05 do
							for i2,v in pairs(Parts) do
								v[1].CFrame = LerpCFrame(v[2],v[3],ApplyTrig(i,math.cos))
							end
							wait(0.02)
						end
						for i,v in pairs(Parts) do
							if v[1].Size.X > 2.1 then
								v[1].CFrame = v[1].CFrame+Vector3.new(0,2,0)
							end
							v[1].Anchored = false
						end
						for i = 0,1,0.05 do
							for i2,v in pairs(Parts) do
								v[1].Transparency = i
								if i == 1 then
									v[1]:Destroy()
								elseif i >= 0.25 then
									v[1].CanCollide = false
								end
							end
						wait(0.02)
						end
					Parts = nil
					end)
				end

				
				Part = function(x,y,z,color,tr,cc,an,parent)
					local p = Instance.new('Part',parent or Weapon)
					p.formFactor = 'Custom'
					p.Size = Vector3.new(x,y,z)
					p.BrickColor = BrickColor.new(color)
					p.CanCollide = cc
					p.Transparency = tr
					p.Anchored = an
					p.TopSurface,p.BottomSurface = 0,0
					p.Locked=true
					p:BreakJoints()
				return p end

			Mesh = function(par,num,x,y,z)
			local msh = _
			if num == 1 then msh = Instance.new("CylinderMesh",par)
			elseif num == 2 then msh = Instance.new("SpecialMesh",par) msh.MeshType = 3
			elseif num == 3 then msh = Instance.new("BlockMesh",par)
			elseif num == 4 then msh = Instance.new("SpecialMesh",par) msh.MeshType = "Torso"
			elseif type(num) == 'string' then msh = Instance.new("SpecialMesh",par) msh.MeshId = num
			end msh.Scale = Vector3.new(x,y,z)
			return msh end

			function explosion(col1,col2,cfr,sz,rng,dmg)
				local a= Part(1,1,1,col1,.5,false,true,workspace)
				local a2= Part(1,1,1,col2,.5,false,true,workspace)
				local a3= Part(1,1,1,col2,.5,false,true,workspace)
				v1,v2,v3=sz.x,sz.y,sz.z
				local m= Mesh(a,'http://www.roblox.com/asset/?id=1185246',v1,v2,v3)
				local m2= Mesh(a2,3,v1/3,v2/3,v3/3)
				local m3= Mesh(a3,3,v1/3,v2/3,v3/3)
				a.CFrame=cfr
				a2.CFrame=cfr*CFrame.Angles(math.random(),math.random(),math.random())
				a3.CFrame=cfr*CFrame.Angles(math.random(),math.random(),math.random())

				Spawn(function()
					while wait() do
						if a.Transparency >= 1 then a:Destroy() a2:Destroy() a3:Destroy() break end
							m.Scale=m.Scale+Vector3.new(.1,0.1,0.1)
							m2.Scale=m2.Scale+Vector3.new(.1,0.1,0.1)
							m3.Scale=m3.Scale+Vector3.new(.1,0.1,0.1)
							a.Transparency=a.Transparency+0.05
							a2.Transparency=a2.Transparency+0.05
							a3.Transparency=a3.Transparency+0.05
						end
					end)
				end

				Crater(X,120)
				Crater(X,220)
				Crater(X,320)
				z = Instance.new("Sound",workspace)
				z.SoundId = "rbxassetid://231917744"
				z.Pitch = .5
				z.Volume = 5
				z1 = Instance.new("Sound",workspace)
				z1.SoundId = "rbxassetid://231917744"
				z1.Pitch = .5
				z1.Volume = 5
				z2 = Instance.new("Sound",workspace)
				z2.SoundId = "rbxassetid://231917744"
				z2.Pitch = .5
				z2.Volume = 5
				z3 = Instance.new("Sound",workspace)
				z3.SoundId = "rbxassetid://245537790"
				z3.Pitch = .7
				z3.Volume = 5
				z4 = Instance.new("Sound",workspace)
				z4.SoundId = "rbxassetid://245537790"
				z4.Pitch = .7
				z4.Volume = 5
                                z4a = Instance.new("Sound",workspace)
                                z4a.SoundId = "rbxassetid://419447292"
                                z4a.Pitch = 1
                                z4a.Volume = 5
                                z3a = Instance.new("Sound",workspace)
                                z3a.SoundId = "rbxassetid://421328847"
                                z3a.Pitch = 1
                                z3a.Volume = 5
                                wait(0.1)
				z:Play()
				z1:Play()
				z2:Play()
				z3:Play()
				z4:Play()
				z3a:Play()
				z4a:Play()

				local part=Instance.new('Part',rarm)
				part.Anchored=true
				part.CanCollide=false
				part.Locked = true
				part.FormFactor='Custom'
				part.Size=Vector3.new(2,2,2)
				part.CFrame=X.CFrame*CFrame.new(0,0,0)
				part.Transparency=0
				part.BrickColor=BrickColor.new('Really black')
				local mesh=Instance.new('SpecialMesh',part)
				mesh.MeshId='http://www.roblox.com/asset/?id=20329976'
				mesh.Scale=Vector3.new(4,4,4)
				local part2=part:clone()
				part2.Parent = rarm
				part2.BrickColor=BrickColor.new("Deep orange")
				local part5=part:clone()
				part5.Parent = rarm
				part5.BrickColor=BrickColor.new("Deep orange")
				local part6=part:clone()
				part6.Parent = rarm
				part6.BrickColor=BrickColor.new("Deep orange")
				local mesh2=mesh:clone()
				mesh2.Parent=part2
				mesh2.Scale=Vector3.new(6, 6, 6)
				local mesh5=mesh:clone()
				mesh5.Parent=part5
				mesh5.Scale=Vector3.new(6, 6, 6)
				local mesh6=mesh:clone()
				mesh6.Parent=part6
				mesh6.Scale=Vector3.new(6, 6, 6)
				local blast = Instance.new("Part", rarm)
				blast.BrickColor = BrickColor.new("Really black")
				blast.Anchored = true
				blast.CanCollide = false
				blast.Locked = true
				blast.Size = Vector3.new(2, 2, 2)
				blast.TopSurface = "Smooth"
				blast.BottomSurface = "Smooth"
				blast.Transparency = 0
				blast.CFrame = HandCF
				local bm = Instance.new("SpecialMesh", blast)
				bm.Scale = Vector3.new(10,2,10)
				bm.MeshId = "rbxassetid://3270017"
				local blast2 = Instance.new("Part", rarm)
				blast2.BrickColor = BrickColor.new("Really black")
				blast2.Anchored = true
				blast2.CanCollide = false
				blast2.Locked = true
				blast2.Size = Vector3.new(2, 2, 2)
				blast2.TopSurface = "Smooth"
				blast2.BottomSurface = "Smooth"
				blast2.Transparency = 0
				blast2.CFrame = HandCF
				local bm2 = Instance.new("SpecialMesh", blast2)
				bm2.Scale = Vector3.new(6,2,6)
				bm2.MeshId = "rbxassetid://3270017"
				local blast3 = Instance.new("Part", rarm)
				blast3.BrickColor = BrickColor.new("Really black")
				blast3.Anchored = true
				blast3.CanCollide = false
				blast3.Locked = true
				blast3.Size = Vector3.new(1, 1, 1)
				blast3.TopSurface = "Smooth"
				blast3.BottomSurface = "Smooth"
				blast3.Transparency = 0
				blast3.CFrame = HandCF
				local bm3 = Instance.new("SpecialMesh", blast3)
				bm3.Scale = Vector3.new(6,2,6)
				bm3.MeshId = "rbxassetid://3270017"
				for i = 1,120 do rs:wait()
					X.Transparency = X.Transparency + (1/120)
					part.Transparency = part.Transparency + (1/120)
					part2.Transparency = part2.Transparency + (1/120)
					part3.Transparency = part3.Transparency + (1/120)
					part4.Transparency = part4.Transparency + (1/120)
					part5.Transparency = part5.Transparency + (1/120)
					part6.Transparency = part6.Transparency + (1/120)
					part7.Transparency = part7.Transparency + (1/120)
					blast.Transparency = blast.Transparency + (1/120)
					blast2.Transparency = blast2.Transparency + (1/120)
					blast3.Transparency = blast3.Transparency + (1/120)
					X.Size = X.Size + Vector3.new(1.6,1.6,1.6)
					--part3.Size = part3.Size + Vector3.new(6,6,6)
					mesh.Scale = mesh.Scale + Vector3.new(2,.4,2)
					mesh2.Scale = mesh2.Scale + Vector3.new(2.2,.4,2.2)
					mesh3.Scale = mesh3.Scale + Vector3.new(6,6,6)
					mesh4.Scale = mesh4.Scale + Vector3.new(3.4,3.4,3.4)
					mesh5.Scale = mesh5.Scale + Vector3.new(3.2,.4,3.2)
					mesh6.Scale = mesh6.Scale + Vector3.new(4,.4,4)
					mesh7.Scale = mesh7.Scale + Vector3.new(8,8,8)
					bm.Scale = bm.Scale + Vector3.new(12,12,.4)
					bm2.Scale = bm2.Scale + Vector3.new(8,8,.4)
					bm3.Scale = bm3.Scale + Vector3.new(8,8,.4)
					X.CFrame = cf
					part.CFrame=X.CFrame * CFrame.Angles(0,math.rad(i*2),0)
					part2.CFrame=X.CFrame * CFrame.Angles(0,math.rad(-i*2),0)
					part3.CFrame=X.CFrame
					part4.CFrame=X.CFrame
					part7.CFrame=X.CFrame
					part5.CFrame=X.CFrame * CFrame.Angles(0,math.rad(i*2.6),0)
					part6.CFrame=X.CFrame * CFrame.Angles(0,math.rad(-i*2.4),0)
					blast.CFrame=X.CFrame * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
					blast2.CFrame=X.CFrame * CFrame.Angles(math.rad(-i*4), math.rad(i*4), math.rad(0))
					blast3.CFrame=X.CFrame * CFrame.Angles(math.rad(180+i*4), math.rad(90-i*4), math.rad(0))
					rs:wait()
					end
					X:Destroy()
					part:Destroy()
					part2:Destroy()
					part3:Destroy()
					part4:Destroy()
					part5:Destroy()
					part6:Destroy()
					blast:Destroy()
					blast2:Destroy()
					blast3:Destroy()
					z:Destroy()
					z1:Destroy()
					z2:Destroy()
					z3:Destroy()
					z4:Destroy()
		end
	end)
	
	
			if Debounces.CanAttack == false then
				Debounces.CanAttack = true
				Debounces.NoIdl = false
				Debounces.on = false
			end
	end
	end
	end)







function Throw()
	    if Grab == true then
        Grab = false
	stanceToggle = "Normal"
			for i = 1, 16 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65,0)*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(20)), 0.3)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.65,0)*CFrame.Angles(math.rad(140),math.rad(0),math.rad(-50)), 0.3)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-.2)*CFrame.Angles(math.rad(20),math.rad(-60),0), 0.3)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(0, math.rad(50), 0), 0.3)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(0), math.rad(30), math.rad(-20)), 0.3)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(-15), math.rad(20)), 0.3)
			if Debounces.on == false then end
			rs:wait()
			end
					for i = 1, 16 do
			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65,0)*CFrame.Angles(math.rad(20),math.rad(0),math.rad(20)), 0.3)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,1.5,-.4)*CFrame.Angles(math.rad(-90),math.rad(0),math.rad(20)), 0.3)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-.2)*CFrame.Angles(math.rad(0),math.rad(-10),0), 0.3)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), 0), 0.3)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(30), math.rad(-20)), 0.3)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-15), math.rad(-15), math.rad(20)), 0.3)
			if Debounces.on == false then end
			rs:wait()
		end
       
	
                                    z3 = Instance.new("Sound",torso)
                                    z3.SoundId = "rbxassetid://200632136"
									z3.Pitch = 0.7
                                    z3.Volume = 14
                                    z3:Play()	
	
        for i,v in pairs(larm:GetChildren()) do
            if v.Name == "asd" and v:IsA("Weld") then
                v:Remove()
            end
        end

        Ragdoll(true,gp)
        bv = Instance.new("BodyVelocity",gp:FindFirstChild("Torso"))
        bv.maxForce = Vector3.new(400000, 400000, 400000)
        bv.P = 125000
        bv.velocity = char.Head.CFrame.lookVector * 70



        for i = 1, 12 do
            larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.6, 0, -.75)*CFrame.Angles(math.rad(120),math.rad(0),math.rad(20)), 0.5)
            if Debounces.on == false then end
            wait()
        end
        ht=nil
        Spawn(function()
            wait(0.5)
            bv:Destroy()
        end)
		stanceToggle = "Idle1"
        Debounces.on = false
        Debounces.NoIdl = false
        elseif ht == nil then wait()
        Grab = false
        Debounces.on = false
        Debounces.NoIdl = false
            end
        end



function Drop()
	if Grab == true then
		Grab = false
		for i,v in pairs(larm:GetChildren()) do
            if v.Name == "asd" and v:IsA("Weld") then
                v:Remove()
            end
		        end
		wait(0.1)
		stanceToggle = "Idle1"

	end
end


mouse.KeyDown:connect(function(key)
    if key == "x" then
  if Grab == true then
		Throw()
		end
		end
	end)

function Break()
	if Grab == true then
		z3 = Instance.new("Sound",torso)
        z3.SoundId = "rbxassetid://314390675"
		z3.Pitch = 0.7
        z3.Volume = 34
        z3:Play()
        wait(0.1)
        Ragdoll(true,gp)	
	end
end


mouse.KeyDown:connect(function(key)
    if key == "c" then
  if Grab == true then
		Break()
		end
		end
end)

mouse.KeyDown:connect(function(key)
    if key == "v" then
  if Grab == true then
		Drop()
		end
		end
end)

mouse.KeyDown:connect(function(key)
	if key == "g" then
		if Grab == true then
			FinishHim()
		end
	end
end)



local animpose = "Idle1"
local lastanimpose = "Idle1"
local grab = false
local Smooth = 1
local sine = 0
local change = 1
local val = 0
local ffing = false
----------------------------------------------------
x = Instance.new("Sound", char)
x.SoundId = "http://www.roblox.com/asset/?id=198360408"
x.Looped = true
x.Volume = 15
local footsteps = false
---------------------------------------------
jump = false
rs:connect(function()
	if char.Humanoid.Jump == true then
		jump = true
	else
		jump = false
	end
	char.Humanoid.FreeFalling:connect(function(f)
		if f then
			ffing = true
		else
			ffing = false
		end
	end)
	sine = sine + change
	if jump == true then
		animpose = "Jumping"
	elseif ffing == true then
		animpose = "Freefalling"
	elseif (torso.Velocity*Vector3.new(1, 0, 1)).magnitude < 2 then
		animpose = "Idle"
	elseif (torso.Velocity*Vector3.new(1, 0, 1)).magnitude < 20 then
		animpose = "Walking"
	elseif (torso.Velocity*Vector3.new(1, 0, 1)).magnitude > 20 then
		animpose = "Running"
	end
	RightLeg = CFrame.new(0.5,-1,0)
	LeftLeg = CFrame.new(-0.5,-1,0)

	lefth = (torso.CFrame*LeftLeg)
	righth = (torso.CFrame*RightLeg)

	speed = Vector3.new(torso.Velocity.X,0,torso.Velocity.Z)

	TiltOnAxis = (torso.CFrame-torso.CFrame.p):vectorToObjectSpace(speed/100)

	local AngleThetaR = (righth-righth.p):vectorToObjectSpace(speed/100)
	local AngleThetaL = (lefth-lefth.p):vectorToObjectSpace(speed/100)
	if animpose ~= lastanimpose then
		sine = 0
		if Debounces.NoIdl == false then
			if stanceToggle == "Idle1" then
				rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.6,0.2)*CFrame.Angles(math.rad(-12-4*math.cos(sine/22)),math.rad(-12-2*math.cos(sine/22)),math.rad(12+2*math.cos(sine/22))), 0.3)
				larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.6,-0.2)*CFrame.Angles(math.rad(20+4*math.cos(sine/22)),math.rad(-22-2*math.cos(sine/22)),math.rad(-15-2*math.cos(sine/22))), 0.3)
				hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(-12+2.5*math.cos(sine/22)),math.rad(0),math.rad(0)), 0.2)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-2+2*math.cos(sine/22)), math.rad(0), 0), 0.2)
				lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, -0.06) * CFrame.Angles(math.rad(0-2*math.cos(sine/22)), math.rad(5), math.rad(-5)), 0.2)
				rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, -0.06) * CFrame.Angles(math.rad(0-2*math.cos(sine/22)), math.rad(-5), math.rad(5)), 0.2)
			elseif stanceToggle == "Idle2" then
				rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.6,0.2)*CFrame.Angles(math.rad(-22-4*math.cos(sine/12)),math.rad(-40-2*math.cos(sine/12)),math.rad(24+2*math.cos(sine/12))), 0.3)
				larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.2,0.6,-0.6)*CFrame.Angles(math.rad(90+4*math.cos(sine/12)),math.rad(0),math.rad(50-2*math.cos(sine/12))), 0.3)
				hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(-6+2.5*math.cos(sine/12)),math.rad(0),math.rad(0)), 0.2)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1.5, 0) * CFrame.Angles(math.rad(-20+2*math.cos(sine/12)), math.rad(0), 0), 0.2)
				lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.4, -1) * CFrame.Angles(math.rad(-7-2*math.cos(sine/12)), math.rad(7), math.rad(-5)), 0.2)
				rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.8, -0.2) * CFrame.Angles(math.rad(-30-2*math.cos(sine/12)), math.rad(-9), math.rad(5)), 0.2)
			end
			fat.Event:wait()
		end
		else
	end
	lastanimpose = animpose
	if Debounces.NoIdl == false then
		if animpose == "Idle" then
			change = 0.5
			if stanceToggle == "Idle1" then

				rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.6+0.05*math.cos(sine/10),0.6+0.1*math.cos(sine/10),-0.2-0.1*math.cos(sine/10))*CFrame.Angles(math.rad(8+2.5*math.cos(sine/10)),math.rad(22+7*math.cos(sine/10)),math.rad(15+2*math.cos(sine/10))), 0.8)
				rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.5)
				larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.6-0.05*math.cos(sine/10),0.6+0.1*math.cos(sine/10),0.2+0.1*math.cos(sine/10))*CFrame.Angles(math.rad(-8-2.5*math.cos(sine/10)),math.rad(12+5*math.cos(sine/10)),math.rad(-12-3*math.cos(sine/10))), 0.8)
				larm.Weld.C1 = Lerp(larm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.5)
				hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-0.1+0.05*math.cos(sine/10))*CFrame.Angles(math.rad(-15+3*math.cos(sine/10)),math.rad(0),math.rad(0)), 0.5)
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(20-3*math.cos(sine/10)),math.rad(0)), 0.5)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-6+3*math.cos(sine/10)), math.rad(0), 0), 0.1)
				torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0-0.08*math.cos(sine/10), -1, 0) * CFrame.Angles(math.rad(0), math.rad(-20+3*math.cos(sine/10)), 0), 0.1)
				lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, -0.14+0.06*math.cos(sine/10)) * CFrame.Angles(math.rad(-3-3*math.cos(sine/10)), math.rad(0), math.rad(0)), 0.1)
				lleg.Weld.C1 = Lerp(lleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(-10-3*math.cos(sine/10)), math.rad(5+3*math.cos(sine/10))), 0.1)
				rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, -0.06) * CFrame.Angles(math.rad(8-3*math.cos(sine/10)), math.rad(0), math.rad(0)), 0.1)
				rleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(10-3*math.cos(sine/10)), math.rad(-5+3*math.cos(sine/10))), 0.1)
			elseif stanceToggle == "Idle2" then

				rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65-0.1*math.cos(sine/3),0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(20-2*math.cos(sine/3))), 0.1)
				rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.2)
				larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.23, 0.5, -.56) * CFrame.Angles(math.rad(88+4*math.cos(sine/3)), 0, math.rad(45)), 0.6)
				larm.Weld.C1 = Lerp(larm.Weld.C1, CFrame.new(0,0.5,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.2)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -2-0.05*math.cos(sine/3), 0) * CFrame.Angles(math.rad(-10+2*math.cos(sine/6)), 0, 0), 0.8)
				torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), 0), 0.1)
				hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -.2) * CFrame.Angles(math.rad(-10), 0, 0), 0.3)
				--hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0, 1.5, -.2) * CFrame.Angles(math.rad(-5-10*math.cos(sine/18)), math.sin(sine/36)/3, 0), 0.3)
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.5)
				lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, 0, -1.15) * CFrame.Angles(math.rad(-9-2*math.cos(sine/6)), 0, 0), 0.8)
				lleg.Weld.C1 = Lerp(lleg.Weld.C1, CFrame.new(0, 1-0.1*math.cos(sine/3), 0+0.04*math.cos(sine/6)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(5)), 0.8)
				rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, -.1) * CFrame.Angles(math.rad(-56-2*math.cos(sine/6)), 0, 0), 0.8)
				rleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1-0.05*math.cos(sine/3), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-5)), 0.8)
			elseif stanceToggle == "Grabbed" then
				grab = true
				rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5,0.65+0.1*math.cos(sine/14),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(40+2*math.cos(sine/14))), 0.2)
				rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0,0.5, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0)), 0.2)
				larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.3,1.25,0)*CFrame.Angles(math.rad(100+2*math.cos(sine/14)),math.rad(-62),math.rad(-80+4*math.cos(sine/14))), 0.3)
				larm.Weld.C1 = Lerp(larm.Weld.C1, CFrame.new(0,0.5, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0)), 0.2)
				hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-.2)*CFrame.Angles(math.rad(14+2*math.cos(sine/14)),math.rad(70-4*math.cos(sine/14)),0), 0.3)
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.5)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(0, math.rad(-70), 0), 0.3)
				torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), 0), 0.1)
				lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1, 0) * CFrame.Angles(math.rad(10), math.rad(30), math.rad(-20)), 0.3)
				lleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.8)
				rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(-15), math.rad(20)), 0.3)
				rleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.8)
			end
		elseif animpose == "Walking" then
			if stanceToggle == "Grabbed" then
				rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5-.05*math.cos(sine/2), math.sin(sine/4)/4) * CFrame.Angles(-math.sin(sine/4)/2.8, -math.sin(sine/4)/3, (math.rad(10+7*math.cos(sine/2))+root.RotVelocity.Y/30)), 0.4)
				rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.7)
				larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5,0.65,0)*CFrame.Angles(math.rad(120+4*math.cos(sine/2)),math.rad(-62),math.rad(-30+4*math.cos(sine/4))), 0.3)
				larm.Weld.C1 = Lerp(larm.Weld.C1, CFrame.new(0,0.5, 0)*CFrame.Angles(math.rad(0), math.rad(0),math.rad(0)), 0.2)
				hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-0.1+0.1*math.cos(sine/2))*CFrame.Angles(math.rad(-10+4*math.cos(sine/2)), math.rad(0-8*math.cos(sine/4)/2.3), math.rad(0)),0.4)
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0)-root.RotVelocity.Y/10,math.rad(0)), 0.7)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1+0.12*math.cos(sine/2), 0) * CFrame.Angles(math.rad(-4+2*math.cos(sine/2)), math.rad(0+10*math.cos(sine/4)/2.3)+root.RotVelocity.Y/30, math.rad(0)+root.RotVelocity.Y/30), 0.4)
				--rj.C0 = rj.C0:lerp(CFrame.Angles(math.rad(-90)+TiltOnAxis.Z,TiltOnAxis.X,math.rad(180)+-TiltOnAxis.X),.1)
				torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), 0), 0.8)
				lleg.Weld.C0 = lleg.Weld.C0:lerp(CFrame.new(-0.5,-1-math.cos(sine/4)*.3,0+math.sin(sine/4)*.1)*CFrame.Angles(math.sin(sine/4)*3*AngleThetaL.Z,AngleThetaL.X,(math.sin(sine/4)*3*-AngleThetaL.X)-root.RotVelocity.Y/20),0.8)
				lleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.8)
				rleg.Weld.C0 = rleg.Weld.C0:lerp(CFrame.new(0.5,-1+math.cos(sine/4)*.3,0-math.sin(sine/4)*.1)*CFrame.Angles(math.sin(sine/4)*3*-AngleThetaR.Z,AngleThetaR.X,(math.sin(sine/4)*3*AngleThetaR.X)-root.RotVelocity.Y/20),0.8)
				rleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.8)
			elseif stanceToggle ~= "Grabbed" then
				change = 0.5
		
				rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.5-.05*math.cos(sine/2), math.sin(sine/4)/4) * CFrame.Angles(-math.sin(sine/4)/2.8, -math.sin(sine/4)/3, (math.rad(10+7*math.cos(sine/2))+root.RotVelocity.Y/30)), 0.4)
				rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.7)
				larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.5+.05*math.cos(sine/2), -math.sin(sine/4)/4)*CFrame.Angles(math.sin(sine/4)/2.8, -math.sin(sine/4)/3, (math.rad(-10-7*math.cos(sine/2))+root.RotVelocity.Y/30)), 0.4)
				larm.Weld.C1 = Lerp(larm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.7)
				hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-0.1+0.1*math.cos(sine/2))*CFrame.Angles(math.rad(-10+4*math.cos(sine/2)), math.rad(0-8*math.cos(sine/4)/2.3), math.rad(0)),0.4)
				hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0)-root.RotVelocity.Y/10,math.rad(0)), 0.7)
				torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1+0.12*math.cos(sine/2), 0) * CFrame.Angles(math.rad(-4+2*math.cos(sine/2)), math.rad(0+10*math.cos(sine/4)/2.3)+root.RotVelocity.Y/30, math.rad(0)+root.RotVelocity.Y/30), 0.4)
				--rj.C0 = rj.C0:lerp(CFrame.Angles(math.rad(-90)+TiltOnAxis.Z,TiltOnAxis.X,math.rad(180)+-TiltOnAxis.X),.1)
				torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), 0), 0.8)
				--lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.9-0.24*math.cos(sine/4)/2.8, -0.05 + math.sin(sine/4)/3.4) * CFrame.Angles(math.rad(-5)-math.sin(sine/4)/2.1, math.rad(0-10*math.cos(sine/4)/2.3), 0-root.RotVelocity.Y/20), .4)
				lleg.Weld.C0 = lleg.Weld.C0:lerp(CFrame.new(-0.5,-1-math.cos(sine/4)*.3,0+math.sin(sine/4)*.1)*CFrame.Angles(math.sin(sine/4)*3*AngleThetaL.Z,AngleThetaL.X,(math.sin(sine/4)*3*-AngleThetaL.X)-root.RotVelocity.Y/20),0.8)
				lleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.8)
				--rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.9+0.24*math.cos(sine/4)/2.8, -0.05 + -math.sin(sine/4)/3.4) * CFrame.Angles(math.rad(-5)+math.sin(sine/4)/2.1, math.rad(0-10*math.cos(sine/4)/2.3), 0-root.RotVelocity.Y/20), .4)
				rleg.Weld.C0 = rleg.Weld.C0:lerp(CFrame.new(0.5,-1+math.cos(sine/4)*.3,0-math.sin(sine/4)*.1)*CFrame.Angles(math.sin(sine/4)*3*-AngleThetaR.Z,AngleThetaR.X,(math.sin(sine/4)*3*AngleThetaR.X)-root.RotVelocity.Y/20),0.8)
				rleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.8)
			end
		elseif animpose == "Running" then
			change = 1

			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.24+.6*math.cos(sine/4)/1.4, 0.54, 0+0.8*math.cos(sine/4)) * CFrame.Angles(math.rad(6-140*math.cos(sine/4)/1.2), math.rad(0), math.rad(-20+70*math.cos(sine/4))), 0.2)
			rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.36)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.24+.6*math.cos(sine/4)/1.4, 0.54, 0-0.8*math.cos(sine/4))*CFrame.Angles(math.rad(6+140*math.cos(sine/4)/1.2), math.rad(0), math.rad(20+70*math.cos(sine/4))), 0.2)
			larm.Weld.C1 = Lerp(larm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.5)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,-.2)*CFrame.Angles(math.rad(-8+12*math.cos(sine/2)/1.5), math.rad(0+12*math.cos(sine/4)), math.rad(0)),0.2)
			hed.Weld.C1 = Lerp(hed.Weld.C1, CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0)-root.RotVelocity.Y/10,math.rad(0)), 0.5)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1+0.2*math.cos(sine/2)/1.7, 0) * CFrame.Angles(math.rad(-14+10*math.cos(sine/2)/1.5), math.rad(0-12*math.cos(sine/4))-root.RotVelocity.Y/10, math.rad(0)+root.RotVelocity.Y/20), 0.2)
			torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), 0), 0.4)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -.8-0.4*math.cos(sine/4)/2, math.sin(sine/4)/2) * CFrame.Angles(math.rad(-10) + -math.sin(sine/4)/1.2, math.rad(0+12*math.cos(sine/4))+root.RotVelocity.Y/10, 0), .8)
			lleg.Weld.C1 = Lerp(lleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -.8+0.4*math.cos(sine/4)/2, -math.sin(sine/4)/2) * CFrame.Angles(math.rad(-10) + math.sin(sine/4)/1.2, math.rad(0+12*math.cos(sine/4))+root.RotVelocity.Y/10, 0), .8)
			rleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		elseif animpose == "Jumping" then

			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.6, 0)*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(20)), 0.2)
			rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.36)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.6, 0)*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(-20)), 0.2)
			larm.Weld.C1 = Lerp(larm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.5)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(30),math.rad(0),0), 0.2)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-10), math.rad(0), 0), 0.2)
			torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), 0), 0.4)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -1.1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.2)
			lleg.Weld.C1 = Lerp(lleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -1.1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.2)
			rleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		elseif animpose == "Freefalling" then

			rarm.Weld.C0 = Lerp(rarm.Weld.C0, CFrame.new(1.5, 0.6, 0)*CFrame.Angles(math.rad(-40),math.rad(20),math.rad(50)), 0.2)
			rarm.Weld.C1 = Lerp(rarm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.36)
			larm.Weld.C0 = Lerp(larm.Weld.C0, CFrame.new(-1.5, 0.6, 0)*CFrame.Angles(math.rad(110),math.rad(-20),math.rad(-30)), 0.2)
			larm.Weld.C1 = Lerp(larm.Weld.C1, CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)), 0.5)
			hed.Weld.C0 = Lerp(hed.Weld.C0, CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(10),math.rad(0),0), 0.2)
			torso.Weld.C0 = Lerp(torso.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-30), math.rad(0), 0), 0.2)
			torso.Weld.C1 = Lerp(torso.Weld.C1, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(0), math.rad(0), 0), 0.4)
			lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.5, -0.5, 0.2) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)), 0.2)
			lleg.Weld.C1 = Lerp(lleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
			rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.5, -0.5, -0.6) * CFrame.Angles(math.rad(40), math.rad(0), math.rad(0)), 0.2)
			rleg.Weld.C1 = Lerp(rleg.Weld.C1, CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.4)
		end
	end

if animpose == "Walking" then
    if footsteps == false then
        x:Play()
        footsteps = true
    end
    x.Pitch = 1.1
elseif animpose == "Idle" then
    x:Stop()
    footsteps = false
elseif animpose == "Running" then
    x.Pitch = 1.2
    if footsteps == false then
        x:Play()
        footsteps = true
    end
end
end)
hum.MaxHealth = math.huge
wait(3)
hum.Health = math.huge
