local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local loadingGui = Instance.new("ScreenGui")
loadingGui.DisplayOrder = 99999
loadingGui.Parent = playerGui

local backdrop = Instance.new("Frame")
backdrop.Size = UDim2.new(1, 0, 1, 0)
backdrop.BackgroundColor3 = Color3.new(0, 0, 0)
backdrop.BackgroundTransparency = 1
backdrop.BorderSizePixel = 0
backdrop.Parent = loadingGui

local loadContainer = Instance.new("Frame")
loadContainer.Size = UDim2.new(0, 400, 0, 120)
loadContainer.Position = UDim2.new(0.5, -200, 0.5, -60)
loadContainer.BackgroundTransparency = 1
loadContainer.Parent = backdrop

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1, 0, 0, 50)
loadTitle.Position = UDim2.new(0, 0, 0, 0)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "Laplace's Scripts: Grow a Garden"
loadTitle.TextColor3 = Color3.new(1, 1, 1)
loadTitle.TextTransparency = 1
loadTitle.TextScaled = true
loadTitle.Font = Enum.Font.GothamBold
loadTitle.Parent = loadContainer

local barBackground = Instance.new("Frame")
barBackground.Size = UDim2.new(1, 0, 0, 6)
barBackground.Position = UDim2.new(0, 0, 0, 70)
barBackground.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
barBackground.BackgroundTransparency = 1
barBackground.BorderSizePixel = 0
barBackground.Parent = loadContainer

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.new(0.3, 0.7, 1)
progressBar.BackgroundTransparency = 1
progressBar.BorderSizePixel = 0
progressBar.Parent = barBackground

local fadeIn1 = TweenService:Create(backdrop, TweenInfo.new(0.5), {BackgroundTransparency = 0.3})
local fadeIn2 = TweenService:Create(loadTitle, TweenInfo.new(0.5), {TextTransparency = 0})
local fadeIn3 = TweenService:Create(barBackground, TweenInfo.new(0.5), {BackgroundTransparency = 0})
local fadeIn4 = TweenService:Create(progressBar, TweenInfo.new(0.5), {BackgroundTransparency = 0})

fadeIn1:Play()
fadeIn2:Play()
fadeIn3:Play()
fadeIn4:Play()

fadeIn1.Completed:Connect(function()
    local loadProgress = TweenService:Create(progressBar, TweenInfo.new(5), {Size = UDim2.new(1, 0, 1, 0)})
    loadProgress:Play()
    
    loadProgress.Completed:Connect(function()
        local fadeOut1 = TweenService:Create(backdrop, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        local fadeOut2 = TweenService:Create(loadTitle, TweenInfo.new(0.5), {TextTransparency = 1})
        local fadeOut3 = TweenService:Create(barBackground, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        local fadeOut4 = TweenService:Create(progressBar, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        
        fadeOut1:Play()
        fadeOut2:Play()
        fadeOut3:Play()
        fadeOut4:Play()
        
        fadeOut1.Completed:Connect(function()
            loadingGui:Destroy()
            
            local gui = Instance.new("ScreenGui")
            gui.DisplayOrder = 99999
            gui.Parent = playerGui
            
            local box = Instance.new("Frame")
            box.Size = UDim2.new(0, 300, 0, 200)
            box.Position = UDim2.new(0.5, -150, 0.5, -100)
            box.BackgroundColor3 = Color3.new(0, 0, 0)
            box.BackgroundTransparency = 0.2
            box.BorderSizePixel = 2
            box.BorderColor3 = Color3.new(1, 1, 1)
            box.Parent = gui
            
            local title = Instance.new("TextLabel")
            title.Size = UDim2.new(1, -10, 0, 30)
            title.Position = UDim2.new(0, 5, 0, 5)
            title.BackgroundTransparency = 1
            title.Text = "User Agreement"
            title.TextColor3 = Color3.new(1, 1, 1)
            title.TextSize = 18
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Font = Enum.Font.RobotoMono
            title.Parent = box
            
            local message = Instance.new("TextLabel")
            message.Size = UDim2.new(1, -10, 0, 120)
            message.Position = UDim2.new(0, 5, 0, 40)
            message.BackgroundTransparency = 1
            message.Text = "Hereby will need your agreement to properly use of my script and must not be used for bad intentions and any other ill motives. The script also need you to be in a good server where it will work at best, do not worry you will be automatically joined to a server with the best server version and that is already patched by me or other users that uses this script. If you agreed of the use and its concepts please proceed to click the button below."
            message.TextColor3 = Color3.new(0.9, 0.9, 0.9)
            message.TextSize = 12
            message.TextWrapped = true
            message.Font = Enum.Font.RobotoMono
            message.Parent = box
            
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 200, 0, 30)
            button.Position = UDim2.new(0, 50, 0, 165)
            button.BackgroundColor3 = Color3.new(1, 1, 1)
            button.BackgroundTransparency = 0.8
            button.BorderSizePixel = 1
            button.BorderColor3 = Color3.new(1, 1, 1)
            button.Text = "Agree"
            button.TextColor3 = Color3.new(1, 1, 1)
            button.TextSize = 14
            button.Font = Enum.Font.RobotoMono
            button.Parent = box
            
            local clicked = false
            
            button.MouseEnter:Connect(function()
                if not clicked then
                    button.BackgroundTransparency = 0.5
                    button.TextColor3 = Color3.new(0, 0, 0)
                end
            end)
            
            button.MouseLeave:Connect(function()
                if not clicked then
                    button.BackgroundTransparency = 0.8
                    button.TextColor3 = Color3.new(1, 1, 1)
                end
            end)
            
            button.MouseButton1Click:Connect(function()
                if not clicked then
                    clicked = true
                    button.Text = "Agreed"
                    button.BackgroundTransparency = 0.3
                    button.TextColor3 = Color3.new(0, 0, 0)
                    wait(2)
                    gui:Destroy()
                end
            end)
        end)
    end)
end)
