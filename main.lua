--// EXHUB GUI FINAL (BUTTON SIZE + GREEN TITLE)

pcall(function()
    if game.CoreGui:FindFirstChild("EXHUB") then
        game.CoreGui.EXHUB:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "EXHUB"
ScreenGui.ResetOnSpawn = false

-- ICONO
local Icon = Instance.new("TextButton", ScreenGui)
Icon.Size = UDim2.new(0,60,0,60)
Icon.Position = UDim2.new(0.5,-30,0.5,-30)
Icon.Text = "EX"
Icon.Font = Enum.Font.GothamBold
Icon.TextSize = 22
Icon.TextColor3 = Color3.fromRGB(255,255,255)
Icon.BackgroundColor3 = Color3.fromRGB(30,30,30)
Icon.BorderSizePixel = 0
Icon.Active = true
Icon.Draggable = true
Icon.AutoButtonColor = false
Instance.new("UICorner", Icon).CornerRadius = UDim.new(0,12)

-- MAIN
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0,520,0,320)
Main.Position = UDim2.new(0.5,-260,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)

-- TOP BAR
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,36)
Top.BackgroundColor3 = Color3.fromRGB(25,25,25)
Top.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,-120,1,0)
Title.Position = UDim2.new(0,12,0,0)
Title.Text = "EXHUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 17
Title.TextColor3 = Color3.fromRGB(0, 255, 120) -- VERDE
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

-- BOTÓN MINIMIZAR (MÁS GRANDE)
local Min = Instance.new("TextButton", Top)
Min.Size = UDim2.new(0,40,1,0)
Min.Position = UDim2.new(1,-80,0,0)
Min.Text = "__"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 16
Min.TextColor3 = Color3.fromRGB(220,220,220)
Min.BackgroundTransparency = 1

-- BOTÓN CERRAR (MÁS GRANDE)
local Close = Instance.new("TextButton", Top)
Close.Size = UDim2.new(0,40,1,0)
Close.Position = UDim2.new(1,-40,0,0)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.TextColor3 = Color3.fromRGB(255,80,80)
Close.BackgroundTransparency = 1

-- CATEGORIES
local Cats = Instance.new("Frame", Main)
Cats.Size = UDim2.new(0,140,1,-36)
Cats.Position = UDim2.new(0,0,0,36)
Cats.BackgroundColor3 = Color3.fromRGB(22,22,22)
Cats.BorderSizePixel = 0
Instance.new("UIListLayout", Cats).Padding = UDim.new(0,4)

-- SCROLL BUTTONS
local Buttons = Instance.new("ScrollingFrame", Main)
Buttons.Size = UDim2.new(1,-140,1,-36)
Buttons.Position = UDim2.new(0,140,0,36)
Buttons.CanvasSize = UDim2.new(0,0,0,0)
Buttons.ScrollBarThickness = 6
Buttons.BackgroundColor3 = Color3.fromRGB(18,18,18)
Buttons.BorderSizePixel = 0

local List = Instance.new("UIListLayout", Buttons)
List.Padding = UDim.new(0,6)

List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Buttons.CanvasSize = UDim2.new(0,0,0,List.AbsoluteContentSize.Y + 10)
end)

-- FUNCTIONS
local function Clear()
    for _,v in pairs(Buttons:GetChildren()) do
        if v:IsA("TextButton") then v:Destroy() end
    end
end

local function AddButton(name, func)
    local b = Instance.new("TextButton", Buttons)
    b.Size = UDim2.new(1,-12,0,44) -- BOTONES GRANDES
    b.Position = UDim2.new(0,6,0,0)
    b.Text = name
    b.Font = Enum.Font.Gotham
    b.TextSize = 15
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(35,35,35)
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
    b.MouseButton1Click:Connect(func)
end

-- DATA (SIN CAMBIOS)
local Data = {
    ["Todos"] = {
        {"Infinite Yield", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-modded-80479"))() end},
        {"JMods Universal", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Jmods-Universal-38764"))() end},
        {"GhostHub", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ghosthub-free-premium-features-62168"))() end},
        {"CoolGui Clan", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua", true))() end},
        {"FlyGUI", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-gui-v3-78856"))() end},
        {"Drip Client", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Drip-client-58433"))() end},
        {"AtherHub", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-AtherHub-17204"))() end},
    },
    ["Troll"] = {
        {"Infinite Yield", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-modded-80479"))() end},
        {"JMods Universal", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Jmods-Universal-38764"))() end},
        {"GhostHub", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ghosthub-free-premium-features-62168"))() end},
        {"CoolGui Clan", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua", true))() end},
    },
    ["Diversión"] = {
        {"JMods", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Jmods-Universal-38764"))() end},
        {"FlyGUI", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-gui-v3-78856"))() end},
    },
    ["Brookhaven RP"] = {
        {"Drip Client", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Drip-client-58433"))() end},
    },
    ["Murder Mystery"] = {
        {"AtherHub", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-AtherHub-17204"))() end},
    }
}

-- CREATE CATEGORIES
for name, list in pairs(Data) do
    local c = Instance.new("TextButton", Cats)
    c.Size = UDim2.new(1,-8,0,34)
    c.Position = UDim2.new(0,4,0,0)
    c.Text = name
    c.Font = Enum.Font.Gotham
    c.TextSize = 14
    c.TextColor3 = Color3.new(1,1,1)
    c.BackgroundColor3 = Color3.fromRGB(32,32,32)
    c.BorderSizePixel = 0
    Instance.new("UICorner", c).CornerRadius = UDim.new(0,8)

    c.MouseButton1Click:Connect(function()
        Clear()
        for _,v in pairs(list) do
            AddButton(v[1], v[2])
        end
    end)
end

-- EVENTS
Icon.MouseButton1Click:Connect(function()
    Main.Visible = true
    Icon.Visible = false
end)

Min.MouseButton1Click:Connect(function()
    Main.Visible = false
    Icon.Visible = true
end)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
