--// TSU Avatar Loader V23 Ultra Deluxe 🔥
--// Made by Tsubasa ♥️

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players:WaitForChild("babaprmv") -- Player kesin var

-- Temizle eski GUI varsa
if player.PlayerGui:FindFirstChild("TSU_Loader_V23") then
	player.PlayerGui.TSU_Loader_V23:Destroy()
end

-- GUI oluştur
local gui = Instance.new("ScreenGui")
gui.Name = "TSU_Loader_V23"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")
gui.Enabled = true

-- Ana frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,600,0,400)
main.Position = UDim2.new(0.5,-300,0.5,-200)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.Visible = true
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)
Instance.new("UIStroke", main).Color = Color3.fromRGB(0,200,255)

-- HEADER
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,40)
header.BackgroundColor3 = Color3.fromRGB(35,35,35)
Instance.new("UICorner", header).CornerRadius = UDim.new(0,10)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,-100,1,0)
title.Position = UDim2.new(0,10,0,0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(0,200,255)
title.Text = "TSU"

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0,40,0,40)
closeBtn.Position = UDim2.new(1,-40,0,0)
closeBtn.Text = "❌"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
closeBtn.TextColor3 = Color3.fromRGB(255,80,80)
closeBtn.BackgroundTransparency = 1
closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

local minimizeBtn = Instance.new("TextButton", header)
minimizeBtn.Size = UDim2.new(0,40,0,40)
minimizeBtn.Position = UDim2.new(1,-80,0,0)
minimizeBtn.Text = "➖"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextScaled = true
minimizeBtn.TextColor3 = Color3.fromRGB(255,255,100)
minimizeBtn.BackgroundTransparency = 1
minimizeBtn.MouseButton1Click:Connect(function()
	main.Visible=false
	tsuIcon.Visible=true
end)

-- TSU ikon
local tsuIcon = Instance.new("TextButton", gui)
tsuIcon.Size = UDim2.new(0,70,0,40)
tsuIcon.Position = UDim2.new(0.5,-35,0,10)
tsuIcon.Text = "TSU"
tsuIcon.Font = Enum.Font.GothamBlack
tsuIcon.TextScaled = true
tsuIcon.TextColor3 = Color3.fromRGB(0,200,255)
tsuIcon.BackgroundTransparency = 0.2
tsuIcon.Visible = false
Instance.new("UICorner", tsuIcon).CornerRadius = UDim.new(0,10)
tsuIcon.MouseButton1Click:Connect(function()
	tsuIcon.Visible=false
	main.Visible=true
end)

-- LEFT PANEL: Character List
local charListFrame = Instance.new("Frame", main)
charListFrame.Size = UDim2.new(0,180,1,0)
charListFrame.Position = UDim2.new(0,0,0,0)
charListFrame.BackgroundColor3 = Color3.fromRGB(30,30,40)
Instance.new("UICorner", charListFrame).CornerRadius = UDim.new(0,10)

local charListTitle = Instance.new("TextLabel", charListFrame)
charListTitle.Size = UDim2.new(1,0,0,30)
charListTitle.Position = UDim2.new(0,0,0,0)
charListTitle.BackgroundTransparency = 1
charListTitle.Font = Enum.Font.GothamBold
charListTitle.TextScaled = true
charListTitle.Text = "Character List"
charListTitle.TextColor3 = Color3.fromRGB(0,200,255)

local charList = Instance.new("ScrollingFrame", charListFrame)
charList.Size = UDim2.new(1,0,1,-30)
charList.Position = UDim2.new(0,0,0,30)
charList.BackgroundTransparency = 1
charList.CanvasSize = UDim2.new(0,0,0,0)
local layout = Instance.new("UIListLayout", charList)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0,5)

-- RIGHT PANEL: Search ve Rig Buttons
local rightPanel = Instance.new("Frame", main)
rightPanel.Size = UDim2.new(1,-180,1,0)
rightPanel.Position = UDim2.new(0,180,0,0)
rightPanel.BackgroundTransparency = 1

local input = Instance.new("TextBox", rightPanel)
input.Size = UDim2.new(0.6,0,0,35)
input.Position = UDim2.new(0.25,0,0.3,0)
input.PlaceholderText = "Enter Character Name..."
input.TextColor3 = Color3.fromRGB(255,255,255)
input.BackgroundColor3 = Color3.fromRGB(40,40,40)
input.Font = Enum.Font.Gotham
input.TextScaled = true
Instance.new("UICorner", input).CornerRadius = UDim.new(0,10)

local search = Instance.new("TextButton", rightPanel)
search.Size = UDim2.new(0.3,0,0,30)
search.Position = UDim2.new(0.35,0,0.45,0)
search.Text = "Search 🔍"
search.Font = Enum.Font.GothamBold
search.TextScaled = true
search.TextColor3 = Color3.fromRGB(255,255,255)
search.BackgroundColor3 = Color3.fromRGB(0,140,255)
Instance.new("UICorner", search).CornerRadius = UDim.new(0,10)

local loading = Instance.new("TextLabel", rightPanel)
loading.Size = UDim2.new(1,0,0,30)
loading.Position = UDim2.new(0,0,0.55,0)
loading.BackgroundTransparency = 1
loading.Font = Enum.Font.GothamBold
loading.TextScaled = true
loading.TextColor3 = Color3.fromRGB(255,255,100)
loading.Text = ""
loading.Visible = false

-- Rig Buttons ve Actions
local r6 = Instance.new("TextButton", rightPanel)
local r15 = Instance.new("TextButton", rightPanel)
local deluxe = Instance.new("TextButton", rightPanel)
local teleportBtn = Instance.new("TextButton", rightPanel)
local deleteBtn = Instance.new("TextButton", rightPanel)
local duplicateBtn = Instance.new("TextButton", rightPanel)

local buttons = {r6,r15,deluxe}
local texts = {"R6","R15","R15 Deluxe"}
local colors = {Color3.fromRGB(50,200,50),Color3.fromRGB(200,100,255),Color3.fromRGB(255,215,0)}

for i=1,3 do
	buttons[i].Size = UDim2.new(0.22,0,0,28)
	buttons[i].Position = UDim2.new(0.05+(i-1)*0.32,0,0.65,0)
	buttons[i].Text = texts[i]
	buttons[i].Font = Enum.Font.GothamBold
	buttons[i].TextScaled = true
	buttons[i].TextColor3 = Color3.fromRGB(255,255,255)
	buttons[i].BackgroundColor3 = colors[i]
	Instance.new("UICorner", buttons[i]).CornerRadius = UDim.new(0,10)
	buttons[i].Visible = false
end

local extraButtons = {teleportBtn, deleteBtn, duplicateBtn}
local extraTexts = {"Teleport","Delete","Duplicate"}
local extraColors = {Color3.fromRGB(100,100,255),Color3.fromRGB(255,80,80),Color3.fromRGB(255,200,0)}
for i=1,3 do
	extraButtons[i].Size = UDim2.new(0.28,0,0,28)
	extraButtons[i].Position = UDim2.new(0.05+(i-1)*0.32,0,0.78,0)
	extraButtons[i].Text = extraTexts[i]
	extraButtons[i].Font = Enum.Font.GothamBold
	extraButtons[i].TextScaled = true
	extraButtons[i].TextColor3 = Color3.fromRGB(255,255,255)
	extraButtons[i].BackgroundColor3 = extraColors[i]
	Instance.new("UICorner", extraButtons[i]).CornerRadius = UDim.new(0,10)
	extraButtons[i].Visible = false
end

local credit = Instance.new("TextLabel", rightPanel)
credit.Size = UDim2.new(1,0,0,20)
credit.Position = UDim2.new(0,0,1,-22)
credit.BackgroundTransparency = 1
credit.Font = Enum.Font.Gotham
credit.TextScaled = true
credit.Text = "Made by Tsubasa ♥️"
credit.TextColor3 = Color3.fromRGB(255,100,150)

-- Rig yönetimi
local currentRig = nil
local rigNames = {}

local function addAnimateScript(rig)
	local animator = Instance.new("Animator")
	animator.Parent = rig:WaitForChild("Humanoid")
end

local function createRig(userId, rigType, btn)
	if rigNames[input.Text] then
		loading.Text="⚠️ Rig with this name exists!"
		loading.Visible=true
		task.delay(2,function() loading.Visible=false end)
		return
	end
	for _,b in pairs(buttons) do b.Text="Creating..." b.Active=false end
	local humanoidModel = Players:CreateHumanoidModelFromUserId(userId)
	if not humanoidModel then btn.Text="Error" for _,b in pairs(buttons) do b.Active=true end return end

	humanoidModel.Name = input.Text
	rigNames[input.Text]=true
	currentRig = humanoidModel
	humanoidModel.Parent = workspace
	humanoidModel:MoveTo(player.Character and player.Character:GetPivot().Position + Vector3.new(3,0,0) or Vector3.new(0,3,0))

	if rigType=="R6" then
		humanoidModel.Humanoid.RigType = Enum.HumanoidRigType.R6
	else
		humanoidModel.Humanoid.RigType = Enum.HumanoidRigType.R15
		if rigType=="Deluxe" then
			local glow = Instance.new("SelectionBox", humanoidModel)
			glow.Adornee = humanoidModel:FindFirstChild("HumanoidRootPart")
			glow.LineThickness = 0.05
			glow.SurfaceColor3 = Color3.fromRGB(255,215,0)
			glow.SurfaceTransparency = 0.5
		end
	end

	addAnimateScript(humanoidModel)
	for _,b in pairs(buttons) do b.Text="Created" b.Active=true end

	-- Add to Character List
	local listBtn = Instance.new("TextButton", charList)
	listBtn.Size = UDim2.new(1,-10,0,30)
	listBtn.Text = humanoidModel.Name
	listBtn.Font = Enum.Font.GothamBold
	listBtn.TextScaled = true
	listBtn.TextColor3 = Color3.fromRGB(255,255,255)
	listBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	Instance.new("UICorner", listBtn).CornerRadius = UDim.new(0,8)

	listBtn.MouseButton1Click:Connect(function()
		currentRig = workspace:FindFirstChild(listBtn.Text)
	end)

	charList.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y)

	teleportBtn.Visible=true
	deleteBtn.Visible=true
	duplicateBtn.Visible=true

	-- Delete button
	deleteBtn.MouseButton1Click:Connect(function()
		if currentRig then
			rigNames[currentRig.Name]=nil
			currentRig:Destroy()
			for _,btn in pairs(charList:GetChildren()) do
				if btn:IsA("TextButton") and btn.Text == currentRig.Name then
					btn:Destroy()
				end
			end
			currentRig=nil
		end
	end)

	-- Duplicate button
	duplicateBtn.MouseButton1Click:Connect(function()
		if currentRig then
			local clone = currentRig:Clone()
			local cloneName = currentRig.Name.."_Copy"
			local count=1
			while rigNames[cloneName] do
				count+=1
				cloneName=currentRig.Name.."_Copy"..count
			end
			clone.Name=cloneName
			rigNames[cloneName]=true
			clone.Parent=workspace

			-- Add to Character List
			local listBtn = Instance.new("TextButton", charList)
			listBtn.Size = UDim2.new(1,-10,0,30)
			listBtn.Text = clone.Name
			listBtn.Font = Enum.Font.GothamBold
			listBtn.TextScaled = true
			listBtn.TextColor3 = Color3.fromRGB(255,255,255)
			listBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
			Instance.new("UICorner", listBtn).CornerRadius = UDim.new(0,8)
			listBtn.MouseButton1Click:Connect(function()
				currentRig = workspace:FindFirstChild(listBtn.Text)
			end)
		end
	end)
end

-- SEARCH FIX
search.MouseButton1Click:Connect(function()
	local name = input.Text
	if name=="" then loading.Text="⚠️ Enter a name!" loading.Visible=true task.delay(2,function() loading.Visible=false end) return end
	loading.Visible=true
	local success,userId=pcall(function() return Players:GetUserIdFromNameAsync(name) end)
	task.wait(1.5)
	loading.Visible=false
	if not success or not userId then loading.Text="❌ User not found!" loading.Visible=true task.delay(2,function() loading.Visible=false end) return end
	local thumb
	local thumbSuccess, thumbResult = pcall(function()
		return Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
	end)
	if thumbSuccess then thumb=thumbResult end
	if thumb then
		local img = Instance.new("ImageLabel", rightPanel)
		img.Size = UDim2.new(0,140,0,140)
		img.Position = UDim2.new(0.05,0,0.05,0)
		img.BackgroundTransparency = 1
		img.Image = thumb
	end
	loading.Text="✅ "..name.." found!"
	loading.Visible=true
	task.delay(2,function() loading.Visible=false end)

	for i=1,3 do buttons[i].Visible=true end
	buttons[1].MouseButton1Click:Connect(function() createRig(userId,"R6",buttons[1]) end)
	buttons[2].MouseButton1Click:Connect(function() createRig(userId,"R15",buttons[2]) end)
	buttons[3].MouseButton1Click:Connect(function() createRig(userId,"Deluxe",buttons[3]) end)
end)
