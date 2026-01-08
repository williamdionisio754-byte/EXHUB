-- EXHUB | main.lua
local plr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Name = "EXHUB"
gui.ResetOnSpawn = false
gui.Parent = plr:WaitForChild("PlayerGui")

-- DRAG
local function drag(f)
	local d, ds, sp
	f.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			d = true; sp = i.Position; ds = f.Position
			i.Changed:Connect(function()
				if i.UserInputState == Enum.UserInputState.End then d = false end
			end)
		end
	end)
	UIS.InputChanged:Connect(function(i)
		if d and i.UserInputType == Enum.UserInputType.MouseMovement then
			f.Position = UDim2.new(
				ds.X.Scale, ds.X.Offset + (i.Position - sp).X,
				ds.Y.Scale, ds.Y.Offset + (i.Position - sp).Y
			)
		end
	end)
end

-- ICONO
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.fromOffset(60,60)
icon.Position = UDim2.fromScale(.5,.5)
icon.AnchorPoint = Vector2.new(.5,.5)
icon.Text = "EX"
icon.TextSize = 20
icon.BackgroundColor3 = Color3.fromRGB(30,30,30)
icon.TextColor3 = Color3.fromRGB(0,255,0)
icon.BorderSizePixel = 0
drag(icon)

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromOffset(520,330)
main.Position = UDim2.fromScale(.5,.5)
main.AnchorPoint = Vector2.new(.5,.5)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.BorderSizePixel = 0
main.Visible = false
drag(main)

-- TOP
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,40)
top.BackgroundColor3 = Color3.fromRGB(15,15,15)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "EXHUB"
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(0,255,0)

local btnMin = Instance.new("TextButton", top)
btnMin.Text = "__"
btnMin.Size = UDim2.fromOffset(48,30)
btnMin.Position = UDim2.new(1,-104,0,5)
btnMin.BackgroundColor3 = Color3.fromRGB(60,60,60)
btnMin.BorderSizePixel = 0

local btnClose = Instance.new("TextButton", top)
btnClose.Text = "X"
btnClose.Size = UDim2.fromOffset(48,30)
btnClose.Position = UDim2.new(1,-52,0,5)
btnClose.BackgroundColor3 = Color3.fromRGB(120,30,30)
btnClose.BorderSizePixel = 0

-- SIDEBAR
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,150,1,-40)
side.Position = UDim2.new(0,0,0,40)
side.BackgroundColor3 = Color3.fromRGB(25,25,25)

local sideLayout = Instance.new("UIListLayout", side)
sideLayout.Padding = UDim.new(0,6)

-- CONTENT
local cont = Instance.new("ScrollingFrame", main)
cont.Size = UDim2.new(1,-150,1,-40)
cont.Position = UDim2.new(0,150,0,40)
cont.CanvasSize = UDim2.new(0,0,0,0)
cont.ScrollBarImageTransparency = 0.3
cont.BackgroundTransparency = 1

local contLayout = Instance.new("UIListLayout", cont)
contLayout.Padding = UDim.new(0,8)

-- DATA
local SCRIPTS = {
	Todos = {
		{"Infinite Yield","https://rawscripts.net/raw/Universal-Script-Infinite-Yield-modded-80479"},
		{"JMods Universal","https://rawscripts.net/raw/Universal-Script-Jmods-Universal-38764"},
		{"GhostHub","https://rawscripts.net/raw/Universal-Script-Ghosthub-free-premium-features-62168"},
		{"CoolGui Clan","https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua"},
		{"Fling All","https://pastebin.com/raw/zqyDSUWX"},
		{"JMods","https://rawscripts.net/raw/Universal-Script-Jmods-Universal-38764"},
		{"FlyGui","https://rawscripts.net/raw/Universal-Script-Fly-gui-v3-78856"},
		{"Drip Client","https://rawscripts.net/raw/Brookhaven-RP-Drip-client-58433"},
		{"AtherHub","https://rawscripts.net/raw/Murder-Mystery-2-AtherHub-17204"},
	},
	Troll = {
		{"Infinite Yield","https://rawscripts.net/raw/Universal-Script-Infinite-Yield-modded-80479"},
		{"JMods Universal","https://rawscripts.net/raw/Universal-Script-Jmods-Universal-38764"},
		{"GhostHub","https://rawscripts.net/raw/Universal-Script-Ghosthub-free-premium-features-62168"},
		{"CoolGui Clan","https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua"},
		{"Fling All","https://pastebin.com/raw/zqyDSUWX"},
	},
	["Diversión"] = {
		{"JMods","https://rawscripts.net/raw/Universal-Script-Jmods-Universal-38764"},
		{"FlyGui","https://rawscripts.net/raw/Universal-Script-Fly-gui-v3-78856"},
	},
	["Brookhaven RP"] = {
		{"Drip Client","https://rawscripts.net/raw/Brookhaven-RP-Drip-client-58433"},
	},
	["Murder Mystery"] = {
		{"AtherHub","https://rawscripts.net/raw/Murder-Mystery-2-AtherHub-17204"},
	}
}

-- FUNCTIONS
local function clearContent()
	for _,v in ipairs(cont:GetChildren()) do
		if v:IsA("TextButton") then v:Destroy() end
	end
end

local function loadCategory(cat)
	clearContent()
	for _,s in ipairs(SCRIPTS[cat]) do
		local b = Instance.new("TextButton", cont)
		b.Size = UDim2.new(1,-12,0,42)
		b.Text = s[1]
		b.TextSize = 16
		b.BackgroundColor3 = Color3.fromRGB(35,35,35)
		b.TextColor3 = Color3.new(1,1,1)
		b.BorderSizePixel = 0
		b.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(s[2]))()
		end)
	end
	task.wait()
	cont.CanvasSize = UDim2.new(0,0,0, contLayout.AbsoluteContentSize.Y + 10)
end

-- CATEGORIES BUTTONS
for name,_ in pairs(SCRIPTS) do
	local b = Instance.new("TextButton", side)
	b.Size = UDim2.new(1,-12,0,36)
	b.Text = name
	b.TextSize = 15
	b.BackgroundColor3 = Color3.fromRGB(40,40,40)
	b.TextColor3 = Color3.new(1,1,1)
	b.BorderSizePixel = 0
	b.MouseButton1Click:Connect(function()
		loadCategory(name)
	end)
end

-- EVENTS
icon.MouseButton1Click:Connect(function()
	main.Visible = true
	icon.Visible = false
	loadCategory("Todos")
end)

btnMin.MouseButton1Click:Connect(function()
	main.Visible = false
	icon.Visible = true
end)

btnClose.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
