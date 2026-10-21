-- PlayerScript.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Constants = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Constants"))
local Utils = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Utils"))

local function onPlayerAdded(player)
    -- Initialize player properties
    player:SetAttribute("IsTitan", false)
    player:SetAttribute("Health", Constants.PLAYER_HEALTH)
    
    -- Handle player death
    local function onPlayerDeath()
        -- Respawn player
        Utils.respawnPlayer(player)
    end
    
    player.CharacterAdded:Connect(function(character)
        -- Set up character properties and controls
        Utils.setupCharacter(player, character)
        
        -- Connect death event
        character:WaitForChild("Humanoid").Died:Connect(onPlayerDeath)
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

-- Handle player removal
local function onPlayerRemoving(player)
    -- Clean up player data
    Utils.cleanupPlayer(player)
end

Players.PlayerRemoving:Connect(onPlayerRemoving)