local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

local EggHandle = {}
local LevelHandle = {}
local EnemyHandle = {}
local DummyHandle = {}

--game:GetService("Workspace").Levels.Level1.Level1Wall7.LVL
--game:GetService("Workspace").Eggs["Forest Egg"].HitBox

OrionLib:AddTable(game:GetService("Workspace").Eggs,EggHandle)
OrionLib:AddTable(game:GetService("Workspace").Levels,LevelHandle)

local function HandleGeneratedEnemyFolder(str)
    OrionLib:AddTable(game:GetService("Workspace").Levels[str],EnemyHandle)
end

local function HandleGeneratedDummyFolder(str)
    OrionLib:AddTable(game:GetService("Workspace").Targets[str],DummyHandle)
end

HandleGeneratedEnemyFolder(LevelHandle[1])
HandleGeneratedDummyFolder(LevelHandle[1])

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
Name = "Shoot & Train",
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

local ESelector = T2:AddDropdown({
  Name = "Select Enemy",
  Default = EnemyHandle[1],
  Options = EnemyHandle,
  Callback = function(Value)
    _G.AsyncEnemy = Value
  end    
})

local DSelector = T2:AddDropdown({
  Name = "Select Dummy [ Train ]",
  Default = DummyHandle[1],
  Options = DummyHandle,
  Callback = function(Value)
    _G.AsyncDummy = Value
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
                if variable2.Name == "LVL" then
                    game:GetService("ReplicatedStorage")["Remotes"]["Fire"]:FireServer(variable2.Position,_G.AsyncEnemy)
                end
            end)
         end)
      end
  end    
})
--game:GetService("Workspace").Targets.Level3.Target3_4.MeshPart
T2:AddToggle({
  Name = "Auto Train",
  Default = false,
  Callback = function(Value)
    _G.train = Value
      while wait() do
        if _G.train == false then break end
          child(game:GetService("Workspace").Targets[_G.AsyncLevel],function(index,variable)
            child(variable,function(index2,variable2)
                if variable2.Name == "MeshPart" then
                    game:GetService("ReplicatedStorage")["Remotes"]["Fire"]:FireServer(variable2.Position,_G.AsyncDummy)
                end
            end)
         end)
      end
  end    
})

T2:AddButton({
  Name = "Refresh Enemy & Dummy Selection",
  Callback = function()
      EnemyHandle = {}
      DummyHandle = {}
      ESelector:Refresh({"Refreshing.."},true)
      ESelector:Set("Refreshing..")
      DSelector:Refresh({"Refreshing.."},true)
      DSelector:Set("Refreshing..")
      wait(0.1)
      HandleGeneratedEnemyFolder(_G.AsyncLevel)
      HandleGeneratedDummyFolder(_G.AsyncLevel)
      wait(0.1)
      ESelector:Refresh(EnemyHandle,true)
      ESelector:Set(EnemyHandle[1])
      DSelector:Refresh(DummyHandle,true)
      DSelector:Set(DummyHandle[1])
  end    
})
