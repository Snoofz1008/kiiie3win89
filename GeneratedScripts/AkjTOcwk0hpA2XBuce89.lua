-- Animated Popup: "SnoofHub is loading... This may take a minute..."
local loadingGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local titleBar = Instance.new("Frame")
local closeButton = Instance.new("TextButton")
local textLabel = Instance.new("TextLabel")
local uiCorner = Instance.new("UICorner")
local closeUiCorner = Instance.new("UICorner")

-- Setting up the GUI hierarchy
loadingGui.Name = "LoadingGui"
loadingGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
frame.Name = "LoadingFrame"
frame.Parent = loadingGui
frame.BackgroundColor3 = Color3.fromRGB(47, 49, 54) -- Discord-like background
frame.Size = UDim2.new(0, 500, 0, 180) -- Increased width and height
frame.Position = UDim2.new(0.5, -250, 0.5, -90)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true

-- Rounded corners for the frame
uiCorner.Parent = frame
uiCorner.CornerRadius = UDim.new(0, 10)

-- Title Bar
titleBar.Name = "TitleBar"
titleBar.Parent = frame
titleBar.BackgroundColor3 = Color3.fromRGB(32, 34, 37) -- Discord title bar color
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BorderSizePixel = 0

-- Close Button
closeButton.Name = "CloseButton"
closeButton.Parent = titleBar
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 0) -- Proper alignment
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(32, 34, 37)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(220, 221, 222)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.BorderSizePixel = 0
closeButton.AutoButtonColor = false

-- Rounded corners for the close button
closeUiCorner.Parent = closeButton
closeUiCorner.CornerRadius = UDim.new(0, 8)

-- Loading Text
textLabel.Name = "LoadingText"
textLabel.Parent = frame
textLabel.BackgroundTransparency = 1
textLabel.Size = UDim2.new(1, 0, 1, -30)
textLabel.Position = UDim2.new(0, 0, 0, 30)
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 18
textLabel.TextColor3 = Color3.fromRGB(220, 221, 222) -- Discord text color
textLabel.Text = "SnoofHub is loading..."
textLabel.TextYAlignment = Enum.TextYAlignment.Center
textLabel.TextWrapped = true -- Wrap text for better readability

-- Animation loop
local animationFrames = {"|", "/", "-", "\\"}
local animationIndex = 1
local stopAnimation = false

task.spawn(function()
    while not stopAnimation do
        textLabel.Text = "SnoofHub is loading... This may take a minute... " .. animationFrames[animationIndex]
        animationIndex = (animationIndex % #animationFrames) + 1
        task.wait(0.1) -- Speed of animation
    end
    textLabel.Text = "SnoofHub loaded successfully!" -- Final message
    task.wait(2)
    loadingGui:Destroy() -- Remove GUI after completion
end)

-- Close Button Functionality
closeButton.MouseButton1Click:Connect(function()
    stopAnimation = true
    loadingGui:Destroy()
end)

-- Draggable functionality
local dragging = false
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

titleBar.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Snoofz1008/kiiie3win89/refs/heads/main/GeneratedScripts/AYTPzfTkKRwIu4jwrwPU.lua"))()

stopAnimation = true
