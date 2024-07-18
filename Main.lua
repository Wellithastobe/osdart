wait(5)

-- Define the Game Pass ID and get the game's owner UserId
local gamePassId = 852123482  -- Replace with your actual Game Pass ID
local ownerId = game.CreatorId

-- Get the Players service
local Players = game:GetService("MarketplaceService")

-- Check if the owner owns the Game Pass
local success, result = pcall(function()
	return Players:UserOwnsGamePassAsync(ownerId, gamePassId)
end)

-- Print the result
if success then
	if result then
		local SettingsModule = script.Parent.Parent.Parent.Settings
		local Settings = require(SettingsModule)
		local buttons = script.Parent.Parent.Buttons

		local Players = game:GetService("Players")
		local GroupService = game:GetService("GroupService")
		local GamePassService = game:GetService("GamePassService")
		local ui = script.Parent.Parent.Build.Model.Screen.SurfaceGui
		local vol = 0
		local power = false  -- Variable to track the power status

		buttons.PowerButton.TOUCH.ClickDetector.MaxActivationDistance = 32

		buttons.VolUp.Touch.ClickDetector.MouseClick:Connect(function()
			if power and vol < 10 then
				if ui.vol.Visible == true then
					return
				else
					vol = vol + 1  -- Increment the volume if it's less than 10
					ui.vol.TextLabel.Text = tostring(vol)  -- Update the TextLabel with the new volume
					ui.vol.Visible = true
					ui.Parent.Speaker.SoundId = "rbxassetid://7433801607"
					ui.Parent.Speaker:Play()
					wait(1)
					ui.vol.Visible = false
				end
			end
		end)

		buttons.VolDown.TOUCH.ClickDetector.MouseClick:Connect(function()
			if power and vol > 0 then
				if ui.vol.Visible == true then
					return
				else
					vol = vol - 1  -- Decrement the volume if it's more than 0
					ui.vol.TextLabel.Text = tostring(vol)  -- Update the TextLabel with the new volume
					ui.vol.Visible = true
					ui.Parent.Speaker.SoundId = "rbxassetid://7433801607"
					ui.Parent.Speaker:Play()
					wait(1)
					ui.vol.Visible = false
				end
			end
		end)

		-- STARTS
		----------------------------------------------------------------------------------
		function TEST()
			print("This Board Has A Error And Entered Test Mode || Board Name : " .. Settings["BoardName"])
		end

		-----------------------------------------------------------------------------------
		function StartBoard()
			print("This Board Is Loading | Enjoy OSDART | Board name: " .. Settings["BoardName"])
			buttons.PowerButton.TOUCH.ClickDetector.MaxActivationDistance = 0
			buttons.VolUp.Touch.ClickDetector.MaxActivationDistance = 0
			buttons.VolDown.TOUCH.ClickDetector.MaxActivationDistance = 0
			buttons.PowerButton.Glow.Color = Color3.fromRGB(30, 255, 67)

			wait(1)
			ui.Loading.Visible = true

			ui.Parent.Speaker.SoundId = "rbxassetid://1841975115"
			ui.Parent.Speaker:Play()

			wait(5)
			ui.Loading.Visible = false
			ui.apps.Visible = true
			buttons.VolUp.Touch.ClickDetector.MaxActivationDistance = 32
			buttons.VolDown.TOUCH.ClickDetector.MaxActivationDistance = 32
			buttons.VolUp.Glow.Color = Color3.fromRGB(30, 255, 67)
			buttons.VolDown.Glow.Color = Color3.fromRGB(30, 255, 67)

			buttons.PowerButton.TOUCH.ClickDetector.MaxActivationDistance = 32

			power = true  -- Set power to true when the board is started
		end

		-----------------------------------------------------------------------------------
		function StopBoard()
			print("Turning off the board")
			ui.apps.Visible = false
			buttons.PowerButton.Glow.Color = Color3.fromRGB(255, 0, 4)
			buttons.VolUp.Touch.ClickDetector.MaxActivationDistance = 0
			buttons.VolDown.TOUCH.ClickDetector.MaxActivationDistance = 0
			power = false  -- Set power to false when turning off
		end

		-----------------------------------------------------------------------------------
		function Checks()
			if Settings["PoweredOnStart"] == false then
				wait(0)
				print("PowerOnStart -- False")
				buttons.PowerButton.TOUCH.ClickDetector.MaxActivationDistance = 32
				buttons.PowerButton.TOUCH.ClickDetector.MouseClick:Connect(function()
					if power == false then
						StartBoard()
					else
						StopBoard()
					end

					if Settings["TestMode"] == true then
						TEST()
					end

				end)
			else
				print("PowerOnStart -- True Board Starting")
				wait(3)
				StartBoard()

				if Settings["TestMode"] == true then
					TEST()
				end

				print("--------------------------------------------------------------")
				print("--------------------------------------------------------------")
			end
		end

		-----------------------------------------------------------------------------------

		-- Call the animateSwipeUp function to start the animation

		print("OsDart || Loading")
		print("OsDart || Loading Success")
		Checks()

		local TextLabel = ui.apps.apps.TIME  -- Assuming TIME is the name of your TextLabel
		local Players = game:GetService("Players")

		-- Function to update the TextLabel with player's local time and server time
		local function updateTimes()
			-- Get player's local time
			local player = Players.LocalPlayer
			local playerLocalTime = os.time()
			local formattedPlayerTime = os.date("%H:%M", playerLocalTime)

			-- Get server time
			local serverTime = os.time(os.date("!*t"))
			local formattedServerTime = os.date("%H:%M", serverTime)

			-- Update the TextLabel text with both times
			TextLabel.Text = formattedServerTime
		end

		-- Call the updateTimes function to set the initial text
		updateTimes()

		-- Update the times periodically
		while true do
			wait(1)  -- Update every second (adjust as needed)
			updateTimes()
		end
	else
		script.Parent.Parent.Parent.MAINS.Build.Model.Screen.Speaker.SoundId = "rbxassetid://136075117"
		script.Parent.Parent.Parent.MAINS.Build.Model.Screen.Speaker.Looped = true
		script.Parent.Parent.Parent.MAINS.Build.Model.Screen.Speaker:Play()
		script.Parent:Destroy()

		-- Gui to Lua
		-- Version: 3.2

		-- Instances:

		local Nowhitelist = Instance.new("Frame")
		local UIGradient = Instance.new("UIGradient")
		local TextLabel = Instance.new("TextLabel")
		local TextLabel_2 = Instance.new("TextLabel")

		--Properties:

		Nowhitelist.Name = "Nowhitelist"
		Nowhitelist.Parent = game.Workspace["OsDart Board|| Clone me Only"].MAINS.Build.Model.Screen.SurfaceGui
		Nowhitelist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Nowhitelist.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Nowhitelist.BorderSizePixel = 0
		Nowhitelist.Size = UDim2.new(0, 919, 0, 538)
		Nowhitelist.Visible = true

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 156, 158)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 57, 43))}
		UIGradient.Offset = Vector2.new(0.100000001, 0.100000001)
		UIGradient.Rotation = -131
		UIGradient.Parent = Nowhitelist

		TextLabel.Parent = Nowhitelist
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.390777767, 0, 0.062269982, 0)
		TextLabel.Size = UDim2.new(0, 200, 0, 50)
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Text = "OsDart"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 100.000

		TextLabel_2.Parent = Nowhitelist
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_2.BorderSizePixel = 0
		TextLabel_2.Position = UDim2.new(0.193824545, 0, 0.303905666, 0)
		TextLabel_2.Size = UDim2.new(0, 591, 0, 230)
		TextLabel_2.Font = Enum.Font.SourceSansBold
		TextLabel_2.Text = "Oh no Looks like you do not own this product :("
		TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.TextScaled = true
		TextLabel_2.TextSize = 100.000
		TextLabel_2.TextWrapped = true
	end
else
	warn("Failed to check Game Pass ownership: " .. tostring(result))
end
