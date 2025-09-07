local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.DisplayOrder = 100
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BackgroundTransparency = 0.3
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
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = container

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 0, 6)
loadingFrame.Position = UDim2.new(0, 0, 0, 70)
loadingFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = container

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.Position = UDim2.new(0, 0, 0, 0)
loadingBar.BackgroundColor3 = Color3.new(0.3, 0.7, 1)
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingFrame

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
        dialogueGui.DisplayOrder = 99
        dialogueGui.Parent = playerGui
        
        local dialogueBox = Instance.new("Frame")
        dialogueBox.Size = UDim2.new(0, 200, 0, 80)
        dialogueBox.Position = UDim2.new(0.5, -100, 0.7, -40)
        dialogueBox.BackgroundColor3 = Color3.new(0, 0, 0)
        dialogueBox.BackgroundTransparency = 1
        dialogueBox.BorderSizePixel = 1
        dialogueBox.BorderColor3 = Color3.new(1, 1, 1)
        dialogueBox.BorderMode = Enum.BorderMode.Inset
        dialogueBox.Parent = dialogueGui
        
        local dialogueText = Instance.new("TextLabel")
        dialogueText.Size = UDim2.new(1, -20, 1, -20)
        dialogueText.Position = UDim2.new(0, 10, 0, 10)
        dialogueText.BackgroundTransparency = 1
        dialogueText.Text = "Test 2"
        dialogueText.TextColor3 = Color3.new(1, 1, 1)
        dialogueText.TextTransparency = 1
        dialogueText.TextScaled = true
        dialogueText.Font = Enum.Font.Gotham
        dialogueText.Parent = dialogueBox
        
        local dialogueFadeIn = TweenService:Create(
            dialogueBox,
            TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0.2}
        )
        
        local textFadeIn = TweenService:Create(
            dialogueText,
            TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            {TextTransparency = 0}
        )
        
        dialogueFadeIn:Play()
        textFadeIn:Play()
    end)
end)
