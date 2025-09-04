local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.DisplayOrder = 10000
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BackgroundTransparency = 0.3
background.BorderSizePixel = 0
background.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 300, 0, 60)
titleLabel.Position = UDim2.new(0.5, -150, 0.5, -80)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Laplace's Scripts"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = background

local loadingBarBG = Instance.new("Frame")
loadingBarBG.Size = UDim2.new(0, 400, 0, 20)
loadingBarBG.Position = UDim2.new(0.5, -200, 0.5, -10)
loadingBarBG.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
loadingBarBG.BorderSizePixel = 0
loadingBarBG.Parent = background

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.Position = UDim2.new(0, 0, 0, 0)
loadingBar.BackgroundColor3 = Color3.new(0.3, 0.6, 1)
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingBarBG

local fillTween = TweenService:Create(
    loadingBar,
    TweenInfo.new(5, Enum.EasingStyle.Linear),
    {Size = UDim2.new(1, 0, 1, 0)}
)

fillTween:Play()

wait(5)

screenGui:Destroy()

local dialogueGui = Instance.new("ScreenGui")
dialogueGui.Name = "DialogueBox"
dialogueGui.DisplayOrder = 1000
dialogueGui.Parent = playerGui

local dialogueFrame = Instance.new("Frame")
dialogueFrame.Size = UDim2.new(0, 500, 0, 150)
dialogueFrame.Position = UDim2.new(0.5, -250, 0.8, -75)
dialogueFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
dialogueFrame.BackgroundTransparency = 0.2
dialogueFrame.BorderSizePixel = 2
dialogueFrame.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
dialogueFrame.Parent = dialogueGui

local dialogueText = Instance.new("TextLabel")
dialogueText.Size = UDim2.new(1, -20, 1, -20)
dialogueText.Position = UDim2.new(0, 10, 0, 10)
dialogueText.BackgroundTransparency = 1
dialogueText.Text = "Welcome! Scripts loaded successfully."
dialogueText.TextColor3 = Color3.new(1, 1, 1)
dialogueText.TextScaled = true
dialogueText.Font = Enum.Font.Gotham
dialogueText.TextWrapped = true
dialogueText.Parent = dialogueFrame
