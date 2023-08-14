local Library = {
	Flags = {},
	Items = {},
	Theme = {
		Accent = Color3.fromRGB(108, 80, 149),
		BackgroundLight = Color3.fromRGB(23, 23, 34),
		BackgroundDark = Color3.fromRGB(18, 18, 27),
		Border = Color3.fromRGB(36, 36, 50),
		NotFocused = Color3.fromRGB(204, 204, 204),
		Focused = Color3.fromRGB(255, 255, 255),
		Risky = Color3.fromRGB(255, 14, 18)
	}
}

local function toRich(color) if typeof(color) == "Color3" then return string.format('rgb(%d, %d, %d)', color.R, color.G, color.B) end end

function Library:New(properties)
	properties = typeof(properties) == "table" and properties or {}
	properties.Name = properties.Name or "New UI"
	properties.Description = properties.Description or "vpvk"
	
	local Window = {}
	
	local firstTab = true
	
	local GUI = Instance.new("ScreenGui")
	local Canvas = Instance.new("Frame")
	local UILLCanvas = Instance.new("UIListLayout")
	local Header = Instance.new("Frame")
	local Background = Instance.new("Frame")
	local UILLBackground = Instance.new("UIListLayout")
	local Footer = Instance.new("Frame")
	local LeftFooter = Instance.new("Folder")
	local LeftLabel = Instance.new("TextLabel")
	local UIPLeftLabel = Instance.new("UIPadding")
	local UILLLeftFooter = Instance.new("UIListLayout")
	local RightFooter = Instance.new("Folder")
	local RightLabel = Instance.new("TextLabel")
	local UIPRightLabel = Instance.new("UIPadding")
	local UILLRightFooter = Instance.new("UIListLayout")
	local ButtonsFrame = Instance.new("Frame")
	local UILLButtons = Instance.new("UIListLayout")
	local UIPButtons = Instance.new("UIPadding")
	
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		Canvas.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	Header.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Canvas.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	Header.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	GUI.Name = "CNVS"
	GUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	GUI.ZIndexBehavior = Enum.ZIndexBehavior.Global

	Canvas.Name = "Canvas"
	Canvas.Parent = GUI
	Canvas.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
	Canvas.BorderColor3 = Color3.fromRGB(36, 36, 50)
	Canvas.BorderSizePixel = 0
	Canvas.ClipsDescendants = true
	Canvas.Position = UDim2.new(0.57225436, 0, 0.359223217, 0)
	Canvas.Size = UDim2.new(0, 622, 0, 494)

	UILLCanvas.Name = "UILLCanvas"
	UILLCanvas.Parent = Canvas
	UILLCanvas.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UILLCanvas.SortOrder = Enum.SortOrder.LayoutOrder

	Header.Name = "Header"
	Header.Parent = Canvas
	Header.BackgroundColor3 = Color3.fromRGB(21, 21, 31)
	Header.BorderColor3 = Color3.fromRGB(36, 36, 50)
	Header.Size = UDim2.new(0, 622, 0, 30)

	Background.Name = "Background"
	Background.Parent = Canvas
	Background.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
	Background.BackgroundTransparency = 1.000
	Background.BorderColor3 = Color3.fromRGB(36, 36, 50)
	Background.BorderSizePixel = 0
	Background.Position = UDim2.new(0, 0, 0.0607287437, 0)
	Background.Size = UDim2.new(0, 622, 0, 439)

	UILLBackground.Name = "UILLBackground"
	UILLBackground.Parent = Background
	UILLBackground.SortOrder = Enum.SortOrder.LayoutOrder

	Footer.Name = "Footer"
	Footer.Parent = Canvas
	Footer.BackgroundColor3 = Color3.fromRGB(21, 21, 31)
	Footer.BorderColor3 = Color3.fromRGB(36, 36, 50)
	Footer.Position = UDim2.new(0, 0, 0.951171875, 0)
	Footer.Size = UDim2.new(0, 622, 0, 25)

	LeftFooter.Name = "LeftFooter"
	LeftFooter.Parent = Footer

	LeftLabel.Name = "LeftLabel"
	LeftLabel.Parent = LeftFooter
	LeftLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LeftLabel.BackgroundTransparency = 1.000
	LeftLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LeftLabel.BorderSizePixel = 0
	LeftLabel.Size = UDim2.new(0, 311, 0, 25)
	LeftLabel.Font = Enum.Font.Jura
	LeftLabel.Text = properties.Name
	LeftLabel.TextColor3 = Color3.fromRGB(252, 252, 252)
	LeftLabel.TextSize = 15.000
	LeftLabel.TextXAlignment = Enum.TextXAlignment.Left

	UIPLeftLabel.Name = "UIPLeftLabel"
	UIPLeftLabel.Parent = LeftLabel
	UIPLeftLabel.PaddingBottom = UDim.new(0, 1)
	UIPLeftLabel.PaddingLeft = UDim.new(0, 10)

	UILLLeftFooter.Name = "UILLLeftFooter"
	UILLLeftFooter.Parent = LeftFooter
	UILLLeftFooter.SortOrder = Enum.SortOrder.LayoutOrder
	UILLLeftFooter.VerticalAlignment = Enum.VerticalAlignment.Center

	RightFooter.Name = "RightFooter"
	RightFooter.Parent = Footer

	RightLabel.Name = "RightLabel"
	RightLabel.Parent = RightFooter
	RightLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RightLabel.BackgroundTransparency = 1.000
	RightLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RightLabel.BorderSizePixel = 0
	RightLabel.Position = UDim2.new(0.5, 0, 0, 0)
	RightLabel.Size = UDim2.new(0, 311, 0, 25)
	RightLabel.Font = Enum.Font.Jura
	RightLabel.Text = properties.Description
	RightLabel.TextColor3 = Color3.fromRGB(218, 218, 218)
	RightLabel.TextSize = 15.000
	RightLabel.TextXAlignment = Enum.TextXAlignment.Right

	UIPRightLabel.Name = "UIPRightLabel"
	UIPRightLabel.Parent = RightLabel
	UIPRightLabel.PaddingBottom = UDim.new(0, 1)
	UIPRightLabel.PaddingRight = UDim.new(0, 10)

	UILLRightFooter.Name = "UILLRightFooter"
	UILLRightFooter.Parent = RightFooter
	UILLRightFooter.HorizontalAlignment = Enum.HorizontalAlignment.Right
	UILLRightFooter.SortOrder = Enum.SortOrder.LayoutOrder
	UILLRightFooter.VerticalAlignment = Enum.VerticalAlignment.Center
	
	ButtonsFrame.BackgroundTransparency = 1
	ButtonsFrame.Size = UDim2.new(0, 622,0, 30)
	ButtonsFrame.Position = UDim2.new(0, 0, 0, 0)
	ButtonsFrame.Parent = Header
	
	UILLButtons.Name = "UILLButtons"
	UILLButtons.Parent = ButtonsFrame
	UILLButtons.FillDirection = Enum.FillDirection.Horizontal
	UILLButtons.SortOrder = Enum.SortOrder.LayoutOrder
	UILLButtons.VerticalAlignment = Enum.VerticalAlignment.Center
	UILLButtons.Padding = UDim.new(0, 5)

	UIPButtons.Name = "UIPButtons"
	UIPButtons.Parent = ButtonsFrame
	UIPButtons.PaddingLeft = UDim.new(0, 15)
	
	local ButtonDocker = Instance.new("Folder", ButtonsFrame)
		
	function Window:AddTab(text)
		text = text or "New Tab"
		
		local TabHandler = {}
		
		local Tab = Instance.new("TextButton")
		local UILLTab = Instance.new("UIListLayout")
		local TabText = Instance.new("TextLabel")
		local UIPTabText = Instance.new("UIPadding")

		Tab.Name = "Tab"
		Tab.Parent = ButtonsFrame
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0.0241157562, 0, 0.0833333358, 0)
		Tab.Font = Enum.Font.SourceSans
		Tab.Text = ""
		Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
		Tab.TextSize = 14.000

		UILLTab.Name = "UILLTab"
		UILLTab.Parent = Tab
		UILLTab.FillDirection = Enum.FillDirection.Horizontal
		UILLTab.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UILLTab.SortOrder = Enum.SortOrder.LayoutOrder
		UILLTab.VerticalAlignment = Enum.VerticalAlignment.Center
		UILLTab.Padding = UDim.new(0, 3)

		TabText.Name = "TabText"
		TabText.Parent = Tab
		TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabText.BackgroundTransparency = 1.000
		TabText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabText.BorderSizePixel = 0
		TabText.Position = UDim2.new(0.191176474, 0, 0.200000003, 0)
		TabText.Font = Enum.Font.Jura
		TabText.Text = text
		TabText.TextColor3 = Color3.fromRGB(204, 204, 204)
		TabText.TextSize = 14.000
		
		local newTabButtonSize = game:GetService("TextService"):GetTextSize(TabText.Text, TabText.TextSize, TabText.Font, Vector2.new(math.huge, math.huge))
		Tab.Size = UDim2.new(0, 7 + newTabButtonSize.X, 0, 25)
		TabText.Size = UDim2.new(0, 7 + newTabButtonSize.X, 0, 15)

		UIPTabText.Name = "UIPTabText"
		UIPTabText.Parent = TabText
		
		local Page = Instance.new("Frame")
		local UILLPage = Instance.new("UIListLayout")


		Page.Name = "Page"
		Page.Parent = Background
		Page.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
		Page.BackgroundTransparency = 1.000
		Page.BorderColor3 = Color3.fromRGB(36, 36, 50)
		Page.BorderSizePixel = 0
		Page.Position = UDim2.new(0, 0, 0.0607287437, 0)
		Page.Size = UDim2.new(0, 622, 0, 439)
		Page.Visible = false

		UILLPage.Name = "UILLPage"
		UILLPage.Parent = Page
		UILLPage.FillDirection = Enum.FillDirection.Horizontal
		UILLPage.SortOrder = Enum.SortOrder.LayoutOrder
		
		local isTab
		
		if firstTab == true then
			Page.Visible = true
			TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
			firstTab = false
		end
		
		
		Tab.MouseButton1Click:Connect(function()
			for _, v in pairs(ButtonsFrame:GetChildren()) do
				if v:IsA("TextButton") then v.TabText.TextColor3 = Color3.fromRGB(204, 204, 204) end
			end
			TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
			for _, v in pairs(Background:GetChildren()) do
				if v:IsA("Frame") then v.Visible = false end
			end
			Page.Visible = true
		end)

	
		
		function TabHandler:AddColumn(name)
			name = name or "Random"
			
			local  SectionHandler = {}
			
			local Collumn1 = Instance.new("ScrollingFrame")
			local UILLColumn1 = Instance.new("UIListLayout")
			local UIPColumn1 = Instance.new("UIPadding")

			Collumn1.Name = "Collumn1"
			Collumn1.Parent = Page
			Collumn1.Active = true
			Collumn1.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
			Collumn1.BackgroundTransparency = 1.000
			Collumn1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Collumn1.BorderSizePixel = 0
			Collumn1.Size = UDim2.new(0, 311, 0, 439)
			Collumn1.CanvasSize = UDim2.new(0, 0, 0, 0)
			Collumn1.ScrollBarThickness = 0
			Collumn1.ClipsDescendants = false

			UILLColumn1.Name = "UILLColumn1"
			UILLColumn1.Parent = Collumn1
			UILLColumn1.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UILLColumn1.SortOrder = Enum.SortOrder.LayoutOrder
			UILLColumn1.Padding = UDim.new(0, 15)

			UIPColumn1.Name = "UIPColumn1"
			UIPColumn1.Parent = Collumn1
			UIPColumn1.PaddingLeft = UDim.new(0, 3)
			UIPColumn1.PaddingTop = UDim.new(0, 12)
			
			function SectionHandler:AddSection(name)
				name = name or "General"
				local firstSubsection = true
				
				local SubSection = {}
				
				local index = 0
				
				local Section = Instance.new("Frame")
				local UILLSection = Instance.new("UIListLayout")
				local SectionTabFrame = Instance.new("Frame")
				local UILLSectionTabFrame = Instance.new("UIListLayout")

				local sec

				Section.Name = "Section"
				Section.Parent = Collumn1 
				Section.BackgroundColor3 = Color3.fromRGB(21, 21, 31)
				Section.BorderColor3 = Color3.fromRGB(36, 36, 50)
				Section.ClipsDescendants = false
				Section.Position = UDim2.new(0.0192926042, 0, 0.0273348521, 0)
				Section.Size = Section.Size + UDim2.new(0, 294, 0, 20)

				UILLSection.Name = "UILLSection"
				UILLSection.Parent = Section
				UILLSection.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UILLSection.SortOrder = Enum.SortOrder.LayoutOrder

				SectionTabFrame.Name = "SectionTabFrame"
				SectionTabFrame.Parent = Section
				SectionTabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SectionTabFrame.BackgroundTransparency = 1.000
				SectionTabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SectionTabFrame.BorderSizePixel = 0
				SectionTabFrame.Position = UDim2.new(0, 0, 0.0896860957, 0)
				SectionTabFrame.Size = UDim2.new(0, 294, 0, 20)
				SectionTabFrame.ClipsDescendants = true
				
				local UIS77 = Instance.new("UIStroke")
				UIS77.Parent = SectionTabFrame
				UIS77.Color = Library.Theme.Border

				UILLSectionTabFrame.Name = "UILLSectionTabFrame"
				UILLSectionTabFrame.Parent = SectionTabFrame
				UILLSectionTabFrame.FillDirection = Enum.FillDirection.Horizontal
				UILLSectionTabFrame.SortOrder = Enum.SortOrder.LayoutOrder
				UILLSectionTabFrame.VerticalAlignment = Enum.VerticalAlignment.Center
				UILLSectionTabFrame.Padding = UDim.new(0, 1)
				
				local function SectionSize(UIL)
					return UIL.AbsoluteContentSize.Y
				end
				
				function SubSection:AddSubsec(name)
					name = name or "Advanced"
					
					index = index + 1
					
					local Utilities = {}
					
					local SectionTab = Instance.new("TextButton")
					local SectionBG = Instance.new("Frame")
					
					SectionTab.Name = "SectionTab"
					SectionTab.Parent = SectionTabFrame
					SectionTab.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
					SectionTab.BorderColor3 = Color3.fromRGB(36, 36, 50)
					SectionTab.AutoButtonColor = false
					SectionTab.Font = Enum.Font.Jura
					SectionTab.Text = name
					SectionTab.TextColor3 = Color3.fromRGB(204, 204, 204)
					SectionTab.TextSize = 14.000
					
					
					for _, v in pairs(SectionTabFrame:GetChildren()) do
						if v:IsA("TextButton") then v.Size = UDim2.new(0, SectionTabFrame.Size.X.Offset / index, 0, 20) end
					end

					SectionBG.Name = "SectionBG"
					SectionBG.Parent = Section
					SectionBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SectionBG.BackgroundTransparency = 1.000
					SectionBG.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SectionBG.BorderSizePixel = 0
					SectionBG.Position = UDim2.new(0, 0, 0.129870132, 0)
					SectionBG.Size = UDim2.new(0, 294, 0, 0)
					SectionBG.Visible = false

					local UILLSubSection = Instance.new("UIListLayout")

					UILLSubSection.Name = "UILLSubSection"
					UILLSubSection.Parent = SectionBG
					UILLSubSection.HorizontalAlignment = Enum.HorizontalAlignment.Center
					UILLSubSection.SortOrder = Enum.SortOrder.LayoutOrder
					UILLSubSection.Padding = UDim.new(0, 5)
					
					local UIPSubSection = Instance.new("UIPadding")

					UIPSubSection.Parent = SectionBG
					UIPSubSection.PaddingTop = UDim.new(0, 7)
					
					if firstSubsection == true then
						SectionTab.BackgroundColor3 =  Color3.fromRGB(21, 21, 31)
						SectionTab.TextColor3 = Color3.fromRGB(255, 255, 255)
						SectionBG.Visible = true
						firstSubsection = false
					end
					
					SectionTab.MouseButton1Click:Connect(function()
						for _, v in pairs(SectionTabFrame:GetChildren()) do
							if v:IsA("TextButton") then v.BackgroundColor3 = Color3.fromRGB(18, 18, 27); v.TextColor3 = Color3.fromRGB(204, 204, 204); end
						end
						SectionTab.BackgroundColor3 = Color3.fromRGB(21, 21, 31)
						SectionTab.TextColor3 = Color3.fromRGB(255, 255, 255)
						for _, v in pairs(Section:GetChildren()) do
							if v:IsA("Frame") and v.Name == "SectionBG" then v.Visible = false end
						end
						SectionBG.Visible = true
						Section.Size = SectionBG.Size + UDim2.new(0, 0, 0, 20)
						
					end)
					
					---------------------------------------------------------- UTILITIES ----------------------------------------------------------
					
					function Utilities:AddToggle(option)
						option = typeof(option) == "table" and option or {}
						option.text = option.text or "New Toggle"
						option.enabled = option.enabled or false
						option.risky = option.risky or false
						option.flag = option.flag or option.text
						option.state = option.enabled
						option.callback = option.callback or function() end
						
				
						
						local Toggle = {}

						local Toggle = Instance.new("Frame")
						local UILLToggle = Instance.new("UIListLayout")
						local ToggleFrame = Instance.new("Frame")
						local UIGradient = Instance.new("UIGradient")
						local ToggleText = Instance.new("TextLabel")
						local ignoreToggle = Instance.new("Folder")
						local btnToggle = Instance.new("TextButton")
						local UIListLayout = Instance.new("UIListLayout")
						local UISToggle = Instance.new("UIStroke")

						Toggle.Name = "Toggle"
						Toggle.Parent = SectionBG
						Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Toggle.BackgroundTransparency = 1.000
						Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Toggle.BorderSizePixel = 0
						Toggle.Position = UDim2.new(0.0169491526, 0, 0.0817941949, 0)
						Toggle.Size = UDim2.new(0, 279, 0, 17)

						UILLToggle.Name = "UILLToggle"
						UILLToggle.Parent = Toggle
						UILLToggle.FillDirection = Enum.FillDirection.Horizontal
						UILLToggle.SortOrder = Enum.SortOrder.LayoutOrder
						UILLToggle.VerticalAlignment = Enum.VerticalAlignment.Center
						UILLToggle.Padding = UDim.new(0, 10)

						ToggleFrame.Name = "ToggleFrame"
						ToggleFrame.Parent = Toggle
						ToggleFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
						ToggleFrame.BorderColor3 = Color3.fromRGB(36, 36, 50)
						ToggleFrame.BorderSizePixel = 0
						ToggleFrame.Size = UDim2.new(0, 15, 0, 15)

						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(186, 186, 186))}
						UIGradient.Rotation = 90
						UIGradient.Parent = ToggleFrame

						ToggleText.Name = "ToggleText"
						ToggleText.Parent = Toggle
						ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ToggleText.BackgroundTransparency = 1.000
						ToggleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
						ToggleText.BorderSizePixel = 0
						ToggleText.Position = UDim2.new(0.0824372768, 0, 0.0294117648, 0)
						ToggleText.Size = UDim2.new(0, 203, 0, 15)
						ToggleText.Font = Enum.Font.Jura
						ToggleText.Text = option.text
						ToggleText.TextColor3 = Library.Theme.NotFocused
						ToggleText.TextSize = 14.000
						ToggleText.TextXAlignment = Enum.TextXAlignment.Left

						ignoreToggle.Name = "ignoreToggle"
						ignoreToggle.Parent = Toggle

						btnToggle.Name = "btnToggle"
						btnToggle.Parent = ignoreToggle
						btnToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						btnToggle.BackgroundTransparency = 1.000
						btnToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
						btnToggle.BorderSizePixel = 0
						btnToggle.Size = UDim2.new(0, 228, 0, 17)
						btnToggle.Font = Enum.Font.SourceSans
						btnToggle.Text = ""
						btnToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
						btnToggle.TextSize = 14.000
						
						UISToggle.Parent = ToggleFrame
						UISToggle.Color = Color3. fromRGB(36, 36, 50)

						UIListLayout.Parent = ignoreToggle
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
						
						local toggleAddons = Instance.new("Folder")
						local toggleAddonsFrame = Instance.new("Frame")
						local UILLtoggleAddonsFrame = Instance.new("UIListLayout")
						local UILLtoggleAddons = Instance.new("UIListLayout")

						toggleAddons.Name = "toggleAddons"
						toggleAddons.Parent = Toggle

						toggleAddonsFrame.Name = "toggleAddonsFrame"
						toggleAddonsFrame.Parent = toggleAddons
						toggleAddonsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						toggleAddonsFrame.BackgroundTransparency = 1.000
						toggleAddonsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
						toggleAddonsFrame.BorderSizePixel = 0
						toggleAddonsFrame.Position = UDim2.new(0.73476702, 0, 0.0294117648, 0)
						toggleAddonsFrame.Size = UDim2.new(0, 74, 0, 16)

						UILLtoggleAddonsFrame.Name = "UILLtoggleAddonsFrame"
						UILLtoggleAddonsFrame.Parent = toggleAddonsFrame
						UILLtoggleAddonsFrame.FillDirection = Enum.FillDirection.Horizontal
						UILLtoggleAddonsFrame.HorizontalAlignment = Enum.HorizontalAlignment.Right
						UILLtoggleAddonsFrame.SortOrder = Enum.SortOrder.LayoutOrder
						UILLtoggleAddonsFrame.VerticalAlignment = Enum.VerticalAlignment.Center
						UILLtoggleAddonsFrame.Padding = UDim.new(0, 4)

						UILLtoggleAddons.Name = "UILLtoggleAddons"
						UILLtoggleAddons.Parent = toggleAddons
						UILLtoggleAddons.HorizontalAlignment = Enum.HorizontalAlignment.Right
						UILLtoggleAddons.SortOrder = Enum.SortOrder.LayoutOrder
						UILLtoggleAddons.VerticalAlignment = Enum.VerticalAlignment.Center
						
						btnToggle.MouseButton1Click:Connect(function()
							if option.state == false then
								ToggleFrame.BackgroundColor3 = Library.Theme.Accent
								ToggleText.TextColor3 = Library.Theme.Focused
							elseif option.state == true then
								ToggleFrame.BackgroundColor3 = Library.Theme.BackgroundDark
								ToggleText.TextColor3 = Library.Theme.NotFocused
							end
							option.state = not option.state
							Library.Flags[option.flag] = option.state
							option.callback(option.state)
						end)
						
						btnToggle.MouseEnter:Connect(function()
							UISToggle.Color = Library.Theme.Accent
						end)
						btnToggle.MouseLeave:Connect(function()
							UISToggle.Color = Library.Theme.Border
						end)
						
						if option.enabled == true then
							option.callback(true)
							option.state = true
							ToggleFrame.BackgroundColor3 = Library.Theme.Accent
							ToggleText.TextColor3 = Library.Theme.Focused
						end
						
						function option:SetValue(boolean)
							boolean = typeof(boolean) == "boolean" and boolean 
							option.state = boolean
							option.callback(option.state)
							Library.Flags[option.flag] = option.state
							if option.state == false then
								ToggleFrame.BackgroundColor3 =  Library.Theme.BackgroundDark
								ToggleText.TextColor3 = Library.Theme.NotFocused
							elseif option.state == true then
								ToggleFrame.BackgroundColor3 = Library.Theme.Accent
								ToggleText.TextColor3 = Library.Theme.Focused
							end
						end
						
						if option.flag and option.flag ~= "" then
							Library.Flags[option.flag] = option.state
							Library.Items[option.flag] = option
						end
						
						local UpdateSection = SectionSize(UILLSubSection)
						SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)
						
						local hopster = option
						
						function option:AddKeybind(option)
							option = typeof(option) == "table" and option or {}
							option.text = option.text
							option.key = option.key or Enum.KeyCode.World95
							option.sync = option.sync or false
							option.flag = option.flag or option.text or "DDDYD"
							option.callback = option.callback or function() end


							local addonBind = Instance.new("TextButton")
							local UIPadding = Instance.new("UIPadding")

							--Properties:

							addonBind.Name = "addonBind"
							addonBind.Parent = toggleAddonsFrame
							addonBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							addonBind.BackgroundTransparency = 1.000
							addonBind.BorderColor3 = Color3.fromRGB(0, 0, 0)
							addonBind.BorderSizePixel = 0
							addonBind.Position = UDim2.new(0.662162185, 0, 0.03125, 0)
							addonBind.Size = UDim2.new(0, 22, 0, 15)
							addonBind.Font = Enum.Font.Jura
							addonBind.TextColor3 = Color3.fromRGB(154, 154, 154)
							addonBind.TextSize = 14.000
							addonBind.TextXAlignment = Enum.TextXAlignment.Right

							UIPadding.Parent = addonBind
							UIPadding.PaddingBottom = UDim.new(0, 1)

							hold = false

							local shorts = {
								RightAlt = "RA",
								LeftAlt = "LA",
								RightControl = "RC",
								LeftControl = "LC",
								LeftShift = "LS",
								RightShift = "RS",
								MouseButton1 = "M1",
								MouseButton2 = "M2",
								Return = "ENT",
								Backspace = "BP",
								Tab = "TAB",
								CapsLock = "CL",
								Escape = "ESC",
								Insert = "INS",
								PageUp = "UP",
								PageDown = "DOWN",
								KeypadMultiply = "*",
								KeypadDivide = "/",
								End = "END",
								Unknown = "?",
								World95 = "?"
							}

							local ignored = {
								W = true,
								A = true,
								S = true,
								D = true,
								Space = true,
								F = true,
								R = true
							}

							addonBind.Text = "[ "..tostring(shorts[option.key.Name]).." ]" or "[ "..tostring(option.key.Name).." ]"
							if addonBind.Text:match("nil") then
								addonBind.Text = "[ "..tostring(option.key.Name).." ]"
							end

							local newBindButtonSize =
								game:GetService("TextService"):GetTextSize(
									addonBind.Text,
									addonBind.TextSize,
									addonBind.Font,
									Vector2.new(math.huge, math.huge)
								)
							addonBind.Size = UDim2.new(0, 3 + newBindButtonSize.X, 0, 15)

							addonBind.MouseButton1Click:Connect(function()
								hold = true
								if hold == true then
									addonBind.Text = "[ ... ]"
									local newBindButtonSize =
										game:GetService("TextService"):GetTextSize(
											addonBind.Text,
											addonBind.TextSize,
											addonBind.Font,
											Vector2.new(math.huge, math.huge)
										)
									addonBind.Size = UDim2.new(0, 3 + newBindButtonSize.X, 0, 15)
									local Input
									repeat Input = game:GetService("UserInputService").InputBegan:Wait() until not ignored[Input.KeyCode.Name] do end
									if Input.KeyCode.Name ~= "Unknown" and not ignored[Input.KeyCode.Name] then
										local K = shorts[Input.KeyCode.Name] or Input.KeyCode.Name
										addonBind.Text = "[ ".. K .." ]"
										option.key = Input.KeyCode
										local newBindButtonSize =
											game:GetService("TextService"):GetTextSize(
												addonBind.Text,
												addonBind.TextSize,
												addonBind.Font,
												Vector2.new(math.huge, math.huge)
											)
										addonBind.Size = UDim2.new(0, 3 + newBindButtonSize.X, 0, 15)
										Library.Flags[option.flag] = option.key.Name									
									end
								end
								wait()
								hold = false
							end)
							
							local state = hopster.state

							game:GetService("UserInputService").InputBegan:Connect(function(k, t)
								if t then return end
								if k.KeyCode == option.key then
									if option.sync then
										if hold == false then
											hopster.state = not hopster.state
											hopster:SetValue(hopster.state)
										end
									else
										if hold == false then
											pcall(option.callback)
										end
									end
								end
							end)

							local UpdateSection = SectionSize(UILLSubSection)
							SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)

							if option.flag and option.flag ~= "" then
								Library.Flags[option.flag] = option.state
								Library.Items[option.flag] = option
							end

							function option:SetValue(key)
								option.key = key
								local text = shorts[option.key.Name] or option.key.Name
								addonBind.Text = "[ "..text.." ]"
								local newBindButtonSize =
									game:GetService("TextService"):GetTextSize(
										addonBind.Text,
										addonBind.TextSize,
										addonBind.Font,
										Vector2.new(math.huge, math.huge)
									)
								addonBind.Size = UDim2.new(0, 3 + newBindButtonSize.X, 0, 15)
								Library.Flags[option.flag] = option.key.Name
							end

							return option;
						end
						
						function option:AddSlider(option)
							option = typeof(option) == "table" and option or {}
							option.min = option.min or 0
							option.max = option.max or 100
							option.value = option.value or 0
							option.suffix = option.suffix or ""
							option.float = typeof(option.float) == "number" and option.float or 0
							option.flag = option.flag or hopster.text.."Slider"
							option.callback = option.callback or function() end
						
							Toggle.Size = UDim2.new(0, 279, 0, 37)
							btnToggle.Parent.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

							local ignoreSlider = Instance.new("Folder")
							local ignoreSliderValue = Instance.new("TextLabel")
							local UILLignoreSlider = Instance.new("UIListLayout")
							local addonBind = Instance.new("TextButton")
							local ignoreToggleSlider = Instance.new("Folder")
							local btnSlider = Instance.new("TextButton")
							local frameSlider = Instance.new("Frame")
							local UIGradient = Instance.new("UIGradient")
							local UIGradient2 = Instance.new("UIGradient")
							local UILLignoreToggleSlider = Instance.new("UIListLayout")

							UILLToggle.VerticalAlignment = Enum.VerticalAlignment.Top

							ignoreSlider.Name = "ignoreSlider"
							ignoreSlider.Parent = Toggle

							ignoreSliderValue.Name = "ignoreSliderValue"
							ignoreSliderValue.Parent = toggleAddonsFrame
							ignoreSliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							ignoreSliderValue.BackgroundTransparency = 1.000
							ignoreSliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
							ignoreSliderValue.BorderSizePixel = 0
							ignoreSliderValue.Position = UDim2.new(0.906810045, 0, 0, 0)
							ignoreSliderValue.Size = UDim2.new(0, 26, 0, 15)
							ignoreSliderValue.Font = Enum.Font.Jura
							ignoreSliderValue.Text = option.value
							ignoreSliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
							ignoreSliderValue.TextSize = 14.000
							ignoreSliderValue.TextXAlignment = Enum.TextXAlignment.Right
							ignoreSliderValue.LayoutOrder = -2
							
							UILLtoggleAddons.VerticalAlignment = Enum.VerticalAlignment.Top
							UILLtoggleAddonsFrame.VerticalAlignment = Enum.VerticalAlignment.Top

							UILLignoreSlider.Name = "UILLignoreSlider"
							UILLignoreSlider.Parent = ignoreSlider
							UILLignoreSlider.FillDirection = Enum.FillDirection.Horizontal
							UILLignoreSlider.HorizontalAlignment = Enum.HorizontalAlignment.Right
							UILLignoreSlider.SortOrder = Enum.SortOrder.LayoutOrder


							ignoreToggleSlider.Name = "ignoreToggleSlider"
							ignoreToggleSlider.Parent = Toggle

							btnSlider.Name = "btnSlider"
							btnSlider.Parent = ignoreToggleSlider
							btnSlider.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
							btnSlider.BorderColor3 = Color3.fromRGB(36, 36, 50)
							btnSlider.Position = UDim2.new(0, 0, 0.545452416, 0)
							btnSlider.Size = UDim2.new(0, 279, 0, 15)
							btnSlider.AutoButtonColor = false
							btnSlider.Font = Enum.Font.SourceSans
							btnSlider.Text = ""
							btnSlider.TextColor3 = Color3.fromRGB(0, 0, 0)
							btnSlider.TextSize = 14.000

							frameSlider.Name = "frameSlider"
							frameSlider.Parent = btnSlider
							frameSlider.BackgroundColor3 = Library.Theme.Accent
							frameSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)
							frameSlider.BorderSizePixel = 0
							frameSlider.Size = UDim2.new(0, 219, 0, 15)

							UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(186, 186, 186))}
							UIGradient.Rotation = 90
							UIGradient.Parent = frameSlider
							
							UIGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(214, 214, 214))}
							UIGradient2.Rotation = 90
							UIGradient2.Parent = btnSlider
							
							UILLignoreToggleSlider.Name = "UILLignoreToggleSlider"
							UILLignoreToggleSlider.Parent = ignoreToggleSlider
							UILLignoreToggleSlider.SortOrder = Enum.SortOrder.LayoutOrder
							UILLignoreToggleSlider.VerticalAlignment = Enum.VerticalAlignment.Bottom
							
							local UISbtnSlider = Instance.new("UIStroke")
							UISbtnSlider.Color = Library.Theme.Border
							UISbtnSlider.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
							UISbtnSlider.Parent = btnSlider
							
							local dragging = false
							local Mouse = game.Players.LocalPlayer:GetMouse()

							if option.value > option.max then
								option.value = option.max
								frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
								ignoreSliderValue.Text = option.value..option.suffix
							elseif option.value < option.min then
								option.value = option.min
								frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
								ignoreSliderValue.Text = option.value..option.suffix
							else
								option.value = option.value
								frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
								ignoreSliderValue.Text = option.value..option.suffix
							end
							option.callback(option.value)

							frameSlider.Size = UDim2.new(0, math.floor(((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5) * 100) / 100, 0, 15)

							ignoreSliderValue.Text = option.value..option.suffix
							option.callback(option.value)

							btnSlider.MouseButton1Down:Connect(function()
								dragging = true
								frameSlider.Size = UDim2.new(0, math.clamp(Mouse.X - frameSlider.AbsolutePosition.X, 0, 279), 0, 15)
								option.value = tonumber(string.format("%."..option.float.."f", (((tonumber(option.max) - tonumber(option.min)) / 279) * frameSlider.AbsoluteSize.X) + tonumber(option.min)))
								ignoreSliderValue.Text = option.value .. option.suffix
								option.callback(option.value)
								moveconnection = Mouse.Move:Connect(function()
									frameSlider.Size = UDim2.new(0, math.clamp(Mouse.X - frameSlider.AbsolutePosition.X, 0, 279), 0, 15)

									local valueIncrement = (tonumber(option.max) - tonumber(option.min))
									option.value = tonumber(string.format("%."..option.float.."f", (((valueIncrement) / 279) * frameSlider.AbsoluteSize.X) + tonumber(option.min)))
									ignoreSliderValue.Text = option.value .. option.suffix

									btnSlider.BorderColor3 = Library.Theme.Accent

									pcall(function()
										option.callback(option.value)
									end)
									Library.Flags[option.flag] = option.value
								end)
								UISbtnSlider.Color = Library.Theme.Accent

								releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(m)
									if m.UserInputType == Enum.UserInputType.MouseButton1 then
										moveconnection:Disconnect()
										releaseconnection:Disconnect()
										dragging = false
										if Mouse.X >= btnSlider.AbsolutePosition.X and Mouse.X <= btnSlider.AbsolutePosition.X + btnSlider.AbsoluteSize.X and
											Mouse.Y >= btnSlider.AbsolutePosition.Y and Mouse.Y <= btnSlider.AbsolutePosition.Y + btnSlider.AbsoluteSize.Y then
											UISbtnSlider.Color = Library.Theme.Accent
										else
											UISbtnSlider.Color = Library.Theme.Border
										end
										option.callback(option.value)
										Library.Flags[option.flag] = option.value
									end
								end)
							end)

							btnSlider.MouseEnter:Connect(function()
								UISbtnSlider.Color = Library.Theme.Accent
							end)
							btnSlider.MouseLeave:Connect(function()
								if not dragging then
									UISbtnSlider.Color = Library.Theme.Border
								end
							end)

							if option.flag and option.flag ~= "" then
								Library.Flags[option.flag] = option.value
								Library.Items[option.flag] = option
							end

							function option:SetValue(int)
								if int > option.max then
									option.value = option.max
									frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
									ignoreSliderValue.Text = option.value..option.suffix
								elseif int < option.min then
									option.value = option.min
									frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
									ignoreSliderValue.Text = option.value..option.suffix
								else
									option.value = int
									frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
									ignoreSliderValue.Text = option.value..option.suffix
								end
								option.callback(option.value)
								Library.Flags[option.flag] = option.value
							end
							
							local UpdateSection = SectionSize(UILLSubSection)
							SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)
							
							return option;
						end
						
						return option;
					end
					
					function Utilities:AddDivider(option)
						option = typeof(option) == "table" and option or {}
						option.text = option.text or "Divider"
						option.offset = option.offset or 11
						option.multiply = option.multiply or 1

						local Divider = Instance.new("Frame")
						local UILLDivider = Instance.new("UIListLayout")
						local DividerFrame = Instance.new("Frame")
						local ignoreDivider = Instance.new("Folder")
						local DividerText = Instance.new("TextLabel")
						local UIPDividerText = Instance.new("UIPadding")
						local UILLignoreDivider = Instance.new("UIListLayout")

						Divider.Name = "Divider"
						Divider.Parent = SectionBG
						Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Divider.BackgroundTransparency = 1.000
						Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Divider.BorderSizePixel = 0
						Divider.Position = UDim2.new(0.0254237279, 0, 0.54353565, 0)
						Divider.Size = UDim2.new(0, 279, 0, 15)

						UILLDivider.Name = "UILLDivider"
						UILLDivider.Parent = Divider
						UILLDivider.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UILLDivider.SortOrder = Enum.SortOrder.LayoutOrder
						UILLDivider.VerticalAlignment = Enum.VerticalAlignment.Center

						DividerFrame.Name = "DividerFrame"
						DividerFrame.Parent = Divider
						DividerFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 50)
						DividerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
						DividerFrame.BorderSizePixel = 0
						DividerFrame.Position = UDim2.new(0.320788532, 0, -4.5, 0)
						DividerFrame.Size = UDim2.new(0, 279, 0, 1)

						ignoreDivider.Name = "ignoreDivider"
						ignoreDivider.Parent = DividerFrame

						DividerText.Name = "DividerText"
						DividerText.Parent = ignoreDivider
						DividerText.BackgroundColor3 = Color3.fromRGB(21, 21, 31)
						DividerText.BorderColor3 = Color3.fromRGB(0, 0, 0)
						DividerText.BorderSizePixel = 0
						DividerText.Position = UDim2.new(0.392473131, 0, -4.5, 0)
						DividerText.Font = Enum.Font.Jura
						DividerText.Text = option.text
						DividerText.TextColor3 = Color3.fromRGB(204, 204, 204)
						DividerText.TextSize = 14.000
						local newDividerTextSize = game:GetService("TextService"):GetTextSize(DividerText.Text, DividerText.TextSize, DividerText.Font, Vector2.new(math.huge, math.huge))
						DividerText.Size = UDim2.new(0, newDividerTextSize.X + option.offset, 0, (10 * option.multiply))
						
						UIPDividerText.Name = "UIPDividerText"
						UIPDividerText.Parent = DividerText
						UIPDividerText.PaddingBottom = UDim.new(0, 1)

						UILLignoreDivider.Name = "UILLignoreDivider"
						UILLignoreDivider.Parent = ignoreDivider
						UILLignoreDivider.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UILLignoreDivider.SortOrder = Enum.SortOrder.LayoutOrder
						UILLignoreDivider.VerticalAlignment = Enum.VerticalAlignment.Center
						
						local UpdateSection = SectionSize(UILLSubSection)
						SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)

						return option;
					end
					
					function Utilities:AddButton(option)
						option = typeof(option) == "table" and option or {}
						option.text = option.text or "Button"
						option.rich = option.rich or false
						option.callback = option.callback or function() end
						
						local Button = Instance.new("Frame")
						local btnButton = Instance.new("TextButton")
						local UIGradient = Instance.new("UIGradient")
						local UISbtnButton = Instance.new("UIStroke")
						

						Button.Name = "Button"
						Button.Parent = SectionBG
						Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000
						Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Button.BorderSizePixel = 0
						Button.Position = UDim2.new(0.330508471, 0, 0.596306086, 0)
						Button.Size = UDim2.new(0, 279, 0, 18)

						btnButton.Name = "btnButton"
						btnButton.Parent = Button
						btnButton.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
						btnButton.BorderColor3 = Color3.fromRGB(36, 36, 50)
						btnButton.BorderSizePixel = 0
						btnButton.Size = UDim2.new(0, 279, 0, 18)
						btnButton.AutoButtonColor = false
						btnButton.Font = Enum.Font.Jura
						btnButton.Text = option.text
						btnButton.TextColor3 = Library.Theme.NotFocused
						btnButton.TextSize = 14.000
						btnButton.RichText = option.rich
						
						UISbtnButton.Parent = btnButton
						UISbtnButton.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
						UISbtnButton.Color = Color3.fromRGB(36, 36, 50)

						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(230, 230, 230))}
						UIGradient.Rotation = 90
						UIGradient.Parent = btnButton
						
						local UIPadding = Instance.new("UIPadding")

						UIPadding.Parent = btnButton
						UIPadding.PaddingBottom = UDim.new(0, 1)
						
						btnButton.MouseButton1Click:Connect(function()
							pcall(option.callback)
							btnButton.TextColor3 = Library.Theme.Focused
							wait(0.05)
							btnButton.TextColor3 = Library.Theme.NotFocused
							
						end)
						btnButton.MouseEnter:Connect(function()
							UISbtnButton.Color = Library.Theme.Accent
						end)
						btnButton.MouseLeave:Connect(function()
							UISbtnButton.Color = Library.Theme.Border
						end)
						
						local UpdateSection = SectionSize(UILLSubSection)
						SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)
						
						return option;
						
					end
					
					function Utilities:AddKeybind(option)
						option = typeof(option) == "table" and option or {}
						option.text = option.text
						option.key = option.key or Enum.KeyCode.World95
						option.flag = option.flag or option.text
						option.callback = option.callback or function() end
					

						local Keybind = Instance.new("Frame")
						local TextLabel = Instance.new("TextLabel")
						local bindAddons = Instance.new("Folder")
						local bindAddonsFrame = Instance.new("Frame")
						local UILLbindAddonsFrame = Instance.new("UIListLayout")
						local addonBind = Instance.new("TextButton")
						local UIPaddonBind = Instance.new("UIPadding")
						local UILLtoggleAddons = Instance.new("UIListLayout")
						local UIListLayout = Instance.new("UIListLayout")

						Keybind.Name = "Keybind"
						Keybind.Parent = SectionBG
						Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Keybind.BackgroundTransparency = 1.000
						Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Keybind.BorderSizePixel = 0
						Keybind.Position = UDim2.new(0.0271186437, 0, 0.662269115, 0)
						Keybind.Size = UDim2.new(0, 279, 0, 17)

						TextLabel.Parent = Keybind
						TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
						TextLabel.BorderSizePixel = 0
						TextLabel.Position = UDim2.new(0, 0, 0.0588235296, 0)
						TextLabel.Size = UDim2.new(0, 180, 0, 15)
						TextLabel.Font = Enum.Font.Jura
						TextLabel.Text = option.text
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextSize = 14.000
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left

						bindAddons.Name = "bindAddons"
						bindAddons.Parent = Keybind

						bindAddonsFrame.Name = "bindAddonsFrame"
						bindAddonsFrame.Parent = bindAddons
						bindAddonsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						bindAddonsFrame.BackgroundTransparency = 1.000
						bindAddonsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
						bindAddonsFrame.BorderSizePixel = 0
						bindAddonsFrame.Position = UDim2.new(0.73476702, 0, 0.0294117648, 0)
						bindAddonsFrame.Size = UDim2.new(0, 74, 0, 16)

						UILLbindAddonsFrame.Name = "UILLbindAddonsFrame"
						UILLbindAddonsFrame.Parent = bindAddonsFrame
						UILLbindAddonsFrame.FillDirection = Enum.FillDirection.Horizontal
						UILLbindAddonsFrame.HorizontalAlignment = Enum.HorizontalAlignment.Right
						UILLbindAddonsFrame.SortOrder = Enum.SortOrder.LayoutOrder
						UILLbindAddonsFrame.VerticalAlignment = Enum.VerticalAlignment.Center
						UILLbindAddonsFrame.Padding = UDim.new(0, 4)

						addonBind.Name = "addonBind"
						addonBind.Parent = bindAddonsFrame
						addonBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						addonBind.BackgroundTransparency = 1.000
						addonBind.BorderColor3 = Color3.fromRGB(0, 0, 0)
						addonBind.BorderSizePixel = 0
						addonBind.Position = UDim2.new(0.662162185, 0, 0.03125, 0)
						addonBind.Size = UDim2.new(0, 25, 0, 15)
						addonBind.Font = Enum.Font.Jura
						addonBind.TextColor3 = Color3.fromRGB(154, 154, 154)
						addonBind.TextSize = 14.000
						addonBind.TextXAlignment = Enum.TextXAlignment.Right

						UIPaddonBind.Name = "UIPaddonBind"
						UIPaddonBind.Parent = addonBind
						UIPaddonBind.PaddingBottom = UDim.new(0, 2)

						UILLtoggleAddons.Name = "UILLtoggleAddons"
						UILLtoggleAddons.Parent = bindAddons
						UILLtoggleAddons.HorizontalAlignment = Enum.HorizontalAlignment.Right
						UILLtoggleAddons.SortOrder = Enum.SortOrder.LayoutOrder
						UILLtoggleAddons.VerticalAlignment = Enum.VerticalAlignment.Center

						UIListLayout.Parent = Keybind
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
						
						hold = false
						
						local shorts = {
							RightAlt = "RA",
							LeftAlt = "LA",
							RightControl = "RC",
							LeftControl = "LC",
							LeftShift = "LS",
							RightShift = "RS",
							MouseButton1 = "M1",
							MouseButton2 = "M2",
							Return = "ENT",
							Backspace = "BP",
							Tab = "TAB",
							CapsLock = "CL",
							Escape = "ESC",
							Insert = "INS",
							PageUp = "UP",
							PageDown = "DOWN",
							KeypadMultiply = "*",
							KeypadDivide = "/",
							End = "END",
							Unknown = "?",
							World95 = "?"
						}
						
						local ignored = {
							W = true,
							A = true,
							S = true,
							D = true,
							Space = true,
							F = true,
							R = true
						}
						
						addonBind.Text = "[ "..tostring(shorts[option.key.Name]).." ]" or "[ "..tostring(option.key.Name).." ]"
						if addonBind.Text:match("nil") then
							addonBind.Text = "[ "..tostring(option.key.Name).." ]"
						end
						
						local newBindButtonSize =
							game:GetService("TextService"):GetTextSize(
								addonBind.Text,
								addonBind.TextSize,
								addonBind.Font,
								Vector2.new(math.huge, math.huge)
							)
						addonBind.Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
						
						addonBind.MouseButton1Click:Connect(function()
							hold = true
							if hold == true then
								addonBind.Text = "[ ... ]"
								local newBindButtonSize =
									game:GetService("TextService"):GetTextSize(
										addonBind.Text,
										addonBind.TextSize,
										addonBind.Font,
										Vector2.new(math.huge, math.huge)
									)
								addonBind.Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
								local Input
								repeat Input = game:GetService("UserInputService").InputBegan:Wait() until not ignored[Input.KeyCode.Name] do end
								if Input.KeyCode.Name ~= "Unknown" and not ignored[Input.KeyCode.Name] then
									local K = shorts[Input.KeyCode.Name] or Input.KeyCode.Name
									addonBind.Text = "[ ".. K .." ]"
									option.key = Input.KeyCode
									local newBindButtonSize =
										game:GetService("TextService"):GetTextSize(
											addonBind.Text,
											addonBind.TextSize,
											addonBind.Font,
											Vector2.new(math.huge, math.huge)
										)
									addonBind.Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
									Library.Flags[option.flag] = option.key.Name									
								end
							end
							wait()
							hold = false
						end)
						
						game:GetService("UserInputService").InputBegan:Connect(function(k, t)
							if t then return end
							if k.KeyCode == option.key then
								if hold == false then
									pcall(option.callback)
								end
							end
						end)
						
						local UpdateSection = SectionSize(UILLSubSection)
						SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)
						
						if option.flag and option.flag ~= "" then
							Library.Flags[option.flag] = option.state
							Library.Items[option.flag] = option
						end
						
						function option:SetValue(key)
							option.key = key
							local text = shorts[option.key.Name] or option.key.Name
							addonBind.Text = "[ "..text.." ]"
							local newBindButtonSize =
								game:GetService("TextService"):GetTextSize(
									addonBind.Text,
									addonBind.TextSize,
									addonBind.Font,
									Vector2.new(math.huge, math.huge)
								)
							addonBind.Size = UDim2.new(0, 0 + newBindButtonSize.X, 0, 15)
							Library.Flags[option.flag] = option.key.Name
						end
						
						return option;
					end
					
					function Utilities:AddLabel(option)
						option = typeof(option) and option or {}
						option.text = option.text or "New Label"
						option.rich = option.rich or false
						
						local Label = Instance.new("Frame")
						local labelText = Instance.new("TextLabel")
						local UIListLayout = Instance.new("UIListLayout")

						Label.Name = "Label"
						Label.Parent = SectionBG
						Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Label.BackgroundTransparency = 1.000
						Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Label.BorderSizePixel = 0
						Label.Position = UDim2.new(0.0271186437, 0, 0.662269115, 0)
						Label.Size = UDim2.new(0, 279, 0, 17)

						labelText.Name = "labelText"
						labelText.Parent = Label
						labelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						labelText.BackgroundTransparency = 1.000
						labelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
						labelText.BorderSizePixel = 0
						labelText.Position = UDim2.new(0, 0, 0.0588235296, 0)
						labelText.Size = UDim2.new(0, 279, 0, 15)
						labelText.Font = Enum.Font.Jura
						labelText.TextColor3 = Color3.fromRGB(255, 255, 255)
						labelText.TextSize = 14.000
						labelText.TextXAlignment = Enum.TextXAlignment.Left
						labelText.Text = option.text
						labelText.RichText = option.rich

						UIListLayout.Parent = Label
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				
						local UpdateSection = SectionSize(UILLSubSection)
						SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)
						
						return option;
					end
					
					function Utilities:AddSlider(option)
						option = typeof(option) == "table" and option or {}
						option.text = option.text or "New Slider"
						option.min = option.min or 0
						option.max = option.max  or 100
						option.value = option.value or 0
						option.flag = option.flag or option.text
						option.float = typeof(option.float) == "number" and option.float or 0
						option.suffix = option.suffix or ""
						option.callback = option.callback or function() end
						
						local Slider = Instance.new("Frame")
						local SliderText = Instance.new("TextLabel")
						local btnSlider = Instance.new("TextButton")
						local frameSlider = Instance.new("Frame")
						local UIGradient = Instance.new("UIGradient")
						local UIGradient_2 = Instance.new("UIGradient")
						local ignoreSlider = Instance.new("Folder")
						local ignoreSliderValue = Instance.new("TextLabel")
						local UILLignoreSlider = Instance.new("UIListLayout")
						local UILLSlider = Instance.new("UIListLayout")

						Slider.Name = "Slider"
						Slider.Parent = SectionBG
						Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Slider.BackgroundTransparency = 1.000
						Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Slider.BorderSizePixel = 0
						Slider.Position = UDim2.new(0.0271186437, 0, 0.30343008, 0)
						Slider.Size = UDim2.new(0, 279, 0, 37)

						SliderText.Name = "SliderText"
						SliderText.Parent = Slider
						SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SliderText.BackgroundTransparency = 1.000
						SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
						SliderText.BorderSizePixel = 0
						SliderText.Position = UDim2.new(0, 0, -0.0105882343, 0)
						SliderText.Size = UDim2.new(0, 180, 0, 16)
						SliderText.Font = Enum.Font.Jura
						SliderText.Text = "Silly you"
						SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
						SliderText.TextSize = 14.000
						SliderText.TextXAlignment = Enum.TextXAlignment.Left

						btnSlider.Name = "btnSlider"
						btnSlider.Parent = Slider
						btnSlider.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
						btnSlider.BorderColor3 = Color3.fromRGB(36, 36, 50)
						btnSlider.BorderSizePixel = 0
						btnSlider.Position = UDim2.new(0, 0, 0.545452416, 0)
						btnSlider.Size = UDim2.new(0, 279, 0, 15)
						btnSlider.AutoButtonColor = false
						btnSlider.Font = Enum.Font.SourceSans
						btnSlider.Text = ""
						btnSlider.TextColor3 = Color3.fromRGB(0, 0, 0)
						btnSlider.TextSize = 14.000

						frameSlider.Name = "frameSlider"
						frameSlider.Parent = btnSlider
						frameSlider.BackgroundColor3 = Library.Theme.Accent
						frameSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)
						frameSlider.BorderSizePixel = 0
						frameSlider.Size = UDim2.new(0, 100, 0, 15)

						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(186, 186, 186))}
						UIGradient.Rotation = 90
						UIGradient.Parent = frameSlider

						UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(214, 214, 214))}
						UIGradient_2.Rotation = 90
						UIGradient_2.Parent = btnSlider

						ignoreSlider.Name = "ignoreSlider"
						ignoreSlider.Parent = Slider

						ignoreSliderValue.Name = "ignoreSliderValue"
						ignoreSliderValue.Parent = ignoreSlider
						ignoreSliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ignoreSliderValue.BackgroundTransparency = 1.000
						ignoreSliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
						ignoreSliderValue.BorderSizePixel = 0
						ignoreSliderValue.Position = UDim2.new(0.815412164, 0, 0, 0)
						ignoreSliderValue.Size = UDim2.new(0, 51, 0, 15)
						ignoreSliderValue.Font = Enum.Font.Jura
						ignoreSliderValue.Text = "128"
						ignoreSliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
						ignoreSliderValue.TextSize = 14.000
						ignoreSliderValue.TextXAlignment = Enum.TextXAlignment.Right

						UILLignoreSlider.Name = "UILLignoreSlider"
						UILLignoreSlider.Parent = ignoreSlider
						UILLignoreSlider.FillDirection = Enum.FillDirection.Horizontal
						UILLignoreSlider.HorizontalAlignment = Enum.HorizontalAlignment.Right
						UILLignoreSlider.SortOrder = Enum.SortOrder.LayoutOrder

						UILLSlider.Name = "UILLSlider"
						UILLSlider.Parent = Slider
						UILLSlider.SortOrder = Enum.SortOrder.LayoutOrder					
						UILLSlider.Padding = UDim.new(0, 4)
						
						local UISbtnSlider = Instance.new("UIStroke")
						UISbtnSlider.Color = Library.Theme.Border
						UISbtnSlider.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
						UISbtnSlider.Parent = btnSlider
						
						if option.text == "nil" then
							Slider.Size = UDim2.new(0, Slider.Size.X.Offset, 0 , 17)
							SliderText:Destroy()
							Slider:FindFirstChildWhichIsA("UIListLayout").VerticalAlignment = Enum.VerticalAlignment.Center
						end
						
						
						local dragging = false
						local Mouse = game.Players.LocalPlayer:GetMouse()
						
						if option.value > option.max then
							option.value = option.max
							frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
							ignoreSliderValue.Text = option.value..option.suffix
						elseif option.value < option.min then
							option.value = option.min
							frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
							ignoreSliderValue.Text = option.value..option.suffix
						else
							option.value = option.value
							frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
							ignoreSliderValue.Text = option.value..option.suffix
						end
						option.callback(option.value)
						
						frameSlider.Size = UDim2.new(0, math.floor(((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5) * 100) / 100, 0, 15)

						ignoreSliderValue.Text = option.value..option.suffix
						option.callback(option.value)
						
						local UIS = game:GetService("UserInputService")

						
						btnSlider.MouseButton1Down:Connect(function()
							dragging = true
							frameSlider.Size = UDim2.new(0, math.clamp(Mouse.X - frameSlider.AbsolutePosition.X, 0, 279), 0, 15)
							option.value = tonumber(string.format("%."..option.float.."f", (((tonumber(option.max) - tonumber(option.min)) / 279) * frameSlider.AbsoluteSize.X) + tonumber(option.min)))
							ignoreSliderValue.Text = option.value .. option.suffix
							option.callback(option.value)
							moveconnection = Mouse.Move:Connect(function()
								frameSlider.Size = UDim2.new(0, math.clamp(Mouse.X - frameSlider.AbsolutePosition.X, 0, 279), 0, 15)

								local valueIncrement = (tonumber(option.max) - tonumber(option.min))
								option.value = tonumber(string.format("%."..option.float.."f", (((valueIncrement) / 279) * frameSlider.AbsoluteSize.X) + tonumber(option.min)))
								ignoreSliderValue.Text = option.value .. option.suffix

								btnSlider.BorderColor3 = Library.Theme.Accent

								pcall(function()
									option.callback(option.value)
								end)
								Library.Flags[option.flag] = option.value
							end)
							UISbtnSlider.Color = Library.Theme.Accent

							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(m)
								if m.UserInputType == Enum.UserInputType.MouseButton1 then
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
									dragging = false
									if Mouse.X >= btnSlider.AbsolutePosition.X and Mouse.X <= btnSlider.AbsolutePosition.X + btnSlider.AbsoluteSize.X and
										Mouse.Y >= btnSlider.AbsolutePosition.Y and Mouse.Y <= btnSlider.AbsolutePosition.Y + btnSlider.AbsoluteSize.Y then
										UISbtnSlider.Color = Library.Theme.Accent
									else
										UISbtnSlider.Color = Library.Theme.Border
									end
									option.callback(option.value)
									Library.Flags[option.flag] = option.value
								end
							end)
						end)



						
						btnSlider.MouseEnter:Connect(function()
							UISbtnSlider.Color = Library.Theme.Accent
						end)
						btnSlider.MouseLeave:Connect(function()
							if not dragging then
								UISbtnSlider.Color = Library.Theme.Border
							end
						end)
						
						if option.flag and option.flag ~= "" then
							Library.Flags[option.flag] = option.state
							Library.Items[option.flag] = option
						end
						
						function option:SetValue(int)
							if int > option.max then
								option.value = option.max
								frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
								ignoreSliderValue.Text = option.value..option.suffix
							elseif int < option.min then
								option.value = option.min
								frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
								ignoreSliderValue.Text = option.value..option.suffix
							else
								option.value = int
								frameSlider.Size =  UDim2.new(0, math.floor((((option.value - option.min) / (option.max - option.min)) * 279) + 0.5), 0, 15)
								ignoreSliderValue.Text = option.value..option.suffix
							end
							option.callback(option.value)
							Library.Flags[option.flag] = option.value
						end
						
						local UpdateSection = SectionSize(UILLSubSection)
						SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)

						return option;
						
					end
					
					function Utilities:AddDropdown(option)
						option = typeof(option) == "table" and option or {}
						option.text = option.text or "nil"
						option.multi = option.multi or false
						option.value = typeof(option.value) == "table" and option.value or option.value or ""
						option.values = typeof(option.values) == "table" and option.values or {}
						option.flag = option.flag or option.text or "DDYDR"
						option.callback = option.callback or function() end
						
						local selected = {}

						local Dropdown = Instance.new("Frame")
						local DD = Instance.new("TextLabel")
						local btnDD = Instance.new("TextButton")
						local UIGradient = Instance.new("UIGradient")
						local UIPadding = Instance.new("UIPadding")
						local UILLSlider = Instance.new("UIListLayout")
						local ignoreDropdown = Instance.new("Folder")
						local D = Instance.new("Frame")
						local UIGradient_2 = Instance.new("UIGradient")
						local SDD = Instance.new("ScrollingFrame")
						local UIListLayout = Instance.new("UIListLayout")
			
						local UIListLayout_2 = Instance.new("UIListLayout")

						--Properties:

						Dropdown.Name = "Dropdown"
						Dropdown.Parent = SectionBG
						Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Dropdown.BackgroundTransparency = 1.000
						Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Dropdown.BorderSizePixel = 0
						Dropdown.Position = UDim2.new(0.0271186437, 0, 0.715053737, 0)
						Dropdown.Size = UDim2.new(0, 279, 0, 37)

						DD.Name = "DD"
						DD.Parent = Dropdown
						DD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						DD.BackgroundTransparency = 1.000
						DD.BorderColor3 = Color3.fromRGB(0, 0, 0)
						DD.BorderSizePixel = 0
						DD.Position = UDim2.new(0, 0, -0.0105882343, 0)
						DD.Size = UDim2.new(0, 180, 0, 16)
						DD.Font = Enum.Font.Jura
						DD.Text = option.text
						DD.TextColor3 = Color3.fromRGB(255, 255, 255)
						DD.TextSize = 14.000
						DD.TextXAlignment = Enum.TextXAlignment.Left

						btnDD.Name = "btnDD"
						btnDD.Parent = Dropdown
						btnDD.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
						btnDD.BorderColor3 = Color3.fromRGB(36, 36, 50)
						btnDD.BorderSizePixel = 0
						btnDD.Position = UDim2.new(0, 0, 0.465116292, 0)
						btnDD.Size = UDim2.new(0, 279, 0, 18)
						btnDD.AutoButtonColor = false
						btnDD.Font = Enum.Font.Jura
						btnDD.Text = "<Value>"
						btnDD.TextColor3 = Color3.fromRGB(255, 255, 255)
						btnDD.TextSize = 14.000
						btnDD.TextXAlignment = Enum.TextXAlignment.Left

						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(214, 214, 214))}
						UIGradient.Rotation = 90
						UIGradient.Parent = btnDD

						UIPadding.Parent = btnDD
						UIPadding.PaddingLeft = UDim.new(0, 5)

						UILLSlider.Name = "UILLSlider"
						UILLSlider.Parent = Dropdown
						UILLSlider.SortOrder = Enum.SortOrder.LayoutOrder
						UILLSlider.Padding = UDim.new(0, 4)

						ignoreDropdown.Name = "ignoreDropdown"
						ignoreDropdown.Parent = Dropdown

						D.Name = "DD"
						D.Parent = ignoreDropdown
						D.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
						D.BorderColor3 = Color3.fromRGB(0, 0, 0)
						D.BorderSizePixel = 0
						D.Position = UDim2.new(0, 0, 1.10000002, 0)
						D.Size = UDim2.new(0, 279, 0, 18)
						D.Visible = false
						D.ZIndex = 1000

						UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(214, 214, 214))}
						UIGradient_2.Rotation = 90
						UIGradient_2.Parent = D

						SDD.Name = "SDD"
						SDD.Parent = D
						SDD.Active = true
						SDD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						SDD.BackgroundTransparency = 1.000
						SDD.BorderColor3 = Color3.fromRGB(0, 0, 0)
						SDD.BorderSizePixel = 0
						SDD.Size = UDim2.new(0, 279, 0, 18)
						SDD.CanvasSize = UDim2.new(0, 0, 0, 0)
						SDD.ScrollBarThickness = 0
						SDD.ZIndex = 1001

						UIListLayout.Parent = SDD
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder


						UIListLayout_2.Parent = D
						UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
						
						local UIS1 = Instance.new("UIStroke")
						local UIS2 = Instance.new("UIStroke")
						UIS2.Parent = D
						UIS2.Color = Color3.fromRGB(36, 36, 50)
						UIS2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
						
						UIS1.Parent = btnDD	
						UIS1.Color = Color3.fromRGB(36, 36, 50)
						UIS1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
						
						local DropdownVal = Instance.new("BoolValue")
						DropdownVal.Value = false
						DropdownVal.Name = "OpenedVal"
						DropdownVal.Parent = D
						
						if option.text == "nil" then
							Dropdown.Size = UDim2.new(0, Dropdown.Size.X.Offset, 0 , 20)
							DD:Destroy()
							Dropdown:FindFirstChildWhichIsA("UIListLayout").VerticalAlignment = Enum.VerticalAlignment.Center
						end
						
						local dropped = false
						
						btnDD.MouseButton1Click:Connect(function()
							if DropdownVal.Value == true then
								D.Visible = false
								DropdownVal.Value = false
							else
								for i, v in pairs(GUI:GetDescendants()) do
									if v:IsA("BoolValue") and v.Name == "OpenedVal" then
										local downList = v.Parent
										local DD = downList.Parent.Parent
										downList.Visible = false
										DD.btnDD.UIStroke.Color = Color3.fromRGB(36, 36, 50)
										v.Value = false
									end
								end
								UIS1.Color = Library.Theme.Accent
								D.Visible = true
								DropdownVal.Value = true
							end
						end)
						
						btnDD.MouseEnter:Connect(function()
							UIS1.Color = Library.Theme.Accent
						end)
						
						btnDD.MouseLeave:Connect(function()
							if DropdownVal.Value == true then
								UIS1.Color = Library.Theme.Accent
							else
								UIS1.Color = Library.Theme.Border
							end
						end)
						
						if option.multi == true then
							local filteredSelected = {}
							local x, n = next(option.value)
							if next(option.value) ~= nil then
								if typeof(n) == "string" then
									if table.find(option.values, option.value) then
										for i, value in ipairs(option.values) do
											for m, l in ipairs(option.value) do
												if table.find(selected, value) then
													table.insert(filteredSelected, value)
												elseif value == l then
													table.insert(filteredSelected, value)
												end
											end
										end
									end
								elseif typeof(n) == "number" then
									if not (n < 1 or n > #option.values) then
										for i, value in ipairs(option.values) do
											for m, l in ipairs(option.value) do
												if table.find(selected, value) then
													table.insert(filteredSelected, value)
												elseif i == l then
													table.insert(filteredSelected, value)
												end
											end
										end
									end
								end
							else
								option.value = table.unpack(option.value, 1, #option.value)
							end
							selected = filteredSelected
							option.value = selected
							btnDD.Text = table.concat(selected, ", ")
						else
							if typeof(option.value) == "number" then
								if not (option.value < 0 or option.value > #option.values) then
									for i, value in pairs(option.values) do
										if i == option.value then
											option.value = value
										end
									end
								end
							end
							btnDD.Text = tostring(option.value)
						end
						
						local Index = #option.values
						D.Size = UDim2.new(0, 279, 0, (Index * 18))
						SDD.Size = UDim2.new(0, 279, 0, (Index * 18))
						
						for i, v in pairs(option.values) do
							local DDV = Instance.new("TextButton")
							DDV.Name = "DDV"
							DDV.Parent = SDD
							DDV.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							DDV.BackgroundTransparency = 1.000
							DDV.BorderColor3 = Color3.fromRGB(0, 0, 0)
							DDV.BorderSizePixel = 0
							DDV.Position = UDim2.new(-0.00358422939, 0, 0, 0)
							DDV.Size = UDim2.new(0, 279, 0, 18)
							DDV.Font = Enum.Font.Jura
							DDV.Text = tostring(v)
							DDV.TextColor3 = Library.Theme.Focused
							DDV.TextSize = 14.000
							DDV.ZIndex = 1002
							if option.multi == true then
								for k, a in pairs(selected) do
									if v == a then
										DDV.TextColor3 = Library.Theme.Accent
									end
								end
							else
								for k, a in pairs(DDV.Parent:GetChildren()) do
									if a:IsA("TextButton") then
										if option.value == a.Text then
											a.TextColor3 = Library.Theme.Accent
										end
									end
								end
							end
							
							DDV.MouseButton1Click:Connect(function()
								if option.multi == true then
									local filteredSelected = {}
									local selectedIndex = table.find(option.values, DDV.Text)
									if table.find(selected, DDV.Text) then
										if #selected > 1 then
											for i, value in ipairs(selected) do
												if value == DDV.Text then
													table.remove(selected, i)
													break
												end
											end
											DDV.TextColor3 = Library.Theme.Focused
										end
									elseif not table.find(selected, DDV.Text) then
										for i, value in ipairs(option.values) do
											if table.find(selected, value) then
												table.insert(filteredSelected, value)
											elseif value == DDV.Text then
												table.insert(filteredSelected, value)
											end
										end
										selected = filteredSelected
										option.value = selected
										DDV.TextColor3 = Library.Theme.Accent
									end
									option.callback(option.value)
									btnDD.Text = table.concat(selected, ", ")
									Library.Flags[option.flag] = option.value
								else
									option.value = v
									btnDD.Text = v
									option.callback(option.value)
									for k, a in pairs(DDV.Parent:GetChildren()) do
										if a:IsA("TextButton") then
											a.TextColor3 = Library.Theme.Focused
										end
									end
									DDV.TextColor3 = Library.Theme.Accent
									Library.Flags[option.flag] = option.value
									D.Visible = false
									DropdownVal.Value = false
									UIS1.Color = Library.Theme.Border
								end
							end)
							
							
						end
						
						if option.flag and option.flag ~= "" then
							Library.Flags[option.flag] = option.value
							Library.Items[option.flag] = option
						end
						
						
						local UpdateSection = SectionSize(UILLSubSection)
						SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)
						
						return option;
						
					end
					
					function Utilities:AddTextbox(option)
						option = typeof(option) == "table" and option or {}
						option.text = option.text or "nil"
						option.placeholder = option.placeholder or "Value"
						option.value = option.value or ""
						option.clearonfocus = option.clearonfocus or false
						option.flag = option.flag or option.text or option.value or option.placeholder
						option.callback = option.callback or function() end

						local Textbox = Instance.new("Frame")
						local DD = Instance.new("TextLabel")
						local UILLSlider = Instance.new("UIListLayout")
						local box = Instance.new("Frame")
						local txt = Instance.new("TextBox")
						local UIPadding = Instance.new("UIPadding")
						local UIGradient = Instance.new("UIGradient")
						local UIS1 = Instance.new("UIStroke")

						Textbox.Name = "Textbox"
						Textbox.Parent = SectionBG
						Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Textbox.BackgroundTransparency = 1.000
						Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Textbox.BorderSizePixel = 0
						Textbox.Position = UDim2.new(0.0271186437, 0, 0.715053737, 0)
						Textbox.Size = UDim2.new(0, 279, 0, 37)

						DD.Name = "DD"
						DD.Parent = Textbox
						DD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						DD.BackgroundTransparency = 1.000
						DD.BorderColor3 = Color3.fromRGB(0, 0, 0)
						DD.BorderSizePixel = 0
						DD.Position = UDim2.new(0, 0, -0.0105882343, 0)
						DD.Size = UDim2.new(0, 180, 0, 16)
						DD.Font = Enum.Font.Jura
						DD.Text = option.text
						DD.TextColor3 = Color3.fromRGB(255, 255, 255)
						DD.TextSize = 14.000
						DD.TextXAlignment = Enum.TextXAlignment.Left

						UILLSlider.Name = "UILLSlider"
						UILLSlider.Parent = Textbox
						UILLSlider.SortOrder = Enum.SortOrder.LayoutOrder
						UILLSlider.Padding = UDim.new(0, 4)

						box.Name = "box"
						box.Parent = Textbox
						box.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
						box.BorderColor3 = Color3.fromRGB(0, 0, 0)
						box.BorderSizePixel = 0
						box.Size = UDim2.new(0, 279, 0, 18)

						txt.Name = "txt"
						txt.Parent = box
						txt.BackgroundColor3 = Color3.fromRGB(18, 18, 27)
						txt.BackgroundTransparency = 1.000
						txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
						txt.BorderSizePixel = 0
						txt.Size = UDim2.new(0, 279, 0, 18)
						txt.ClearTextOnFocus = false
						txt.Font = Enum.Font.Jura
						txt.Text = tostring(option.value)
						txt.TextColor3 = Color3.fromRGB(255, 255, 255)
						txt.TextSize = 14.000
						txt.TextXAlignment = Enum.TextXAlignment.Left
						txt.PlaceholderText = option.placeholder
						txt.PlaceholderColor3 = Library.Theme.NotFocused
						txt.ClearTextOnFocus = typeof(option.clearonfocus) == "boolean" and option.clearonfocus or false

						UIPadding.Parent = txt
						UIPadding.PaddingLeft = UDim.new(0, 5)

						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(214, 214, 214))}
						UIGradient.Rotation = 90
						UIGradient.Parent = box
						
						UIS1.Parent = box
						UIS1.Color = Color3.fromRGB(36, 36, 50)
						UIS1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
						
						if option.text == "nil" then
							Textbox.Size = UDim2.new(0, Textbox.Size.X.Offset, 0, 20)
							Textbox:FindFirstChildWhichIsA("UIListLayout").VerticalAlignment = Enum.VerticalAlignment.Center
							DD:Destroy()
						end
						
						local down = false
						
						game:GetService("UserInputService").InputBegan:Connect(function(input) if input.KeyCode == Enum.KeyCode.Return then  down = true end end)

						game:GetService("UserInputService").InputEnded:Connect(function(input) if input.KeyCode == Enum.KeyCode.Return then  down = false  end end)

						txt.FocusLost:Connect(function()
							task.wait()
							if down then 
								option.value = txt.Text
								option.callback(option.value)
								Library.Flags[option.flag] = option.value
							end 
						end)
						
						if option.flag and option.flag ~= "" then
							Library.Flags[option.flag] = option.value
							Library.Items[option.flag] = option
						end
						
						option.callback(option.value)

						local UpdateSection = SectionSize(UILLSubSection)
						SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)
						
						function option:SetValue(str)
							option.value = tostring(str)
							txt.Text = option.value
							Library.Flags[option.flag] = option.value
						end
						
						return option;
					end
					
					function Utilities:AddSpace(int)
						int = typeof(int) == "number" and int or 1
						
						local Space = Instance.new("Frame")

						Space.Name = "Space"
						Space.Parent = SectionBG
						Space.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Space.BackgroundTransparency = 1.000
						Space.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Space.BorderSizePixel = 0
						Space.Position = UDim2.new(0.0271186437, 0, 0.662269115, 0)
						Space.Size = UDim2.new(0, 279, 0, int)
						
						local UpdateSection = SectionSize(UILLSubSection)
						SectionBG.Size = UDim2.new(0, SectionBG.Size.X.Offset, 0, UpdateSection + 10 + UIPSubSection.PaddingTop.Offset)
					end
					
					return Utilities;
					
				end
				
				return SubSection;
				
			end
			
			return SectionHandler;
			
		end
		
		return TabHandler;
	end
	
	return Window;
	
end

return Library;


