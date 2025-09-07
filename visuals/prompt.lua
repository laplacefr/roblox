local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.DisplayOrder = 100000
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BackgroundTransparency = 1
background.BorderSizePixel = 0
background.Parent = screenGui

local container = Instance.new("Frame")
container.Size = UDim2.new(0, 400, 0, 120)
container.Position = UDim2.new(0.5, -200, 0.5, -60)
container.BackgroundTransparency = 1
container.Parent = background

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Laplace's Scripts: Grow a Garden"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextTransparency = 1
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = container

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 0, 6)
loadingFrame.Position = UDim2.new(0, 0, 0, 70)
loadingFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
loadingFrame.BackgroundTransparency = 1
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = container

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.Position = UDim2.new(0, 0, 0, 0)
loadingBar.BackgroundColor3 = Color3.new(0.3, 0.7, 1)
loadingBar.BackgroundTransparency = 1
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingFrame

local fadeInTween = TweenService:Create(
    background,
    TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0.85}
)

local titleFadeIn = TweenService:Create(
    title,
    TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    {TextTransparency = 0}
)

local frameFadeIn = TweenService:Create(
    loadingFrame,
    TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0}
)

local barFadeIn = TweenService:Create(
    loadingBar,
    TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0}
)

fadeInTween:Play()
titleFadeIn:Play()
frameFadeIn:Play()
barFadeIn:Play()

fadeInTween.Completed:Connect(function()

local loadingTween = TweenService:Create(
    loadingBar,
    TweenInfo.new(5, Enum.EasingStyle.Linear),
    {Size = UDim2.new(1, 0, 1, 0)}
)

loadingTween:Play()

loadingTween.Completed:Connect(function()
    local fadeOutTween = TweenService:Create(
        background,
        TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
        {BackgroundTransparency = 1}
    )
    
    local titleFadeOut = TweenService:Create(
        title,
        TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
        {TextTransparency = 1}
    )
    
    local frameFadeOut = TweenService:Create(
        loadingFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
        {BackgroundTransparency = 1}
    )
    
    local barFadeOut = TweenService:Create(
        loadingBar,
        TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
        {BackgroundTransparency = 1}
    )
    
    fadeOutTween:Play()
    titleFadeOut:Play()
    frameFadeOut:Play()
    barFadeOut:Play()
    
    fadeOutTween.Completed:Connect(function()
        screenGui:Destroy()
        
        local dialogueGui = Instance.new("ScreenGui")
        dialogueGui.Name = "DialogueScreen"
        dialogueGui.DisplayOrder = 100000
        dialogueGui.Parent = playerGui
        
        local dialogueBox = Instance.new("Frame")
        dialogueBox.Size = UDim2.new(0, 500, 0, 300)
        dialogueBox.Position = UDim2.new(0.5, -250, 0.5, -150)
        dialogueBox.BackgroundColor3 = Color3.new(0, 0, 0)
        dialogueBox.BackgroundTransparency = 1
        dialogueBox.BorderSizePixel = 2
        dialogueBox.BorderColor3 = Color3.new(1, 1, 1)
        dialogueBox.BorderMode = Enum.BorderMode.Inset
        dialogueBox.Parent = dialogueGui
        
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, -40, 0, 40)
        titleLabel.Position = UDim2.new(0, 20, 0, 20)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = "User Agreement"
        titleLabel.TextColor3 = Color3.new(1, 1, 1)
        titleLabel.TextTransparency = 1
        titleLabel.TextSize = 24
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Font = Enum.Font.RobotoMono
        titleLabel.Parent = dialogueBox
        
        local messageLabel = Instance.new("TextLabel")
        messageLabel.Size = UDim2.new(1, -40, 0, 180)
        messageLabel.Position = UDim2.new(0, 20, 0, 70)
        messageLabel.BackgroundTransparency = 1
        messageLabel.Text = "Hereby will need your agreement to properly use of my script and must not be used for bad intentions and any other ill motives. The script also need you to be in a good server where it will work at best, do not worry you will be automatically joined to a server with the best server version and that is already patched by me or other users that uses this script. If you agreed of the use and its concepts please proceed to click the button
