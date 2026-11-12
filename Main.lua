local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local VirtualUser = game:GetService("VirtualUser")

-- ==========================================
-- SISTEMA ANTI-DUPLICIDADE BLINDADO
-- ==========================================
pcall(function()
    if gethui and gethui():FindFirstChild("BlackCatHub") then
        gethui().BlackCatHub:Destroy()
    end
    if CoreGui:FindFirstChild("BlackCatHub") then
        CoreGui.BlackCatHub:Destroy()
    end
    if LocalPlayer.PlayerGui:FindFirstChild("BlackCatHub") then
        LocalPlayer.PlayerGui.BlackCatHub:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BlackCatHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999

local success, err = pcall(function()
    if gethui then
        ScreenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = CoreGui
    else
        ScreenGui.Parent = CoreGui
    end
end)

if not success or not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- ==========================================
-- NOVO DESIGN (ESTILO DA REFERÊNCIA)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 330)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -165)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 5
MainFrame.Parent = ScreenGui

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 45, 45)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 38)
TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 30
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -100, 1, 0)
TitleLabel.Position = UDim2.new(0, 16, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.Code
TitleLabel.Text = "BlackCat Hub"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 35
TitleLabel.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -36, 0.5, -14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 12
CloseBtn.ZIndex = 35
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 28, 0, 28)
MinimizeBtn.Position = UDim2.new(1, -70, 0.5, -14)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
MinimizeBtn.Font = Enum.Font.Code
MinimizeBtn.TextSize = 11
MinimizeBtn.ZIndex = 35
MinimizeBtn.Parent = TopBar

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeBtn

local DialogOverlay = Instance.new("Frame")
DialogOverlay.Size = UDim2.new(1, 0, 1, 0)
DialogOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DialogOverlay.BackgroundTransparency = 0.5
DialogOverlay.Visible = false
DialogOverlay.ZIndex = 50
DialogOverlay.Parent = MainFrame

local DialogBox = Instance.new("Frame")
DialogBox.Size = UDim2.new(0, 280, 0, 130)
DialogBox.Position = UDim2.new(0.5, -140, 0.5, -65)
DialogBox.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
DialogBox.BorderSizePixel = 0
DialogBox.ZIndex = 51
DialogBox.Parent = DialogOverlay

local DialogBoxCorner = Instance.new("UICorner")
DialogBoxCorner.CornerRadius = UDim.new(0, 8)
DialogBoxCorner.Parent = DialogBox

local DialogBoxStroke = Instance.new("UIStroke")
DialogBoxStroke.Color = Color3.fromRGB(45, 45, 45)
DialogBoxStroke.Thickness = 1
DialogBoxStroke.Parent = DialogBox

local DialogText = Instance.new("TextLabel")
DialogText.Size = UDim2.new(1, -20, 0, 40)
DialogText.Position = UDim2.new(0, 10, 0, 20)
DialogText.BackgroundTransparency = 1
DialogText.Font = Enum.Font.Code
DialogText.Text = "Do you really want to close the Hub?"
DialogText.TextColor3 = Color3.fromRGB(240, 240, 240)
DialogText.TextSize = 12
DialogText.TextWrapped = true
DialogText.ZIndex = 52
DialogText.Parent = DialogBox

local YesBtn = Instance.new("TextButton")
YesBtn.Size = UDim2.new(0, 120, 0, 32)
YesBtn.Position = UDim2.new(0, 14, 1, -44)
YesBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
YesBtn.Text = "Yes"
YesBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
YesBtn.Font = Enum.Font.Code
YesBtn.TextSize = 12
YesBtn.ZIndex = 52
YesBtn.Parent = DialogBox

local YesCorner = Instance.new("UICorner")
YesCorner.CornerRadius = UDim.new(0, 6)
YesCorner.Parent = YesBtn

local NoBtn = Instance.new("TextButton")
NoBtn.Size = UDim2.new(0, 120, 0, 32)
NoBtn.Position = UDim2.new(1, -134, 1, -44)
NoBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
NoBtn.Text = "No"
NoBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
NoBtn.Font = Enum.Font.Code
NoBtn.TextSize = 12
NoBtn.ZIndex = 52
NoBtn.Parent = DialogBox

local NoCorner = Instance.new("UICorner")
NoCorner.CornerRadius = UDim.new(0, 6)
NoCorner.Parent = NoBtn

local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 145, 1, -48)
Sidebar.Position = UDim2.new(0, 8, 0, 42)
Sidebar.BackgroundTransparency = 1
Sidebar.BorderSizePixel = 0
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.ScrollBarThickness = 2
Sidebar.ZIndex = 6
Sidebar.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 4)
SidebarLayout.Parent = Sidebar

local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -162, 1, -48)
ContentContainer.Position = UDim2.new(0, 156, 0, 42)
ContentContainer.BackgroundTransparency = 1
ContentContainer.ZIndex = 6
ContentContainer.Parent = MainFrame

local Tabs = {}
local CurrentTab = nil

local function CreateTab(name, order)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, 0, 0, 34)
    TabBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    TabBtn.BorderSizePixel = 0
    TabBtn.Font = Enum.Font.Code
    TabBtn.Text = "  " .. name
    TabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    TabBtn.TextSize = 11
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.LayoutOrder = order
    TabBtn.ZIndex = 7
    TabBtn.Parent = Sidebar

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = TabBtn

    local TabPage = Instance.new("ScrollingFrame")
    TabPage.Size = UDim2.new(1, 0, 1, 0)
    TabPage.BackgroundTransparency = 1
    TabPage.BorderSizePixel = 0
    TabPage.Visible = false
    TabPage.ScrollBarThickness = 3
    TabPage.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabPage.ZIndex = 7
    TabPage.Parent = ContentContainer

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 6)
    PageLayout.Parent = TabPage

    TabBtn.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            t.Page.Visible = false
            t.Button.TextColor3 = Color3.fromRGB(150, 150, 150)
            t.Button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
        end
        TabPage.Visible = true
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    end)

    if not CurrentTab then
        CurrentTab = TabBtn
        TabPage.Visible = true
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    end

    Tabs[name] = {Button = TabBtn, Page = TabPage}
    return TabPage
end

local TabHome = CreateTab("Home", 1)
local TabMovement = CreateTab("Movement", 2)
local TabScripts = CreateTab("Scripts", 3)
local TabGameScripts = CreateTab("GameScripts", 4)
local TabCalculator = CreateTab("Calculator", 5)
local TabFling = CreateTab("Fling", 6)
local TabSettings = CreateTab("Settings", 7)
local TabCredits = CreateTab("Credits", 8)

local IntroLabel = Instance.new("TextLabel")
IntroLabel.Size = UDim2.new(1, -6, 0, 36)
IntroLabel.BackgroundTransparency = 1
IntroLabel.Font = Enum.Font.Code
IntroLabel.Text = "Welcome to BlackCat Hub! Your clean utility suite."
IntroLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
IntroLabel.TextSize = 11
IntroLabel.TextWrapped = true
IntroLabel.TextXAlignment = Enum.TextXAlignment.Left
IntroLabel.TextYAlignment = Enum.TextYAlignment.Top
IntroLabel.ZIndex = 8
IntroLabel.Parent = TabHome

local function CreateInfoCard(labelText, valueText, copyValue)
    local CardBtn = Instance.new("TextButton")
    CardBtn.Size = UDim2.new(1, -6, 0, 34)
    CardBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    CardBtn.BorderSizePixel = 0
    CardBtn.Font = Enum.Font.Code
    CardBtn.Text = "  " .. labelText .. ": " .. valueText
    CardBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    CardBtn.TextSize = 11
    CardBtn.TextXAlignment = Enum.TextXAlignment.Left
    CardBtn.ZIndex = 8
    CardBtn.Parent = TabHome

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 6)
    CardCorner.Parent = CardBtn

    CardBtn.MouseButton1Click:Connect(function()
        pcall(function()
            if setclipboard then
                setclipboard(tostring(copyValue))
            end
        end)
        CardBtn.Text = "  [Copied] " .. labelText .. ": " .. valueText
        task.delay(1.5, function()
            CardBtn.Text = "  " .. labelText .. ": " .. valueText
        end)
    end)
end

local successGame, gameName = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId).Name
end)
if not successGame then
    gameName = "Unknown Game"
end

CreateInfoCard("Display Name", LocalPlayer.DisplayName, LocalPlayer.DisplayName)
CreateInfoCard("Username", LocalPlayer.Name, LocalPlayer.Name)
CreateInfoCard("Account ID", tostring(LocalPlayer.UserId), LocalPlayer.UserId)
CreateInfoCard("Game Name", gameName, gameName)
CreateInfoCard("Game ID", tostring(game.PlaceId), game.PlaceId)
CreateInfoCard("Developer", "sonicrzezniki", "sonicrzezniki")

local CreditsHeader = Instance.new("Frame")
CreditsHeader.Size = UDim2.new(1, -6, 0, 72)
CreditsHeader.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
CreditsHeader.BorderSizePixel = 0
CreditsHeader.ZIndex = 8
CreditsHeader.Parent = TabCredits

local CreditsHeaderCorner = Instance.new("UICorner")
CreditsHeaderCorner.CornerRadius = UDim.new(0, 6)
CreditsHeaderCorner.Parent = CreditsHeader

local HubIcon = Instance.new("ImageLabel")
HubIcon.Size = UDim2.new(0, 48, 0, 48)
HubIcon.Position = UDim2.new(0, 12, 0.5, -24)
HubIcon.BackgroundTransparency = 1
HubIcon.Image = "rbxassetid://13646695255"
HubIcon.ZIndex = 9
HubIcon.Parent = CreditsHeader

local HubNameLabel = Instance.new("TextLabel")
HubNameLabel.Size = UDim2.new(1, -75, 0, 20)
HubNameLabel.Position = UDim2.new(0, 68, 0, 16)
HubNameLabel.BackgroundTransparency = 1
HubNameLabel.Font = Enum.Font.Code
HubNameLabel.Text = "BlackCat Hub"
HubNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HubNameLabel.TextSize = 12
HubNameLabel.TextXAlignment = Enum.TextXAlignment.Left
HubNameLabel.ZIndex = 9
HubNameLabel.Parent = CreditsHeader

local HubSubLabel = Instance.new("TextLabel")
HubSubLabel.Size = UDim2.new(1, -75, 0, 20)
HubSubLabel.Position = UDim2.new(0, 68, 0, 36)
HubSubLabel.BackgroundTransparency = 1
HubSubLabel.Font = Enum.Font.Code
HubSubLabel.Text = "Modular & Clean Utility Suite"
HubSubLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
HubSubLabel.TextSize = 11
HubSubLabel.TextXAlignment = Enum.TextXAlignment.Left
HubSubLabel.ZIndex = 9
HubSubLabel.Parent = CreditsHeader

local function CreateCreditCard(roleText, nameText, copyValue)
    local CardBtn = Instance.new("TextButton")
    CardBtn.Size = UDim2.new(1, -6, 0, 34)
    CardBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    CardBtn.BorderSizePixel = 0
    CardBtn.Font = Enum.Font.Code
    CardBtn.Text = "  " .. roleText .. ": " .. nameText
    CardBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    CardBtn.TextSize = 11
    CardBtn.TextXAlignment = Enum.TextXAlignment.Left
    CardBtn.ZIndex = 8
    CardBtn.Parent = TabCredits

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 6)
    CardCorner.Parent = CardBtn

    CardBtn.MouseButton1Click:Connect(function()
        pcall(function()
            if setclipboard then
                setclipboard(tostring(copyValue))
            end
        end)
        CardBtn.Text = "  [Copied] " .. roleText .. ": " .. nameText
        task.delay(1.5, function()
            CardBtn.Text = "  " .. roleText .. ": " .. nameText
        end)
    end)
end

CreateCreditCard("Main Developer", "sonicrzezniki", "sonicrzezniki")
CreateCreditCard("UI Designer", "sonicrzezniki", "sonicrzezniki")
CreateCreditCard("Framework", "BlackCat Hub (Luau)", "BlackCat Hub")

local AutoSaveEnabled = false
local AutoSaveBtn = Instance.new("TextButton")
AutoSaveBtn.Size = UDim2.new(1, -6, 0, 34)
AutoSaveBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
AutoSaveBtn.BorderSizePixel = 0
AutoSaveBtn.Font = Enum.Font.Code
AutoSaveBtn.Text = "  Auto Save: Off"
AutoSaveBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
AutoSaveBtn.TextSize = 11
AutoSaveBtn.TextXAlignment = Enum.TextXAlignment.Left
AutoSaveBtn.ZIndex = 8
AutoSaveBtn.Parent = TabSettings

local AutoSaveCorner = Instance.new("UICorner")
AutoSaveCorner.CornerRadius = UDim.new(0, 6)
AutoSaveCorner.Parent = AutoSaveBtn

AutoSaveBtn.MouseButton1Click:Connect(function()
    AutoSaveEnabled = not AutoSaveEnabled
    if AutoSaveEnabled then
        AutoSaveBtn.Text = "  Auto Save: On"
        AutoSaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        pcall(function()
            if writefile then
                writefile("BlackCatHub_Config.txt", "autosave=true")
            end
        end)
    else
        AutoSaveBtn.Text = "  Auto Save: Off"
        AutoSaveBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        pcall(function()
            if writefile then
                writefile("BlackCatHub_Config.txt", "autosave=false")
            end
        end)
    end
end)

pcall(function()
    if readfile and pcall(readfile, "BlackCatHub_Config.txt") then
        local content = readfile("BlackCatHub_Config.txt")
        if content:find("autosave=true") then
            AutoSaveEnabled = true
            AutoSaveBtn.Text = "  Auto Save: On"
            AutoSaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end
end)

local function getRoot(char)
    return char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso"))
end

local function randomString()
    local length = math.random(10, 20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

-- ==========================================
-- ABA CALCULATOR
-- ==========================================

local CalcScreen = Instance.new("TextBox")
CalcScreen.Size = UDim2.new(1, -6, 0, 42)
CalcScreen.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
CalcScreen.BorderSizePixel = 0
CalcScreen.Font = Enum.Font.Code
CalcScreen.Text = "0"
CalcScreen.TextColor3 = Color3.fromRGB(255, 255, 255)
CalcScreen.TextSize = 16
CalcScreen.TextXAlignment = Enum.TextXAlignment.Right
CalcScreen.ClearTextOnFocus = false
CalcScreen.ZIndex = 8
CalcScreen.Parent = TabCalculator

local CalcScreenCorner = Instance.new("UICorner")
CalcScreenCorner.CornerRadius = UDim.new(0, 6)
CalcScreenCorner.Parent = CalcScreen

local CalcGrid = Instance.new("Frame")
CalcGrid.Size = UDim2.new(1, -6, 0, 180)
CalcGrid.BackgroundTransparency = 1
CalcGrid.ZIndex = 8
CalcGrid.Parent = TabCalculator

local CalcLayout = Instance.new("UIGridLayout")
CalcLayout.CellSize = UDim2.new(0, 72, 0, 38)
CalcLayout.CellPadding = UDim2.new(0, 6, 0, 6)
CalcLayout.Parent = CalcGrid

local calcInput = "0"

local function updateCalc(val)
    if calcInput == "0" and val ~= "." and not string.match(val, "[%+%-%*/]") then
        calcInput = val
    else
        calcInput = calcInput .. val
    end
    CalcScreen.Text = calcInput
end

local buttons = {
    "C", "(", ")", "/",
    "7", "8", "9", "*",
    "4", "5", "6", "-",
    "1", "2", "3", "+",
    "0", ".", "⌫", "="
}

for _, text in ipairs(buttons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.Code
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.TextSize = 13
    btn.ZIndex = 9
    btn.Parent = CalcGrid

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        if text == "C" then
            calcInput = "0"
            CalcScreen.Text = calcInput
        elseif text == "⌫" then
            if #calcInput > 1 then
                calcInput = string.sub(calcInput, 1, #calcInput - 1)
            else
                calcInput = "0"
            end
            CalcScreen.Text = calcInput
        elseif text == "=" then
            local successRes, result = pcall(function()
                -- Substitui símbolos amigáveis e executa com segurança
                local fn = loadstring("return " .. calcInput)
                if fn then
                    return fn()
                end
                return "Error"
            end)
            if successRes and result ~= nil then
                calcInput = tostring(result)
                CalcScreen.Text = calcInput
            else
                CalcScreen.Text = "Error"
                task.delay(1, function()
                    calcInput = "0"
                    CalcScreen.Text = calcInput
                end)
            end
        else
            updateCalc(text)
        end
    end)
end

-- ==========================================
-- ABA GAMESCRIPTS (NATURAL DISASTER SURVIVAL)
-- ==========================================

local GameScriptsIntro = Instance.new("TextLabel")
GameScriptsIntro.Size = UDim2.new(1, -6, 0, 32)
GameScriptsIntro.BackgroundTransparency = 1
GameScriptsIntro.Font = Enum.Font.Code
GameScriptsIntro.Text = "Natural Disaster Survival - Utilities"
GameScriptsIntro.TextColor3 = Color3.fromRGB(200, 200, 200)
GameScriptsIntro.TextSize = 11
GameScriptsIntro.TextXAlignment = Enum.TextXAlignment.Left
GameScriptsIntro.ZIndex = 8
GameScriptsIntro.Parent = TabGameScripts

local ItemRingBtn = Instance.new("TextButton")
ItemRingBtn.Size = UDim2.new(1, -6, 0, 34)
ItemRingBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ItemRingBtn.BorderSizePixel = 0
ItemRingBtn.Font = Enum.Font.Code
ItemRingBtn.Text = "  Load Natural Disaster Super Ring"
ItemRingBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
ItemRingBtn.TextSize = 11
ItemRingBtn.TextXAlignment = Enum.TextXAlignment.Left
ItemRingBtn.ZIndex = 8
ItemRingBtn.Parent = TabGameScripts

local ItemRingCorner = Instance.new("UICorner")
ItemRingCorner.CornerRadius = UDim.new(0, 6)
ItemRingCorner.Parent = ItemRingBtn

ItemRingBtn.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/pietrorrzeznik-collab/Super-Ring-Natural-Disaster-Survivor-NDS/refs/heads/main/Main.Lua'))()
        ItemRingBtn.Text = "  [Loaded] Super Ring Executed!"
        ItemRingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.delay(2, function()
            ItemRingBtn.Text = "  Load Natural Disaster Super Ring"
            ItemRingBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end)
    end)
end)

-- ==========================================
-- ABA MOVEMENT
-- ==========================================

local FLYING = false
local flySpeedVal = 50
local velocityHandlerName = randomString()
local gyroHandlerName = randomString()
local flyLoop = nil
local charAddedConn = nil

local function unflyChar(speaker)
    pcall(function()
        FLYING = false
        local root = getRoot(speaker.Character)
        if root then
            if root:FindFirstChild(velocityHandlerName) then root:FindFirstChild(velocityHandlerName):Destroy() end
            if root:FindFirstChild(gyroHandlerName) then root:FindFirstChild(gyroHandlerName):Destroy() end
        end
        local hum = speaker.Character and speaker.Character:FindFirstChildWhichIsA("Humanoid")
        if hum then hum.PlatformStand = false end
        if flyLoop then flyLoop:Disconnect() flyLoop = nil end
        if charAddedConn then charAddedConn:Disconnect() charAddedConn = nil end
    end)
end

local function flyChar(speaker)
    unflyChar(speaker)
    FLYING = true

    local root = getRoot(speaker.Character)
    local v3zero = Vector3.new(0, 0, 0)
    local v3inf = Vector3.new(9e9, 9e9, 9e9)

    if not root then return end

    local controlModule
    pcall(function()
        controlModule = require(speaker.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
    end)

    local bv = Instance.new("BodyVelocity")
    bv.Name = velocityHandlerName
    bv.Parent = root
    bv.MaxForce = v3zero
    bv.Velocity = v3zero

    local bg = Instance.new("BodyGyro")
    bg.Name = gyroHandlerName
    bg.Parent = root
    bg.MaxTorque = v3inf
    bg.P = 1000
    bg.D = 50

    local keysDown = {W = false, S = false, A = false, D = false, Space = false, Shift = false}
    
    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Enum.KeyCode.W then keysDown.W = true end
        if input.KeyCode == Enum.KeyCode.S then keysDown.S = true end
        if input.KeyCode == Enum.KeyCode.A then keysDown.A = true end
        if input.KeyCode == Enum.KeyCode.D then keysDown.D = true end
        if input.KeyCode == Enum.KeyCode.Space then keysDown.Space = true end
        if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then keysDown.Shift = true end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W then keysDown.W = false end
        if input.KeyCode == Enum.KeyCode.S then keysDown.S = false end
        if input.KeyCode == Enum.KeyCode.A then keysDown.A = false end
        if input.KeyCode == Enum.KeyCode.D then keysDown.D = false end
        if input.KeyCode == Enum.KeyCode.Space then keysDown.Space = false end
        if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then keysDown.Shift = false end
    end)

    charAddedConn = speaker.CharacterAdded:Connect(function(newChar)
        task.wait(0.5)
        local nRoot = getRoot(newChar)
        if nRoot and FLYING then
            local nbv = Instance.new("BodyVelocity")
            nbv.Name = velocityHandlerName
            nbv.Parent = nRoot
            nbv.MaxForce = v3inf
            nbv.Velocity = v3zero

            local nbg = Instance.new("BodyGyro")
            nbg.Name = gyroHandlerName
            nbg.Parent = nRoot
            nbg.MaxTorque = v3inf
            nbg.P = 1000
            nbg.D = 50
        end
    end)

    flyLoop = RunService.RenderStepped:Connect(function()
        local currentRoot = getRoot(speaker.Character)
        local currentCam = workspace.CurrentCamera
        local humanoid = speaker.Character and speaker.Character:FindFirstChildWhichIsA("Humanoid")
        
        if humanoid and currentRoot and currentRoot:FindFirstChild(velocityHandlerName) and currentRoot:FindFirstChild(gyroHandlerName) then
            local VelocityHandler = currentRoot:FindFirstChild(velocityHandlerName)
            local GyroHandler = currentRoot:FindFirstChild(gyroHandlerName)

            VelocityHandler.MaxForce = v3inf
            GyroHandler.MaxTorque = v3inf
            humanoid.PlatformStand = true
            GyroHandler.CFrame = currentCam.CFrame
            VelocityHandler.Velocity = Vector3.new()

            local pcMove = Vector3.new()
            if keysDown.W then pcMove = pcMove + currentCam.CFrame.LookVector end
            if keysDown.S then pcMove = pcMove - currentCam.CFrame.LookVector end
            if keysDown.A then pcMove = pcMove - currentCam.CFrame.RightVector end
            if keysDown.D then pcMove = pcMove + currentCam.CFrame.RightVector end
            if keysDown.Space then pcMove = pcMove + Vector3.new(0, 1, 0) end
            if keysDown.Shift then pcMove = pcMove - Vector3.new(0, 1, 0) end

            if pcMove.Magnitude > 0 then
                VelocityHandler.Velocity = pcMove.Unit * flySpeedVal
            elseif controlModule then
                local direction = controlModule:GetMoveVector()
                local mobileVel = Vector3.new()
                if direction.X ~= 0 then
                    mobileVel = mobileVel + currentCam.CFrame.RightVector * (direction.X * flySpeedVal)
                end
                if direction.Z ~= 0 then
                    mobileVel = mobileVel - currentCam.CFrame.LookVector * (direction.Z * flySpeedVal)
                end
                VelocityHandler.Velocity = mobileVel
            end
        end
    end)
end

local FlyRow = Instance.new("Frame")
FlyRow.Size = UDim2.new(1, -6, 0, 34)
FlyRow.BackgroundTransparency = 1
FlyRow.ZIndex = 8
FlyRow.Parent = TabMovement

local FlyBox = Instance.new("TextBox")
FlyBox.Size = UDim2.new(1, -115, 1, 0)
FlyBox.Position = UDim2.new(0, 0, 0, 0)
FlyBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
FlyBox.BorderSizePixel = 0
FlyBox.Font = Enum.Font.Code
FlyBox.PlaceholderText = "Fly Speed (e.g. 50)"
FlyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
FlyBox.Text = "50"
FlyBox.TextColor3 = Color3.fromRGB(240, 240, 240)
FlyBox.TextSize = 11
FlyBox.ClearTextOnFocus = false
FlyBox.ZIndex = 8
FlyBox.Parent = FlyRow

local FlyBoxCorner = Instance.new("UICorner")
FlyBoxCorner.CornerRadius = UDim.new(0, 6)
FlyBoxCorner.Parent = FlyBox

local FlyBtn = Instance.new("TextButton")
FlyBtn.Size = UDim2.new(0, 105, 1, 0)
FlyBtn.Position = UDim2.new(1, -105, 0, 0)
FlyBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
FlyBtn.BorderSizePixel = 0
FlyBtn.Font = Enum.Font.Code
FlyBtn.Text = "Fly: Off"
FlyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
FlyBtn.TextSize = 11
FlyBtn.ZIndex = 8
FlyBtn.Parent = FlyRow

local FlyCorner = Instance.new("UICorner")
FlyCorner.CornerRadius = UDim.new(0, 6)
FlyCorner.Parent = FlyBtn

FlyBox:GetPropertyChangedSignal("Text"):Connect(function()
    local val = tonumber(FlyBox.Text)
    if val then flySpeedVal = val end
end)

FlyBtn.MouseButton1Click:Connect(function()
    if FLYING then
        unflyChar(LocalPlayer)
        FlyBtn.Text = "Fly: Off"
        FlyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    else
        local val = tonumber(FlyBox.Text)
        if val then flySpeedVal = val end
        flyChar(LocalPlayer)
        FlyBtn.Text = "Fly: On"
        FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

local NoclipActive = false
local NoclipConn = nil
local NoclipBtn = Instance.new("TextButton")
NoclipBtn.Size = UDim2.new(1, -6, 0, 34)
NoclipBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
NoclipBtn.BorderSizePixel = 0
NoclipBtn.Font = Enum.Font.Code
NoclipBtn.Text = "  Noclip: Off"
NoclipBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
NoclipBtn.TextSize = 11
NoclipBtn.TextXAlignment = Enum.TextXAlignment.Left
NoclipBtn.ZIndex = 8
NoclipBtn.Parent = TabMovement

local NoclipCorner = Instance.new("UICorner")
NoclipCorner.CornerRadius = UDim.new(0, 6)
NoclipCorner.Parent = NoclipBtn

NoclipBtn.MouseButton1Click:Connect(function()
    NoclipActive = not NoclipActive
    if NoclipActive then
        NoclipConn = RunService.Stepped:Connect(function()
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then v.CanCollide = false end
                    end
                end
            end)
        end)
        NoclipBtn.Text = "  Noclip: On"
        NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        if NoclipConn then NoclipConn:Disconnect(); NoclipConn = nil end
        NoclipBtn.Text = "  Noclip: Off"
        NoclipBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

local InfJumpActive = false
local InfJumpConn = nil
local InfJumpBtn = Instance.new("TextButton")
InfJumpBtn.Size = UDim2.new(1, -6, 0, 34)
InfJumpBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
InfJumpBtn.BorderSizePixel = 0
InfJumpBtn.Font = Enum.Font.Code
InfJumpBtn.Text = "  Infinite Jump: Off"
InfJumpBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
InfJumpBtn.TextSize = 11
InfJumpBtn.TextXAlignment = Enum.TextXAlignment.Left
InfJumpBtn.ZIndex = 8
InfJumpBtn.Parent = TabMovement

local InfJumpCorner = Instance.new("UICorner")
InfJumpCorner.CornerRadius = UDim.new(0, 6)
InfJumpCorner.Parent = InfJumpBtn

InfJumpBtn.MouseButton1Click:Connect(function()
    InfJumpActive = not InfJumpActive
    if InfJumpActive then
        InfJumpConn = UserInputService.JumpRequest:Connect(function()
            pcall(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChildOfClass("Humanoid") then
                    char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end)
        InfJumpBtn.Text = "  Infinite Jump: On"
        InfJumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        if InfJumpConn then InfJumpConn:Disconnect(); InfJumpConn = nil end
        InfJumpBtn.Text = "  Infinite Jump: Off"
        InfJumpBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

local SpeedActive = false
local SpeedConn = nil
local SpeedRow = Instance.new("Frame")
SpeedRow.Size = UDim2.new(1, -6, 0, 34)
SpeedRow.BackgroundTransparency = 1
SpeedRow.ZIndex = 8
SpeedRow.Parent = TabMovement

local SpeedBox = Instance.new("TextBox")
SpeedBox.Size = UDim2.new(1, -95, 1, 0)
SpeedBox.Position = UDim2.new(0, 0, 0, 0)
SpeedBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
SpeedBox.BorderSizePixel = 0
SpeedBox.Font = Enum.Font.Code
SpeedBox.PlaceholderText = "Speed (e.g. 16)"
SpeedBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
SpeedBox.Text = "16"
SpeedBox.TextColor3 = Color3.fromRGB(240, 240, 240)
SpeedBox.TextSize = 11
SpeedBox.ClearTextOnFocus = false
SpeedBox.ZIndex = 8
SpeedBox.Parent = SpeedRow

local SpeedBoxCorner = Instance.new("UICorner")
SpeedBoxCorner.CornerRadius = UDim.new(0, 6)
SpeedBoxCorner.Parent = SpeedBox

local SpeedToggleBtn = Instance.new("TextButton")
SpeedToggleBtn.Size = UDim2.new(0, 85, 1, 0)
SpeedToggleBtn.Position = UDim2.new(1, -85, 0, 0)
SpeedToggleBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
SpeedToggleBtn.BorderSizePixel = 0
SpeedToggleBtn.Font = Enum.Font.Code
SpeedToggleBtn.Text = "Speed: Off"
SpeedToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedToggleBtn.TextSize = 11
SpeedToggleBtn.ZIndex = 8
SpeedToggleBtn.Parent = SpeedRow

local SpeedToggleCorner = Instance.new("UICorner")
SpeedToggleCorner.CornerRadius = UDim.new(0, 6)
SpeedToggleCorner.Parent = SpeedToggleBtn

SpeedToggleBtn.MouseButton1Click:Connect(function()
    SpeedActive = not SpeedActive
    if SpeedActive then
        SpeedToggleBtn.Text = "Speed: On"
        SpeedToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        SpeedConn = RunService.RenderStepped:Connect(function(dt)
            pcall(function()
                local val = tonumber(SpeedBox.Text)
                local char = LocalPlayer.Character
                local root = getRoot(char)
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if val and root and hum and hum.MoveDirection.Magnitude > 0 then
                    root.CFrame = root.CFrame + (hum.MoveDirection * (val * dt * 0.75))
                end
            end)
        end)
    else
        if SpeedConn then SpeedConn:Disconnect(); SpeedConn = nil end
        SpeedToggleBtn.Text = "Speed: Off"
        SpeedToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

local JumpActive = false
local JumpConn = nil
local JumpRow = Instance.new("Frame")
JumpRow.Size = UDim2.new(1, -6, 0, 34)
JumpRow.BackgroundTransparency = 1
JumpRow.ZIndex = 8
JumpRow.Parent = TabMovement

local JumpBox = Instance.new("TextBox")
JumpBox.Size = UDim2.new(1, -95, 1, 0)
JumpBox.Position = UDim2.new(0, 0, 0, 0)
JumpBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
JumpBox.BorderSizePixel = 0
JumpBox.Font = Enum.Font.Code
JumpBox.PlaceholderText = "JumpPower (e.g. 50)"
JumpBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
JumpBox.Text = "50"
JumpBox.TextColor3 = Color3.fromRGB(240, 240, 240)
JumpBox.TextSize = 11
JumpBox.ClearTextOnFocus = false
JumpBox.ZIndex = 8
JumpBox.Parent = JumpRow

local JumpBoxCorner = Instance.new("UICorner")
JumpBoxCorner.CornerRadius = UDim.new(0, 6)
JumpBoxCorner.Parent = JumpBox

local JumpToggleBtn = Instance.new("TextButton")
JumpToggleBtn.Size = UDim2.new(0, 85, 1, 0)
JumpToggleBtn.Position = UDim2.new(1, -85, 0, 0)
JumpToggleBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
JumpToggleBtn.BorderSizePixel = 0
JumpToggleBtn.Font = Enum.Font.Code
JumpToggleBtn.Text = "Jump: Off"
JumpToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
JumpToggleBtn.TextSize = 11
JumpToggleBtn.ZIndex = 8
JumpToggleBtn.Parent = JumpRow

local JumpToggleCorner = Instance.new("UICorner")
JumpToggleCorner.CornerRadius = UDim.new(0, 6)
JumpToggleCorner.Parent = JumpToggleBtn

JumpToggleBtn.MouseButton1Click:Connect(function()
    JumpActive = not JumpActive
    if JumpActive then
        JumpToggleBtn.Text = "Jump: On"
        JumpToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        JumpConn = RunService.RenderStepped:Connect(function()
            pcall(function()
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                local root = getRoot(char)
                local val = tonumber(JumpBox.Text)
                if hum and root and val then
                    if hum:GetState() == Enum.HumanoidStateType.Jumping then
                        root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, val * 0.6, root.AssemblyLinearVelocity.Z)
                    end
                end
            end)
        end)
    else
        if JumpConn then JumpConn:Disconnect(); JumpConn = nil end
        JumpToggleBtn.Text = "Jump: Off"
        JumpToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

-- ==========================================
-- ABA SCRIPTS
-- ==========================================

local ScriptsIntro = Instance.new("TextLabel")
ScriptsIntro.Size = UDim2.new(1, -6, 0, 32)
ScriptsIntro.BackgroundTransparency = 1
ScriptsIntro.Font = Enum.Font.Code
ScriptsIntro.Text = "General Utility Scripts"
ScriptsIntro.TextColor3 = Color3.fromRGB(200, 200, 200)
ScriptsIntro.TextSize = 11
ScriptsIntro.TextXAlignment = Enum.TextXAlignment.Left
ScriptsIntro.ZIndex = 8
ScriptsIntro.Parent = TabScripts

local FullbrightActive = false
local FullbrightBtn = Instance.new("TextButton")
FullbrightBtn.Size = UDim2.new(1, -6, 0, 34)
FullbrightBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
FullbrightBtn.BorderSizePixel = 0
FullbrightBtn.Font = Enum.Font.Code
FullbrightBtn.Text = "  Fullbright: Off"
FullbrightBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
FullbrightBtn.TextSize = 11
FullbrightBtn.TextXAlignment = Enum.TextXAlignment.Left
FullbrightBtn.ZIndex = 8
FullbrightBtn.Parent = TabScripts

local FullbrightCorner = Instance.new("UICorner")
FullbrightCorner.CornerRadius = UDim.new(0, 6)
FullbrightCorner.Parent = FullbrightBtn

local Lighting = game:GetService("Lighting")
FullbrightBtn.MouseButton1Click:Connect(function()
    FullbrightActive = not FullbrightActive
    if FullbrightActive then
        FullbrightBtn.Text = "  Fullbright: On"
        FullbrightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else
        FullbrightBtn.Text = "  Fullbright: Off"
        FullbrightBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        Lighting.GlobalShadows = true
    end
end)

local InvisibleActive = false
local FakeCharacter = nil
local InvisibleConn = nil
local JumpRequestConn = nil
local LastRealCFrame = nil
local VoidPlatform = nil

local InvisibleBtn = Instance.new("TextButton")
InvisibleBtn.Size = UDim2.new(1, -6, 0, 34)
InvisibleBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
InvisibleBtn.BorderSizePixel = 0
InvisibleBtn.Font = Enum.Font.Code
InvisibleBtn.Text = "  Invisible: Off"
InvisibleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
InvisibleBtn.TextSize = 11
InvisibleBtn.TextXAlignment = Enum.TextXAlignment.Left
InvisibleBtn.ZIndex = 8
InvisibleBtn.Parent = TabScripts

local InvisibleCorner = Instance.new("UICorner")
InvisibleCorner.CornerRadius = UDim.new(0, 6)
InvisibleCorner.Parent = InvisibleBtn

InvisibleBtn.MouseButton1Click:Connect(function()
    InvisibleActive = not InvisibleActive
    local char = LocalPlayer.Character
    local root = getRoot(char)
    local hum = char and char:FindFirstChildOfClass("Humanoid")

    if InvisibleActive then
        if not char or not root or not hum then
            InvisibleActive = false
            return
        end

        InvisibleBtn.Text = "  Invisible: On"
        InvisibleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

        LastRealCFrame = root.CFrame

        local voidPos = root.CFrame + Vector3.new(5000, 2000, 5000)
        VoidPlatform = Instance.new("Part")
        VoidPlatform.Name = "BlackCatVoidPlatform"
        VoidPlatform.Size = Vector3.new(20, 1, 20)
        VoidPlatform.CFrame = voidPos - Vector3.new(0, 3, 0)
        VoidPlatform.Anchored = true
        VoidPlatform.CanCollide = true
        VoidPlatform.Transparency = 0.5
        VoidPlatform.BrickColor = BrickColor.new("Really black")
        VoidPlatform.Parent = workspace

        root.CFrame = voidPos
        root.Anchored = true

        local controlModule
        pcall(function()
            controlModule = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
        end)

        char.Archivable = true
        FakeCharacter = char:Clone()
        FakeCharacter.Name = "BlackCat_GhostClone"
        for _, v in ipairs(FakeCharacter:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 1
                v.CanCollide = true
                v.Massless = (v.Name ~= "HumanoidRootPart" and v.Name ~= "Torso" and v.Name ~= "UpperTorso")
                v.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.7, 0, 1, 1)
            elseif v:IsA("Script") or v:IsA("LocalScript") then
                v:Destroy()
            end
        end
        FakeCharacter.Parent = workspace
        
        local fakeRoot = getRoot(FakeCharacter)
        local fakeHum = FakeCharacter:FindFirstChildOfClass("Humanoid")
        if fakeRoot then
            fakeRoot.CFrame = LastRealCFrame
            fakeRoot.Anchored = false
        end

        JumpRequestConn = UserInputService.JumpRequest:Connect(function()
            pcall(function()
                if FakeCharacter and FakeCharacter:FindFirstChildOfClass("Humanoid") then
                    FakeCharacter.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end)

        InvisibleConn = RunService.RenderStepped:Connect(function(dt)
            pcall(function()
                if FakeCharacter and FakeCharacter:FindFirstChildOfClass("Humanoid") and char and char:FindFirstChildOfClass("Humanoid") then
                    local fRoot = getRoot(FakeCharacter)
                    local fHum = FakeCharacter:FindFirstChildOfClass("Humanoid")
                    
                    if fRoot and fHum then
                        fHum.WalkSpeed = hum.WalkSpeed
                        fHum.JumpPower = hum.JumpPower
                        
                        if Camera.CameraSubject ~= fHum then
                            Camera.CameraSubject = fHum
                        end

                        local moveVec = Vector3.new()
                        if controlModule then
                            moveVec = controlModule:GetMoveVector()
                        end

                        if moveVec.Magnitude > 0 then
                            fHum:Move(moveVec, true)
                        else
                            fHum:Move(Vector3.new(0, 0, 0), true)
                            fRoot.AssemblyLinearVelocity = Vector3.new(0, fRoot.AssemblyLinearVelocity.Y, 0)
                        end

                        if hum:GetState() == Enum.HumanoidStateType.Jumping then
                            fHum:ChangeState(Enum.HumanoidStateType.Jumping)
                        end

                        if root then
                            root.CFrame = voidPos
                            root.Velocity = Vector3.zero
                            root.AssemblyLinearVelocity = Vector3.zero
                        end
                    end
                end
            end)
        end)
    else
        if InvisibleConn then InvisibleConn:Disconnect(); InvisibleConn = nil end
        if JumpRequestConn then JumpRequestConn:Disconnect(); JumpRequestConn = nil end

        pcall(function()
            if char and getRoot(char) then
                getRoot(char).Anchored = false
            end
            if FakeCharacter then
                local fRoot = getRoot(FakeCharacter)
                if fRoot and char and getRoot(char) then
                    getRoot(char).CFrame = fRoot.CFrame
                end
                FakeCharacter:Destroy()
                FakeCharacter = nil
            end
            if VoidPlatform then
                VoidPlatform:Destroy()
                VoidPlatform = nil
            end
            if hum then
                Camera.CameraSubject = hum
            end
        end)

        InvisibleBtn.Text = "  Invisible: Off"
        InvisibleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

local function TriggerShoot(targetPart)
    pcall(function()
        if not targetPart then return end
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPart.Position)
        
        local char = LocalPlayer.Character
        if char then
            local tool = char:FindFirstChildOfClass("Tool")
            if tool then
                pcall(function() tool:Activate() end)
            else
                local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
                if backpack then
                    local bpTool = backpack:FindFirstChildOfClass("Tool")
                    if bpTool and char:FindFirstChildOfClass("Humanoid") then
                        char.Humanoid:EquipTool(bpTool)
                        task.wait(0.05)
                        bpTool:Activate()
                    end
                end
            end
        end
        
        local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
        if onScreen then
            VirtualUser:Button1Down(Vector2.new(screenPos.X, screenPos.Y), Camera.CFrame)
            task.wait(0.02)
            VirtualUser:Button1Up(Vector2.new(screenPos.X, screenPos.Y), Camera.CFrame)
        end
    end)
    pcall(function()
        mouse1click()
    end)
end

local function IsVisible(targetPart)
    local myChar = LocalPlayer.Character
    local myRoot = getRoot(myChar)
    if not myRoot or not targetPart then return false end
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {myChar, targetPart.Parent}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.IgnoreWater = true
    
    local origin = myRoot.Position
    local direction = (targetPart.Position - origin)
    local result = workspace:Raycast(origin, direction, raycastParams)
    
    return result == nil
end

local function CreateShootDraggableButton(buttonName)
    local btn = Instance.new("TextButton")
    btn.Name = buttonName
    btn.Size = UDim2.new(0, 110, 0, 42)
    btn.Position = UDim2.new(0.8, 0, 0.25, 0)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 0
    btn.Visible = false
    btn.Draggable = true
    btn.Text = "Shoot"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Code
    btn.TextSize = 14
    btn.ZIndex = 50
    btn.Parent = ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(50, 50, 50)
    stroke.Thickness = 1
    stroke.Parent = btn

    return btn
end

local ShootBtnObj = CreateShootDraggableButton("ShootButtonFloat")
local TeamShootBtnObj = CreateShootDraggableButton("TeamShootButtonFloat")
local MM2ShootBtnObj = CreateShootDraggableButton("MM2ShootButtonFloat")

local ShootActive = false
local TeamShootActive = false
local MM2ShootActive = false

local ShootLoopTask = nil
local TeamShootLoopTask = nil
local MM2ShootLoopTask = nil

local ShootMenuBtn, TeamShootMenuBtn, MM2ShootMenuBtn

local function StopAllShootSystems()
    ShootActive = false
    TeamShootActive = false
    MM2ShootActive = false

    ShootBtnObj.Visible = false
    TeamShootBtnObj.Visible = false
    MM2ShootBtnObj.Visible = false

    if ShootLoopTask then task.cancel(ShootLoopTask); ShootLoopTask = nil end
    if TeamShootLoopTask then task.cancel(TeamShootLoopTask); TeamShootLoopTask = nil end
    if MM2ShootLoopTask then task.cancel(MM2ShootLoopTask); MM2ShootLoopTask = nil end

    if ShootMenuBtn then ShootMenuBtn.Text = "  Shoot Button: Off"; ShootMenuBtn.TextColor3 = Color3.fromRGB(200, 200, 200) end
    if TeamShootMenuBtn then TeamShootMenuBtn.Text = "  Team Shoot Button: Off"; TeamShootMenuBtn.TextColor3 = Color3.fromRGB(200, 200, 200) end
    if MM2ShootMenuBtn then MM2ShootMenuBtn.Text = "  MM2/MMV Shoot Button: Off"; MM2ShootMenuBtn.TextColor3 = Color3.fromRGB(200, 200, 200) end
end

-- 1. Shoot Button Menu
ShootMenuBtn = Instance.new("TextButton")
ShootMenuBtn.Size = UDim2.new(1, -6, 0, 34)
ShootMenuBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ShootMenuBtn.BorderSizePixel = 0
ShootMenuBtn.Font = Enum.Font.Code
ShootMenuBtn.Text = "  Shoot Button: Off"
ShootMenuBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
ShootMenuBtn.TextSize = 11
ShootMenuBtn.TextXAlignment = Enum.TextXAlignment.Left
ShootMenuBtn.ZIndex = 8
ShootMenuBtn.Parent = TabScripts

local sCorner1 = Instance.new("UICorner")
sCorner1.CornerRadius = UDim.new(0, 6)
sCorner1.Parent = ShootMenuBtn

ShootMenuBtn.MouseButton1Click:Connect(function()
    if ShootActive then
        StopAllShootSystems()
    else
        StopAllShootSystems()
        ShootActive = true
        ShootBtnObj.Visible = true
        ShootMenuBtn.Text = "  Shoot Button: On"
        ShootMenuBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        ShootLoopTask = task.spawn(function()
            while ShootActive do
                pcall(function()
                    local myRoot = getRoot(LocalPlayer.Character)
                    if not myRoot then return end
                    
                    local closestPart = nil
                    local shortestDist = math.huge
                    
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local tRoot = getRoot(player.Character)
                            local tHum = player.Character:FindFirstChildOfClass("Humanoid")
                            if tRoot and tHum and tHum.Health > 0 then
                                if IsVisible(tRoot) then
                                    local dist = (tRoot.Position - myRoot.Position).Magnitude
                                    if dist < shortestDist then
                                        shortestDist = dist
                                        closestPart = tRoot
                                    end
                                end
                            end
                        end
                    end
                    
                    if closestPart then
                        TriggerShoot(closestPart)
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
end)

-- 2. Team Shoot Button Menu
TeamShootMenuBtn = Instance.new("TextButton")
TeamShootMenuBtn.Size = UDim2.new(1, -6, 0, 34)
TeamShootMenuBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
TeamShootMenuBtn.BorderSizePixel = 0
TeamShootMenuBtn.Font = Enum.Font.Code
TeamShootMenuBtn.Text = "  Team Shoot Button: Off"
TeamShootMenuBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
TeamShootMenuBtn.TextSize = 11
TeamShootMenuBtn.TextXAlignment = Enum.TextXAlignment.Left
TeamShootMenuBtn.ZIndex = 8
TeamShootMenuBtn.Parent = TabScripts

local sCorner2 = Instance.new("UICorner")
sCorner2.CornerRadius = UDim.new(0, 6)
sCorner2.Parent = TeamShootMenuBtn

TeamShootMenuBtn.MouseButton1Click:Connect(function()
    if TeamShootActive then
        StopAllShootSystems()
    else
        StopAllShootSystems()
        TeamShootActive = true
        TeamShootBtnObj.Visible = true
        TeamShootMenuBtn.Text = "  Team Shoot Button: On"
        TeamShootMenuBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        TeamShootLoopTask = task.spawn(function()
            while TeamShootActive do
                pcall(function()
                    local myRoot = getRoot(LocalPlayer.Character)
                    if not myRoot then return end
                    
                    local closestPart = nil
                    local shortestDist = math.huge
                    
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local isEnemy = true
                            pcall(function()
                                if LocalPlayer.Team and player.Team then
                                    isEnemy = (player.Team ~= LocalPlayer.Team)
                                end
                            end)
                            
                            if isEnemy then
                                local tRoot = getRoot(player.Character)
                                local tHum = player.Character:FindFirstChildOfClass("Humanoid")
                                if tRoot and tHum and tHum.Health > 0 then
                                    if IsVisible(tRoot) then
                                        local dist = (tRoot.Position - myRoot.Position).Magnitude
                                        if dist < shortestDist then
                                            shortestDist = dist
                                            closestPart = tRoot
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if closestPart then
                        TriggerShoot(closestPart)
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
end)

-- 3. MM2/MMV Shoot Button Menu
MM2ShootMenuBtn = Instance.new("TextButton")
MM2ShootMenuBtn.Size = UDim2.new(1, -6, 0, 34)
MM2ShootMenuBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
MM2ShootMenuBtn.BorderSizePixel = 0
MM2ShootMenuBtn.Font = Enum.Font.Code
MM2ShootMenuBtn.Text = "  MM2/MMV Shoot Button: Off"
MM2ShootMenuBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
MM2ShootMenuBtn.TextSize = 11
MM2ShootMenuBtn.TextXAlignment = Enum.TextXAlignment.Left
MM2ShootMenuBtn.ZIndex = 8
MM2ShootMenuBtn.Parent = TabScripts

local sCorner3 = Instance.new("UICorner")
sCorner3.CornerRadius = UDim.new(0, 6)
sCorner3.Parent = MM2ShootMenuBtn

local function HasKnife(player)
    pcall(function()
        local char = player.Character
        local bp = player:FindFirstChildOfClass("Backpack")
        
        local function checkContainer(container)
            if not container then return false end
            for _, item in ipairs(container:GetChildren()) do
                if item:IsA("Tool") then
                    local name = string.lower(item.Name)
                    if (string.find(name, "knife") or string.find(name, "faca")) and 
                       not (string.find(name, "revolver") or string.find(name, "gun") or string.find(name, "arma") or string.find(name, "pistol")) then
                        return true
                    end
                end
            end
            return false
        end
        
        if char and checkContainer(char) then return true end
        if bp and checkContainer(bp) then return true end
    end)
    return false
end

MM2ShootMenuBtn.MouseButton1Click:Connect(function()
    if MM2ShootActive then
        StopAllShootSystems()
    else
        StopAllShootSystems()
        MM2ShootActive = true
        MM2ShootBtnObj.Visible = true
        MM2ShootMenuBtn.Text = "  MM2/MMV Shoot Button: On"
        MM2ShootMenuBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        MM2ShootLoopTask = task.spawn(function()
            while MM2ShootActive do
                pcall(function()
                    local myRoot = getRoot(LocalPlayer.Character)
                    if not myRoot then return end
                    
                    local closestPart = nil
                    local shortestDist = math.huge
                    
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            if HasKnife(player) then
                                local tRoot = getRoot(player.Character)
                                local tHum = player.Character:FindFirstChildOfClass("Humanoid")
                                if tRoot and tHum and tHum.Health > 0 then
                                    if IsVisible(tRoot) then
                                        local dist = (tRoot.Position - myRoot.Position).Magnitude
                                        if dist < shortestDist then
                                            shortestDist = dist
                                            closestPart = tRoot
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if closestPart then
                        TriggerShoot(closestPart)
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
end)

-- ==========================================
-- CONFIGURAÇÕES DE SETTINGS & ANTI-FLING
-- ==========================================

local antifling = nil
local AntiFlingActive = false
local AntiFlingBtn = Instance.new("TextButton")
AntiFlingBtn.Size = UDim2.new(1, -6, 0, 34)
AntiFlingBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
AntiFlingBtn.BorderSizePixel = 0
AntiFlingBtn.Font = Enum.Font.Code
AntiFlingBtn.Text = "  Antifling: Off"
AntiFlingBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
AntiFlingBtn.TextSize = 11
AntiFlingBtn.TextXAlignment = Enum.TextXAlignment.Left
AntiFlingBtn.ZIndex = 8
AntiFlingBtn.Parent = TabSettings

local AntiFlingCorner = Instance.new("UICorner")
AntiFlingCorner.CornerRadius = UDim.new(0, 6)
AntiFlingCorner.Parent = AntiFlingBtn

AntiFlingBtn.MouseButton1Click:Connect(function()
    AntiFlingActive = not AntiFlingActive
    if AntiFlingActive then
        antifling = RunService.Stepped:Connect(function()
            pcall(function()
                local myChar = LocalPlayer.Character
                local myRoot = getRoot(myChar)
                if not myRoot then return end

                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local tRoot = getRoot(player.Character)
                        if tRoot and (tRoot.Position - myRoot.Position).Magnitude < 40 then
                            for _, v in pairs(player.Character:GetDescendants()) do
                                if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
                            end
                        end
                    end
                end
            end)
        end)
        AntiFlingBtn.Text = "  Antifling: On"
        AntiFlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        if antifling then antifling:Disconnect(); antifling = nil end
        AntiFlingBtn.Text = "  Antifling: Off"
        AntiFlingBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

local ShiftLockActive = false
local MobileShiftLockButton = nil
local ShiftLockConn = nil

local function RemoveCustomShiftLock()
    ShiftLockActive = false
    if ShiftLockConn then ShiftLockConn:Disconnect(); ShiftLockConn = nil end
    if MobileShiftLockButton then MobileShiftLockButton:Destroy(); MobileShiftLockButton = nil end
    pcall(function() LocalPlayer.DevEnableMouseLockOptions = true end)
end

local GetShiftLockBtn = Instance.new("TextButton")
GetShiftLockBtn.Size = UDim2.new(1, -6, 0, 34)
GetShiftLockBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
GetShiftLockBtn.BorderSizePixel = 0
GetShiftLockBtn.Font = Enum.Font.Code
GetShiftLockBtn.Text = "  Get ShiftLock"
GetShiftLockBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
GetShiftLockBtn.TextSize = 11
GetShiftLockBtn.TextXAlignment = Enum.TextXAlignment.Left
GetShiftLockBtn.ZIndex = 8
GetShiftLockBtn.Parent = TabSettings

local GetShiftLockCorner = Instance.new("UICorner")
GetShiftLockCorner.CornerRadius = UDim.new(0, 6)
GetShiftLockCorner.Parent = GetShiftLockBtn

GetShiftLockBtn.MouseButton1Click:Connect(function()
    RemoveCustomShiftLock()
    ShiftLockActive = true
    pcall(function() LocalPlayer.DevEnableMouseLockOptions = true end)

    if UserInputService.TouchEnabled then
        MobileShiftLockButton = Instance.new("ImageButton")
        MobileShiftLockButton.Name = "MobileShiftLock"
        MobileShiftLockButton.Size = UDim2.new(0, 42, 0, 42)
        MobileShiftLockButton.Position = UDim2.new(0.85, 0, 0.4, 0)
        MobileShiftLockButton.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
        MobileShiftLockButton.BackgroundTransparency = 0.3
        MobileShiftLockButton.Draggable = true
        MobileShiftLockButton.Image = "rbxassetid://13646695255"
        MobileShiftLockButton.ZIndex = 50
        MobileShiftLockButton.Parent = ScreenGui

        local mCorner = Instance.new("UICorner")
        mCorner.CornerRadius = UDim.new(1, 0)
        mCorner.Parent = MobileShiftLockButton

        local mStroke = Instance.new("UIStroke")
        mStroke.Color = Color3.fromRGB(45, 45, 45)
        mStroke.Thickness = 1
        mStroke.Parent = MobileShiftLockButton

        local isLocked = false
        MobileShiftLockButton.MouseButton1Click:Connect(function()
            isLocked = not isLocked
            local cam = workspace.CurrentCamera
            if isLocked and cam then
                ShiftLockConn = RunService.RenderStepped:Connect(function()
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
                        local root = char.HumanoidRootPart
                        local camCF = cam.CFrame
                        root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.atan2(-camCF.LookVector.X, -camCF.LookVector.Z), 0)
                        char.Humanoid.AutoRotate = false
                    end
                end)
            else
                if ShiftLockConn then ShiftLockConn:Disconnect(); ShiftLockConn = nil end
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then char.Humanoid.AutoRotate = true end
            end
        end)
    end

    GetShiftLockBtn.Text = "  [Enabled] ShiftLock Active"
    task.delay(1.5, function() GetShiftLockBtn.Text = "  Get ShiftLock" end)
end)

-- ==========================================
-- ABA FLING
-- ==========================================

local function isTooFarFromMap(tRoot)
    if not tRoot then return true end
    local pos = tRoot.Position
    local originDist = (pos - Vector3.new(0, pos.Y, 0)).Magnitude
    if originDist > 10000 then return true end
    return false
end

local SelectedTarget = "ALL"
local DropdownOpen = false

local DropdownBtn = Instance.new("TextButton")
DropdownBtn.Size = UDim2.new(1, -6, 0, 34)
DropdownBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
DropdownBtn.BorderSizePixel = 0
DropdownBtn.Font = Enum.Font.Code
DropdownBtn.Text = "  Select Target: ALL"
DropdownBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
DropdownBtn.TextSize = 11
DropdownBtn.TextXAlignment = Enum.TextXAlignment.Left
DropdownBtn.ZIndex = 8
DropdownBtn.Parent = TabFling

local DropdownCorner = Instance.new("UICorner")
DropdownCorner.CornerRadius = UDim.new(0, 6)
DropdownCorner.Parent = DropdownBtn

local DropdownListFrame = Instance.new("ScrollingFrame")
DropdownListFrame.Size = UDim2.new(1, -6, 0, 100)
DropdownListFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
DropdownListFrame.BorderSizePixel = 0
DropdownListFrame.Visible = false
DropdownListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
DropdownListFrame.ScrollBarThickness = 3
DropdownListFrame.ZIndex = 15
DropdownListFrame.Parent = TabFling

local DropdownListLayout = Instance.new("UIListLayout")
DropdownListLayout.SortOrder = Enum.SortOrder.LayoutOrder
DropdownListLayout.Padding = UDim.new(0, 2)
DropdownListLayout.Parent = DropdownListFrame

local DropdownListCorner = Instance.new("UICorner")
DropdownListCorner.CornerRadius = UDim.new(0, 6)
DropdownListCorner.Parent = DropdownListFrame

local function RefreshPlayerList()
    for _, child in ipairs(DropdownListFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    local count = 0
    local allBtn = Instance.new("TextButton")
    allBtn.Size = UDim2.new(1, 0, 0, 28)
    allBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    allBtn.BorderSizePixel = 0
    allBtn.Font = Enum.Font.Code
    allBtn.Text = "  ALL"
    allBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    allBtn.TextSize = 11
    allBtn.TextXAlignment = Enum.TextXAlignment.Left
    allBtn.ZIndex = 16
    allBtn.Parent = DropdownListFrame

    allBtn.MouseButton1Click:Connect(function()
        SelectedTarget = "ALL"
        DropdownBtn.Text = "  Target: ALL"
        DropdownListFrame.Visible = false
        DropdownOpen = false
    end)
    count = count + 1

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            count = count + 1
            local pBtn = Instance.new("TextButton")
            pBtn.Size = UDim2.new(1, 0, 0, 28)
            pBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            pBtn.BorderSizePixel = 0
            pBtn.Font = Enum.Font.Code
            pBtn.Text = "  " .. player.Name
            pBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
            pBtn.TextSize = 11
            pBtn.TextXAlignment = Enum.TextXAlignment.Left
            pBtn.ZIndex = 16
            pBtn.Parent = DropdownListFrame

            pBtn.MouseButton1Click:Connect(function()
                SelectedTarget = player
                DropdownBtn.Text = "  Target: " .. player.Name
                DropdownListFrame.Visible = false
                DropdownOpen = false
            end)
        end
    end
    DropdownListFrame.CanvasSize = UDim2.new(0, 0, 0, count * 30)
end

Players.PlayerAdded:Connect(RefreshPlayerList)
Players.PlayerRemoving:Connect(RefreshPlayerList)

DropdownBtn.MouseButton1Click:Connect(function()
    DropdownOpen = not DropdownOpen
    DropdownListFrame.Visible = DropdownOpen
    if DropdownOpen then RefreshPlayerList() end
end)

local FlingExecuting = false
local TargetFlingBtn = Instance.new("TextButton")
TargetFlingBtn.Size = UDim2.new(1, -6, 0, 34)
TargetFlingBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
TargetFlingBtn.BorderSizePixel = 0
TargetFlingBtn.Font = Enum.Font.Code
TargetFlingBtn.Text = "  Execute Fling"
TargetFlingBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
TargetFlingBtn.TextSize = 11
TargetFlingBtn.TextXAlignment = Enum.TextXAlignment.Left
TargetFlingBtn.ZIndex = 8
TargetFlingBtn.Parent = TabFling

local TargetFlingCorner = Instance.new("UICorner")
TargetFlingCorner.CornerRadius = UDim.new(0, 6)
TargetFlingCorner.Parent = TargetFlingBtn

local RunFlingLogic = nil

RunFlingLogic = function()
    if FlingExecuting then return end
    FlingExecuting = true
    TargetFlingBtn.Text = "  [Active] Flinging..."
    TargetFlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

    local originalPos = nil
    local char = LocalPlayer.Character
    local root = getRoot(char)
    if root then originalPos = root.CFrame end

    local flingNoclipConn = RunService.Stepped:Connect(function()
        pcall(function()
            local myChar = LocalPlayer.Character
            if myChar then
                for _, v in pairs(myChar:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end
            if typeof(SelectedTarget) == "Instance" and SelectedTarget.Character then
                for _, v in pairs(SelectedTarget.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end
        end)
    end)

    pcall(function()
        for _, child in ipairs(char:GetDescendants()) do
            if child:IsA("BasePart") then
                child.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
            end
        end
    end)

    local bambam = Instance.new("BodyAngularVelocity")
    bambam.Name = "BlackCatTargetFling"
    bambam.Parent = root
    bambam.AngularVelocity = Vector3.new(99999, 99999, 99999)
    bambam.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bambam.P = math.huge

    for _, v in ipairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            v.Massless = true
            v.Velocity = Vector3.zero
            v.AssemblyLinearVelocity = Vector3.zero
        end
    end

    local flingDiedConn = nil
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        flingDiedConn = humanoid.Died:Connect(function() FlingExecuting = false end)
    end

    task.spawn(function()
        if SelectedTarget == "ALL" then
            local validTargets = {}
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    local tChar = p.Character
                    local tRoot = getRoot(tChar)
                    if tChar and tRoot and tChar:FindFirstChildOfClass("Humanoid") and tChar:FindFirstChildOfClass("Humanoid").Health > 0 then
                        if tRoot.Position.Y > -50 and not isTooFarFromMap(tRoot) then
                            table.insert(validTargets, p)
                        end
                    end
                end
            end

            for _, tPlayer in ipairs(validTargets) do
                if not FlingExecuting then break end
                local targetStartTime = tick()
                local loopCount = 0
                while FlingExecuting and (tick() - targetStartTime < 1.8) do
                    local tChar = tPlayer.Character
                    local tRoot = getRoot(tChar)
                    local currentRoot = getRoot(LocalPlayer.Character)
                    if not tChar or not tRoot or not tChar:FindFirstChildOfClass("Humanoid") or tChar:FindFirstChildOfClass("Humanoid").Health <= 0 then break end
                    if tRoot.Position.Y < -50 or isTooFarFromMap(tRoot) then break end
                    if not currentRoot or not humanoid or humanoid.Health <= 0 then break end
                    
                    loopCount = loopCount + 1
                    local offsetFactor = (loopCount % 2 == 0) and 2 or -2
                    pcall(function()
                        local tVel = tRoot.Velocity
                        currentRoot.CFrame = tRoot.CFrame + (tRoot.CFrame.LookVector * offsetFactor) + Vector3.new(tVel.X * 0.1, 0.5, tVel.Z * 0.1)
                        bambam.AngularVelocity = Vector3.new(99999, 99999, 99999)
                        currentRoot.Velocity = Vector3.new(0, 50, 0)
                    end)
                    task.wait(0.05)
                end
            end
        else
            local targetPlayer = SelectedTarget
            if targetPlayer and targetPlayer.Parent then
                local tChar = targetPlayer.Character
                local tRoot = getRoot(tChar)
                if tRoot and tRoot.Position.Y > -50 and not isTooFarFromMap(tRoot) then
                    local startTime = tick()
                    local loopCount = 0
                    while FlingExecuting and (tick() - startTime < 2.2) do
                        tChar = targetPlayer.Character
                        tRoot = getRoot(tChar)
                        local currentRoot = getRoot(LocalPlayer.Character)
                        if not tChar or not tRoot or not tChar:FindFirstChildOfClass("Humanoid") or tChar:FindFirstChildOfClass("Humanoid").Health <= 0 then break end
                        if tRoot.Position.Y < -50 or isTooFarFromMap(tRoot) then break end
                        if not currentRoot or not humanoid or humanoid.Health <= 0 then break end
                        
                        loopCount = loopCount + 1
                        local offsetFactor = (loopCount % 2 == 0) and 2 or -2
                        pcall(function()
                            local tVel = tRoot.Velocity
                            currentRoot.CFrame = tRoot.CFrame + (tRoot.CFrame.LookVector * offsetFactor) + Vector3.new(tVel.X * 0.1, 0.5, tVel.Z * 0.1)
                            bambam.AngularVelocity = Vector3.new(99999, 99999, 99999)
                            currentRoot.Velocity = Vector3.new(0, 50, 0)
                        end)
                        task.wait(0.05)
                    end
                end
            end
        end

        FlingExecuting = false
        if flingDiedConn then flingDiedConn:Disconnect() end
        if flingNoclipConn then flingNoclipConn:Disconnect() end

        pcall(function()
            if bambam then bambam:Destroy() end
            local c = LocalPlayer.Character
            if c then
                local r = getRoot(c)
                if r then
                    r.Anchored = true
                    r.Velocity = Vector3.zero
                    r.RotVelocity = Vector3.zero
                    r.AssemblyLinearVelocity = Vector3.zero
                    r.AssemblyAngularVelocity = Vector3.zero
                end
                task.wait(0.15)
                for _, v in ipairs(c:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
                        v.Massless = false
                        v.Velocity = Vector3.zero
                        v.RotVelocity = Vector3.zero
                        v.AssemblyLinearVelocity = Vector3.zero
                        v.AssemblyAngularVelocity = Vector3.zero
                        v.CanCollide = true
                    end
                end
                if r then
                    if originalPos and originalPos.Position.Y > -30 and not isTooFarFromMap(r) then
                        r.CFrame = originalPos
                    else
                        r.CFrame = CFrame.new(0, 10, 0)
                    end
                    r.Velocity = Vector3.zero
                    r.RotVelocity = Vector3.zero
                    r.AssemblyLinearVelocity = Vector3.zero
                    r.AssemblyAngularVelocity = Vector3.zero
                end
                task.wait(0.1)
                if r then r.Anchored = false end
            end
        end)

        TargetFlingBtn.Text = "  Execute Fling"
        TargetFlingBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end)
end

TargetFlingBtn.MouseButton1Click:Connect(RunFlingLogic)

local LoopFlingActive = false
local LoopFlingTask = nil
local LoopFlingBtn = Instance.new("TextButton")
LoopFlingBtn.Size = UDim2.new(1, -6, 0, 34)
LoopFlingBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
LoopFlingBtn.BorderSizePixel = 0
LoopFlingBtn.Font = Enum.Font.Code
LoopFlingBtn.Text = "  Loop Fling: Off"
LoopFlingBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
LoopFlingBtn.TextSize = 11
LoopFlingBtn.TextXAlignment = Enum.TextXAlignment.Left
LoopFlingBtn.ZIndex = 8
LoopFlingBtn.Parent = TabFling

local LoopFlingCorner = Instance.new("UICorner")
LoopFlingCorner.CornerRadius = UDim.new(0, 6)
LoopFlingCorner.Parent = LoopFlingBtn

LoopFlingBtn.MouseButton1Click:Connect(function()
    LoopFlingActive = not LoopFlingActive
    if LoopFlingActive then
        LoopFlingBtn.Text = "  Loop Fling: On"
        LoopFlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        LoopFlingTask = task.spawn(function()
            while LoopFlingActive do
                pcall(function()
                    local myRoot = getRoot(LocalPlayer.Character)
                    if myRoot and (myRoot.Position.Y < -30 or isTooFarFromMap(myRoot)) then
                        FlingExecuting = false
                        myRoot.CFrame = CFrame.new(0, 10, 0)
                    end

                    if not FlingExecuting then
                        RunFlingLogic()
                    end
                end)
                task.wait(0.2)
            end
        end)
    else
        LoopFlingActive = false
        FlingExecuting = false
        if LoopFlingTask then
            task.cancel(LoopFlingTask)
            LoopFlingTask = nil
        end
        LoopFlingBtn.Text = "  Loop Fling: Off"
        LoopFlingBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

local ViewTargetBtn = Instance.new("TextButton")
ViewTargetBtn.Size = UDim2.new(1, -6, 0, 34)
ViewTargetBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ViewTargetBtn.BorderSizePixel = 0
ViewTargetBtn.Font = Enum.Font.Code
ViewTargetBtn.Text = "  View Target: Off"
ViewTargetBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
ViewTargetBtn.TextSize = 11
ViewTargetBtn.TextXAlignment = Enum.TextXAlignment.Left
ViewTargetBtn.ZIndex = 8
ViewTargetBtn.Parent = TabFling

local ViewTargetCorner = Instance.new("UICorner")
ViewTargetCorner.CornerRadius = UDim.new(0, 6)
ViewTargetCorner.Parent = ViewTargetBtn

local viewing = false
local viewConn = nil

ViewTargetBtn.MouseButton1Click:Connect(function()
    viewing = not viewing
    if viewing then
        ViewTargetBtn.Text = "  View Target: On"
        ViewTargetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        viewConn = RunService.RenderStepped:Connect(function()
            pcall(function()
                if SelectedTarget ~= "ALL" and SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("Humanoid") then
                    Camera.CameraSubject = SelectedTarget.Character.Humanoid
                end
            end)
        end)
    else
        if viewConn then viewConn:Disconnect(); viewConn = nil end
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
            end
        end)
        ViewTargetBtn.Text = "  View Target: Off"
        ViewTargetBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end)

local GetFlingToolBtn = Instance.new("TextButton")
GetFlingToolBtn.Size = UDim2.new(1, -6, 0, 34)
GetFlingToolBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
GetFlingToolBtn.BorderSizePixel = 0
GetFlingToolBtn.Font = Enum.Font.Code
GetFlingToolBtn.Text = "  Get Fling Tool"
GetFlingToolBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
GetFlingToolBtn.TextSize = 11
GetFlingToolBtn.TextXAlignment = Enum.TextXAlignment.Left
GetFlingToolBtn.ZIndex = 8
GetFlingToolBtn.Parent = TabFling

local GetFlingToolCorner = Instance.new("UICorner")
GetFlingToolCorner.CornerRadius = UDim.new(0, 6)
GetFlingToolCorner.Parent = GetFlingToolBtn

GetFlingToolBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        local char = LocalPlayer.Character
        if not backpack or not char then return end

        local tool = Instance.new("Tool")
        tool.Name = "BlackCat Fling Tool"
        tool.RequiresHandle = false

        tool.Activated:Connect(function()
            local myRoot = getRoot(LocalPlayer.Character)
            if not myRoot then return end

            local closestPlayer = nil
            local shortestDist = math.huge

            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local tRoot = getRoot(player.Character)
                    local tHum = player.Character:FindFirstChildOfClass("Humanoid")
                    if tRoot and tHum and tHum.Health > 0 then
                        local dist = (tRoot.Position - myRoot.Position).Magnitude
                        if dist < shortestDist then
                            shortestDist = dist
                            closestPlayer = player
                        end
                    end
                end
            end

            if closestPlayer then
                SelectedTarget = closestPlayer
                DropdownBtn.Text = "  Target: " .. closestPlayer.Name
                RunFlingLogic()
            end
        end)

        tool.Parent = backpack
        GetFlingToolBtn.Text = "  [Given] Tool Added!"
        task.delay(1.5, function()
            GetFlingToolBtn.Text = "  Get Fling Tool"
        end)
    end)
end)

-- ==========================================
-- CONTROLE DE JANELA
-- ==========================================
local OpenButton = Instance.new("ImageButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 45, 0, 45)
OpenButton.Position = UDim2.new(0, 20, 0.2, 0)
OpenButton.BackgroundTransparency = 1
OpenButton.Visible = false
OpenButton.Draggable = true
OpenButton.ZIndex = 50
OpenButton.Image = "rbxassetid://13646695255"
OpenButton.Parent = ScreenGui

MinimizeBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    DialogOverlay.Visible = true
end)

NoBtn.MouseButton1Click:Connect(function()
    DialogOverlay.Visible = false
end)

YesBtn.MouseButton1Click:Connect(function()
    pcall(function()
        unflyChar(LocalPlayer)
        LoopFlingActive = false
        if LoopFlingTask then task.cancel(LoopFlingTask) end
        if antifling then antifling:Disconnect() end
        if NoclipConn then NoclipConn:Disconnect() end
        if InfJumpConn then InfJumpConn:Disconnect() end
        if SpeedConn then SpeedConn:Disconnect() end
        if JumpConn then JumpConn:Disconnect() end
        StopAllShootSystems()
        RemoveCustomShiftLock()
        if InvisibleActive then
            if VoidPlatform then VoidPlatform:Destroy() end
            if FakeCharacter then FakeCharacter:Destroy() end
            local char = LocalPlayer.Character
            if char and getRoot(char) then
                getRoot(char).Anchored = false
            end
        end
    end)
    ScreenGui:Destroy()
end)
