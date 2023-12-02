local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

local EggHandle = {}
local LevelHandle = {}

--game:GetService("Workspace").Levels.Level1.Level1Wall7.LVL
--game:GetService("Workspace").Eggs["Forest Egg"].HitBox

OrionLib:AddTable(game:GetService("Workspace").Eggs,EggHandle)
OrionLib:AddTable(game:GetService("Workspace").Levels,LevelHandle)

local function child(str,func)
for i,v in pairs(str:GetChildren()) do
    func(i,v)
  end
end

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Shoot",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Hatch",
Icon = "rbxassetid://",
PremiumOnly = false
})

T3:AddDropdown({
  Name = "Select Egg",
  Default = EggHandle[1],
  Options = EggHandle,
  Callback = function(Value)
    _G.AsyncEggs = Value
  end    
})

T3:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(Value)
    _G.he = Value
      while wait() do
        if _G.he == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateEgg"]:FireServer("Single",_G.AsyncEggs)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Rebirth",
  Default = false,
  Callback = function(Value)
    _G.reb = Value
      while wait() do
        if _G.reb == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("Rebirth")
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Daily Gifts",
  Default = false,
  Callback = function(Value)
    _G.dgifts = Value
      while wait() do
        if _G.dgifts == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",1)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",2)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",3)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",4)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",5)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",6)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",7)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",8)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",9)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",10)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",11)
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("SessionClaim",12)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Daily Chest",
  Default = false,
  Callback = function(Value)
    _G.dchest = Value
      while wait() do
        if _G.dchest == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["DailyChest"]:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Spin",
  Default = false,
  Callback = function(Value)
    _G.spin = Value
      while wait() do
        if _G.spin == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["ReplicateGui"]:FireServer("ActivateSpin")
      end
  end    
})

T2:AddDropdown({
  Name = "Select Level",
  Default = LevelHandle[1],
  Options = LevelHandle,
  Callback = function(Value)
    _G.AsyncLevel = Value
  end    
})

T2:AddToggle({
  Name = "Auto Shoot",
  Default = false,
  Callback = function(Value)
    _G.s = Value
      while wait() do
        if _G.s == false then break end
          child(game:GetService("Workspace").Levels[_G.AsyncLevel],function(index,variable)
            child(variable,function(index2,variable2)
                if v.Name:FindFirstChild("LVL") or v.Name == "LVL" then
                    game:GetService("ReplicatedStorage")["Remotes"]["Fire"]:FireServer(variable2.Position,variable)
                end
            end)
         end)
      end
  end    
})
