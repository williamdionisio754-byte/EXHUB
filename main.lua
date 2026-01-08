-- EXHUB | FULL VERSION

local player = game.Players.LocalPlayer

-- Evitar duplicado
if player.PlayerGui:FindFirstChild("EXHUB") then
    player.PlayerGui.EXHUB:Destroy()
end

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "EXHUB"
gui.ResetOnSpawn = false

-- ICONO
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.fromOffset(60,60)
icon.Position = UDim2.fromScale(0.5,0.5)
icon.AnchorPoint = Vector2.new(0.5,0.5)
icon.Text = "EX"
icon.Font = Enum.Font.GothamBold
icon.TextSize = 22
icon.TextColor3 = Color3.fromRGB(0,255,0)
icon.BackgroundColor3 = Color3.fromRGB(30,30,30)
icon.BorderSizePixel = 0
icon.Active = true
icon.Draggable = true
Instance.new("UICorner", icon).CornerRadius = UDim.new(0,12)

-- GUI PRINCIPAL
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromOffset(560,360)
main.Position = UDim2.fromScale(0.5,0.5)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.BorderSizePixel = 0
main.Visible = false
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

-- TOPBAR
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,42)
top.BackgroundColor3 = Color3.fromRGB(15,15,15)
top.BorderSizePixel = 0
Instance.new("UICorner", top).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "EXHUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(0,255,0)

-- BOTÓN MINIMIZAR
local btnMin = Instance.new("TextButton", top)
btnMin.Size = UDim2.fromOffset(50,30)
btnMin.Position = UDim2.new(1,-110,0,6)
btnMin.Text = "__"
btnMin.Font = Enum.Font.GothamBold
btnMin.TextSize = 18
btnMin.TextColor3 = Color3.new(1,1,1)
btnMin.BackgroundColor3 = Color3.fromRGB(70,70,70)
btnMin.BorderSizePixel = 0
Instance.new("UICorner", btnMin)

-- BOTÓN CERRAR
local btnClose = Instance.new("TextButton", top)
btnClose.Size = UDim2.fromOffset(50,30)
btnClose.Position = UDim2.new(1,-55,0,6)
btnClose.Text = "X"
btnClose.Font = Enum.Font.GothamBold
btnClose.TextSize = 18
btnClose.TextColor3 = Color3.new(1,1,1)
btnClose.BackgroundColor3 = Color3.fromRGB(150,40,40)
btnClose.BorderSizePixel = 0
Instance.new("UICorner", btnClose)

-- SIDEBAR
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,160,1,-42)
side.Position = UDim2.new(0,0,0,42)
side.BackgroundColor3 = Color3.fromRGB(25,25,25)
side.BorderSizePixel = 0
Instance.new("UICorner", side).CornerRadius = UDim.new(0,12)

local sideLayout = Instance.new("UIListLayout", side)
sideLayout.Padding = UDim.new(0,6)

-- CONTENIDO
local content = Instance.new("ScrollingFrame", main)
content.Size = UDim2.new(1,-160,1,-42)
content.Position = UDim2.new(0,160,0,42)
content.CanvasSize = UDim2.new(0,0,0,0)
content.ScrollBarImageTransparency = 0.2
content.BackgroundTransparency = 1
content.BorderSizePixel = 0

local contentLayout = Instance.new("UIListLayout", content)
contentLayout.Padding = UDim.new(0,8)

-- DATOS DE LOS SCRIPTS
local SCRIPTS = {
    Todos = {
        {"Infinite Yield","https://rawscripts.net/raw/Universal-Script-Infinite-Yield-modded-80479"},
        {"JMods Universal","https://rawscripts.net/raw/Universal-Script-Jmods-Universal-38764"},
        {"GhostHub","https://rawscripts.net/raw/Universal-Script-Ghosthub-free-premium-features-62168"},
        {"CoolGui Clan","https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua"},
        {"Fling All","https://pastebin.com/raw/zqyDSUWX"},
        {"Auto Draw","https://pastebin.com/raw/mizeQM4i"},
    },
    Troll = {
        {"Infinite Yield","https://rawscripts.net/raw/Universal-Script-Infinite-Yield-modded-80479"},
        {"JMods Universal","https://rawscripts.net/raw/Universal-Script-Jmods-Universal-38764"},
        {"GhostHub","https://rawscripts.net/raw/Universal-Script-Ghosthub-free-premium-features-62168"},
        {"CoolGui Clan","https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua"},
        {"Fling All","https://pastebin.com/raw/zqyDSUWX"},
    },
    ["Speed Draw"] = {
        {"Auto Draw","https://pastebin.com/raw/mizeQM4i"},
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

-- FUNCIÓN PARA LIMPIAR EL CONTENIDO
local function clearContent()
    for _,v in ipairs(content:GetChildren()) do
        if v:IsA("TextButton") then v:Destroy() end
    end
end

-- FUNCIÓN PARA CARGAR UNA CATEGORÍA
local function loadCategory(cat)
    clearContent()
    for _,s in ipairs(SCRIPTS[cat]) do
        local b = Instance.new("TextButton", content)
        b.Size = UDim2.new(1,-12,0,42)
        b.Text = s[1]
        b.Font = Enum.Font.Gotham
        b.TextSize = 15
        b.TextColor3 = Color3.new(1,1,1)
        b.BackgroundColor3 = Color3.fromRGB(35,35,35)
        b.BorderSizePixel = 0
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
        b.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet(s[2]))()
        end)
    end
    task.wait()
    content.CanvasSize = UDim2.new(0,0,0, contentLayout.AbsoluteContentSize.Y + 10)
end

-- CREAR BOTONES DE CATEGORÍAS
for name,_ in pairs(SCRIPTS) do
    local b = Instance.new("TextButton", side)
    b.Size = UDim2.new(1,-12,0,36)
    b.Text = name
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
    b.MouseButton1Click:Connect(function()
        loadCategory(name)
    end)
end

-- EVENTOS DE LOS BOTONES
icon.MouseButton1Click:Connect(function()
    icon.Visible = false
    main.Visible = true
    loadCategory("Todos")
end)

btnMin.MouseButton1Click:Connect(function()
    main.Visible = false
    icon.Visible = true
end)

btnClose.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
