local function billboard(child, name, name2, name3)
    local billboard_gui = Instance.new("BillboardGui")
    billboard_gui.Active = true
    billboard_gui.AlwaysOnTop = true
    billboard_gui.ClipsDescendants = true
    billboard_gui.LightInfluence = 9e9
    billboard_gui.Size = UDim2.new(1.75, 0, 1.25, 0)
    billboard_gui.ResetOnSpawn = true
    billboard_gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    billboard_gui.Parent = child
    billboard_gui.Name = "KiwiHighlight"
    if name2 then
        billboard_gui.Name = "KiwiHighlight_2"
    end
    if name3 then
        billboard_gui.Name = "KiwiHighlight_3"
    end

    local text_label = Instance.new("TextLabel")
    text_label.FontFace = Font.new("rbxasset://fonts/families/Oswald.json")
    text_label.Text = name
    text_label.TextColor3 = Color3.new(1, 1, 1)
    text_label.TextScaled = true
    text_label.TextSize = 14
    text_label.TextWrapped = true
    text_label.BackgroundColor3 = Color3.new(1, 1, 1)
    text_label.BackgroundTransparency = 9e9
    text_label.BorderColor3 = Color3.fromHSV(hue, 1, 1)
    text_label.BorderSizePixel = 9e9
    text_label.Size = UDim2.new(1, 0, 1, 0)
    text_label.Visible = true
    text_label.Parent = billboard_gui

    local uistroke = Instance.new("UIStroke")
    uistroke.Thickness = 1.5
    uistroke.Parent = text_label

    spawn(function()
        while task.wait() do
            local hue = tick() % 5 / 5
            local color = Color3.fromHSV(hue, 1, 1) 
            text_label.TextColor3 = color
        end
    end)
end

local function selection(child, name, name2, name3)
    billboard(child, name, name2, name3)
    local hi = Instance.new("Highlight")
    hi.Parent = child
    hi.Adornee = child
    hi.OutlineColor = Color3.fromRGB(161, 0, 0)
    hi.FillColor = Color3.fromRGB(255, 0, 0)
    hi.FillTransparency = 0.75
    hi.Name = "KiwiHighlight"
    if name2 then
        hi.Name = "KiwiHighlight_2"
    end
    if name3 then
        hi.Name = "KiwiHighlight_3"
    end
    if child:IsA("Part") then
        child.Color = Color3.fromRGB(0, 0, 0)
        child.Transparency = 0.85
    end
    spawn(function()
        while task.wait() do
            if hi then
                local hue = tick() % 5 / 5
                local color = Color3.fromHSV(hue, 1, 1) 
                hi.OutlineColor = color
                hi.FillColor = color
            end
        end
    end)
end


function checkDistance(part, extra)
    if not extra then extra = 15 end
    if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or not part then
        return false
    end
    local distanceToPart = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).magnitude
    if distanceToPart <= extra then
        return true
    end
    return false
end
local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local lolWindow = Library:CreateWindow({
    Title = "l∆l Hub ",
    Center = true,
    AutoShow = true,
    TabPadding = 5.5,
    MenuFadeTime = 0
})
local OMG1 = lolWindow:AddTab("Main")
local WTF1 = OMG1:AddLeftGroupbox("ESP")
WTF1:AddToggle("OtherESP",{
	Text = "Other ESP",
	Default = false,
	Tooltip = "ESP Misc Help You",
	Callback = function(Value)
		if Value then
			for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
				-- // ESP DOOR 🚪 \\
if v:IsA("BasePart") and v.Name == "Door" and v.Parent.Name == "Door" then
selection(v,"Door",true)
-- // ESP KEY 🔑 \\
elseif v:IsA("Model") and v.Name == "KeyObtain" then
selection(v,"Key",true)
-- // Timer Lever ⏳ \\
elseif v:IsA("Model") and v.Name == "TimerLever" then
selection(v,"TimerLever",true)
-- // Lever 🪟 \\
elseif v:IsA("Model") and v.Name == "LeverForGate" then
selection(v,"Lever",true)
-- // ESP CLOSET 🗄️ \\
elseif v:IsA("Model") and v.Name == "Backdoor_Wardrobe" then
selection(v,"Closet",true)
elseif v:IsA("Model") and v.Name == "Wardrobe" then
selection(v,"Closet",true)
elseif v:IsA("Model") and v.Name == "RetroWardrobe" then
selection(v,"Closet",true)
				end
			end
			OtherESP = workspace.CurrentRooms.ChildAdded:Connect(function(child)
				task.wait(1)
				for _, v in pairs(child:GetDescendants()) do
                -- // ESP DOOR 🚪 \\
if v:IsA("BasePart") and v.Name == "Door" and v.Parent.Name == "Door" then
selection(v,"Door",true)
-- // ESP KEY 🔑 \\
elseif v:IsA("Model") and v.Name == "KeyObtain" then
selection(v,"Key",true)
-- // Timer Lever ⏳ \\
elseif v:IsA("Model") and v.Name == "TimerLever" then
selection(v,"TimerLever",true)
-- // Lever 🪟 \\
elseif v:IsA("Model") and v.Name == "LeverForGate" then
selection(v,"Lever",true)
-- // ESP CLOSET 🗄️ \\
elseif v:IsA("Model") and v.Name == "Backdoor_Wardrobe" then
selection(v,"Closet",true)
elseif v:IsA("Model") and v.Name == "Wardrobe" then
selection(v,"Closet",true)
elseif v:IsA("Model") and v.Name == "RetroWardrobe" then
selection(v,"Closet",true)
                    end
                end
			end)
		else
			OtherESP:Disconnect()
			for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
				if v.Name == "KiwiHighlight_2" then
					v:Destroy()
				end
			end
		end
	end,
})
WTF1:AddToggle("EntitiesESP",{
	Text = "Entities ESP",
	Default = false,
	Tooltip = "ESP Entities Help You",
	Callback = function(Value)
		if Value then
-- // ESP DOOR 🟥 \\
workspace.ChildAdded:Connect(function(child)
for _, v in pairs(child:GetDescendants()) do
	        -- // EYES ESP \\
             if child.Name == "Eyes" then
	       selection(child, "Eyes")
                -- // SEEK ESP \\
             elseif child.Name == "SeekMoving" then
               selection(child, "Seek")
                -- // RUSH ESP \\
             elseif child.Name == "RushMoving" and checkDistance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
	       selection(child:FindFirstChildWhichIsA("BasePart"), "Rush")
                -- // AMBUSH ESP \\
             elseif child.Name == "AmbushMoving" and checkDistance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
               selection(child:FindFirstChildWhichIsA("BasePart"), "Ambush")
                -- // FIGURE ESP \\
             elseif child.Name == "FigureRagdoll" then
               selection(child,"Figure")  
                -- // JEFF ESP \\
             elseif child.Name == "JeffTheKiller" then
               selection(child, "JeffTheKiller")
                -- // SEEK WALL ESP \\
             elseif child.Name == "ScaryWall" then
               selection(child, "")
		-- // DRAKOBLOXXER ESP \\
             elseif child.Name == "Drakobloxxer" then
               selection(child,"Drakobloxxer")
                -- // LAVA ESP \\
             elseif child.Name == "Lava" then
               selection(child,"")
	     elseif child.Name == "BackdoorLookman" then
	      if child then
		task.wait()
  child.Parent = game:GetService("Debris")
		   return
		end
		selection(child:WaitForChild("Core"), "Backdoor Lookman")
	      elseif child.Name == "BackdoorRush" then
		selection(child:WaitForChild("Main"), "Blitz")
                end
                
				end
			end)
			EntitiesESP = workspace.ChildAdded:Connect(function(child)
for _, v in pairs(child:GetDescendants()) do
	        -- // EYES ESP \\
             if child.Name == "Eyes" then
	       selection(child, "Eyes")
                -- // SEEK ESP \\
             elseif child.Name == "SeekMoving" then
               selection(child, "Seek")
                -- // RUSH ESP \\
             elseif child.Name == "RushMoving" and checkDistance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
	       selection(child:FindFirstChildWhichIsA("BasePart"), "Rush")
                -- // AMBUSH ESP \\
             elseif child.Name == "AmbushMoving" and checkDistance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
               selection(child:FindFirstChildWhichIsA("BasePart"), "Ambush")
                -- // FIGURE ESP \\
             elseif child.Name == "FigureRagdoll" then
               selection(child,"Figure")  
                -- // JEFF ESP \\
             elseif child.Name == "JeffTheKiller" then
               selection(child, "JeffTheKiller")
                -- // SEEK WALL ESP \\
             elseif child.Name == "ScaryWall" then
               selection(child, "")
		-- // DRAKOBLOXXER ESP \\
             elseif child.Name == "Drakobloxxer" then
               selection(child,"Drakobloxxer")
                -- // LAVA ESP \\
             elseif child.Name == "Lava" then
               selection(child,"")
	     elseif child.Name == "BackdoorLookman" then
	      if child then
		task.wait()
  child.Parent = game:GetService("Debris")
		   return
		end
		selection(child:WaitForChild("Core"), "Backdoor Lookman")
	      elseif child.Name == "BackdoorRush" then
		selection(child:WaitForChild("Main"), "Blitz")
                end
                
				end
			end)
		else
			EntitiesESP:Disconnect()
			for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
				if v.Name == "KiwiHighlight_2" then
					v:Destroy()
				end
			end
		end
	end,
})
