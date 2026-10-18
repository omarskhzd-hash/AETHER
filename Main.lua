-- ====================================================================
-- ⚡⚡⚡       AETHER — THE COMPLETE GODLY EDITION MASTERWORK     ⚡⚡⚡
-- ====================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- 1. OMNIPOTENT NOTIFICATION SYSTEM
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "👁️⚡ AETHER UNLEASHED ⚡👁️",
    Text = "GODLY EDITION ONLINE. WELCOME BACK, BOSS !!! 🌟🏰",
    Duration = 5
})

-- 2. MAIN USER INTERFACE FRAMEWORK (Deep Obsidian & Glow Accents)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AetherGodlyUI"
ScreenGui.ResetOnSpawn = false

pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 560, 0, 340)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 3.0 -- CHUNKY GODLY RIM BORDER
UIStroke.Color = Color3.fromRGB(212, 175, 55)
UIStroke.Parent = MainFrame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- THE ROYAL TITAN BANNER HEADER
local TitleBar = Instance.new("TextLabel")
TitleBar.Size = UDim2.new(1, -20, 0, 45)
TitleBar.Position = UDim2.new(0, 15, 0, 0)
TitleBar.BackgroundTransparency = 1
TitleBar.Text = "⚡ AETHER [GODLY EDITION]"
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextSize = 20
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
TitleBar.Parent = MainFrame

-- SCROLLING SIDEBAR FOR ALL 9 EXPANDED TABS
local SideBar = Instance.new("ScrollingFrame")
SideBar.Size = UDim2.new(0, 155, 1, -55)
SideBar.Position = UDim2.new(0, 10, 0, 45)
SideBar.BackgroundTransparency = 1
SideBar.CanvasSize = UDim2.new(0, 0, 0, 430)
SideBar.ScrollBarThickness = 2
SideBar.Parent = MainFrame

local SideListLayout = Instance.new("UIListLayout")
SideListLayout.Padding = UDim.new(0, 6)
SideListLayout.Parent = SideBar

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, -185, 1, -55)
TabContainer.Position = UDim2.new(0, 175, 0, 45)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = MainFrame

local fullTabSettings = {
    {Name = "Legit", Icon = "🎯", Sub = "Sensitivity presets and training controls"},
    {Name = "Ragebot", Icon = "🔥", Sub = "Target-selection layout cards"},
    {Name = "Player", Icon = "🐜", Sub = "Character scale modifications and visuals"},
    {Name = "Test", Icon = "⏱️", Sub = "Reaction timer and hit statistics"},
    {Name = "Practice", Icon = "🟢", Sub = "Training targets and highlighting"},
    {Name = "Misc", Icon = "🎛️", Sub = "Interface utilities and player values"},
    {Name = "Spoofer", Icon = "👤", Sub = "Cosmetic demo profile settings"},
    {Name = "Configs", Icon = "📂", Sub = "Load and reset menu presets"},
    {Name = "Weather", Icon = "☀️", Sub = "Local lighting and atmosphere preview"},
    {Name = "View Model", Icon = "🔍", Sub = "Camera FOV and view adjustments"}
}

local expandedTabs = {}

for _, config in ipairs(fullTabSettings) do
    local tabView = Instance.new("ScrollingFrame")
    tabView.Name = config.Name .. "View"
    tabView.Size = UDim2.new(1, 0, 1, 0)
    tabView.BackgroundTransparency = 1
    tabView.Visible = (config.Name == "Legit")
    tabView.CanvasSize = UDim2.new(0, 0, 2, 0)
    tabView.ScrollBarThickness = 2
    tabView.Parent = TabContainer
    expandedTabs[config.Name] = tabView

    local tabHeader = Instance.new("TextLabel")
    tabHeader.Size = UDim2.new(1, 0, 0, 25)
    tabHeader.BackgroundTransparency = 1
    tabHeader.Text = config.Icon .. "  " .. config.Name .. " Dashboard"
    tabHeader.TextColor3 = Color3.fromRGB(212, 175, 55)
    tabHeader.Font = Enum.Font.GothamBold
    tabHeader.TextSize = 14
    tabHeader.TextXAlignment = Enum.TextXAlignment.Left
    tabHeader.Parent = tabView

    local RowBtn = Instance.new("TextButton")
    RowBtn.Name = config.Name .. "Btn"
    RowBtn.Size = UDim2.new(1, -8, 0, 42)
    RowBtn.BackgroundColor3 = (config.Name == "Legit") and Color3.fromRGB(35, 45, 35) or Color3.fromRGB(30, 30, 30)
    RowBtn.AutoButtonColor = true
    RowBtn.Text = ""
    RowBtn.Parent = SideBar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 5)
    btnCorner.Parent = RowBtn

    local btnMainText = Instance.new("TextLabel")
    btnMainText.Size = UDim2.new(1, -10, 0, 20)
    btnMainText.Position = UDim2.new(0, 10, 0, 4)
    btnMainText.BackgroundTransparency = 1
    btnMainText.Text = config.Icon .. "  " .. config.Name
    btnMainText.TextColor3 = (config.Name == "Legit") and Color3.fromRGB(212, 175, 55) or Color3.fromRGB(235, 235, 235)
    btnMainText.Font = Enum.Font.GothamBold
    btnMainText.TextSize = 12
    btnMainText.TextXAlignment = Enum.TextXAlignment.Left
    btnMainText.Parent = RowBtn

    local btnSubText = Instance.new("TextLabel")
    btnSubText.Size = UDim2.new(1, -10, 0, 14)
    btnSubText.Position = UDim2.new(0, 10, 0, 22)
    btnSubText.BackgroundTransparency = 1
    btnSubText.Text = config.Sub
    btnSubText.TextColor3 = Color3.fromRGB(130, 130, 130)
    btnSubText.Font = Enum.Font.Gotham
    btnSubText.TextSize = 9
    btnSubText.TextTruncate = Enum.TextTruncate.AtEnd
    btnSubText.TextXAlignment = Enum.TextXAlignment.Left
    btnSubText.Parent = RowBtn

    RowBtn.MouseButton1Click:Connect(function()
        for _, obj in ipairs(SideBar:GetChildren()) do
            if obj:IsA("TextButton") then
                local mainTxt = obj:FindFirstChildOfClass("TextLabel")
                if mainTxt then mainTxt.TextColor3 = Color3.fromRGB(235, 235, 235) end
                obj.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            end
        end
        RowBtn.BackgroundColor3 = Color3.fromRGB(35, 45, 35)
        btnMainText.TextColor3 = Color3.fromRGB(212, 175, 55)
        for _, view in pairs(expandedTabs) do view.Visible = false end
        tabView.Visible = true
    end)
end

-- ====================================================================
--            🎰 INJECTED APOCALYPSE COMBAT OPERATIONS 🎰
-- ====================================================================
local SpinBotActive = true
local VisualCircleActive = true
local SpinSpeed = 95
local PingPredictionFactor = 0.16

-- 1. GLITCH BACKGROUND STICKER BOMBING ENGINE
local STICKERS = {
    {TEXT = "💥 SYSTEM CRITICAL 💥", POS = UDim2.new(0.2, 0, 0.4, 0), ROT = -12, COLOR = Color3.fromRGB(255, 0, 100)},
    {TEXT = "⚡ AETHER ENGINE ⚡", POS = UDim2.new(0.6, 0, 0.7, 0), ROT = 15, COLOR = Color3.fromRGB(0, 255, 255)},
    {TEXT = "💀 OWNS YOU 💀", POS = UDim2.new(0.4, 0, 0.2, 0), ROT = -5, COLOR = Color3.fromRGB(255, 255, 0)},
    {TEXT = "🦖 T-REX MODE 🦖", POS = UDim2.new(0.7, 0, 0.15, 0), ROT = 25, COLOR = Color3.fromRGB(57, 255, 20)},
    {TEXT = "🛑 HACKER BLASTER 🛑", POS = UDim2.new(0.1, 0, 0.8, 0), ROT = -20, COLOR = Color3.fromRGB(255, 127, 0)}
}

for _, data in ipairs(STICKERS) do
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 180, 0, 25)
    label.Position = data.POS
    label.Rotation = data.ROT
    label.BackgroundTransparency = 0.3
    label.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    label.Text = data.TEXT
    label.TextColor3 = data.COLOR
    label.Font = Enum.Font.GothamBold
    label.TextSize = 11
    label.ZIndex = 0
    label.Parent = MainFrame
    Instance.new("UICorner").CornerRadius = UDim.new(0, 4)
    label:FindFirstChildOfClass("UICorner").Parent = label
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Color = data.COLOR
    stroke.Parent = label
end

-- 2. AUTOMATIC TAUNT CHAT PHRASE ENGINE
local AutomaticChatSpam = true
local LastChatTime = 0
local ChatPhrases = {
    "AETHER OWNS THIS LOBBY!!! ⚡👑",
    "HEY HACKER KID, IS YOUR SCRIPT FROM 2012?! REMOVE IT!!! 💀🤣",
    "IMAGINE USE PAID CHEATS TO GET OBLITERATED BY AETHER!!! 😭📉",
    "ERROR 404: ENEMY BRAIN NOT FOUND!!! 🤖❌"
}

-- 3. THE RADAR TARGET DEADZONE RING
local DrawingGui = Instance.new("ScreenGui")
DrawingGui.Name = "AetherVisualCircle"
pcall(function() DrawingGui.Parent = CoreGui end)
if not DrawingGui.Parent then DrawingGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local FOVFrame = Instance.new("Frame")
FOVFrame.AnchorPoint = Vector2.new(0.5, 0.5)
FOVFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVFrame.Size = UDim2.new(0, 400, 0, 400)
FOVFrame.BackgroundTransparency = 1
FOVFrame.Visible = VisualCircleActive
FOVFrame.Parent = DrawingGui

local CornerRing = Instance.new("UICorner")
CornerRing.CornerRadius = UDim.new(1, 0)
CornerRing.Parent = FOVFrame

local RingStroke = Instance.new("UIStroke")
RingStroke.Thickness = 2.5
RingStroke.Color = Color3.fromRGB(212, 175, 55)
RingStroke.Transparency = 0.2
RingStroke.Parent = FOVFrame

-- CLOSEST ENEMIES DETECTOR CALCULATOR
local function FindNearestTarget()
    local targetHead = nil
    local shortestDist = math.huge
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if player.Team == LocalPlayer.Team then continue end
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
