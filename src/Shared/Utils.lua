-- Utils.lua

local Utils = {}

-- Function to respawn player
function Utils.respawnPlayer(player)
    -- Respawn logic
    local spawnLocation = game:GetService("Workspace"):WaitForChild("SpawnLocation")
    player:LoadCharacter()
    player.Character:MoveTo(spawnLocation.Position)
end

-- Function to set up character
function Utils.setupCharacter(player, character)
    -- Set up character properties and controls
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = Constants.PLAYER_SPEED
    
    -- Add controls for player
    -- Example: Add a script to handle player input
end

-- Function to set up titan
function Utils.setupTitan(player, character)
    -- Set up titan properties and controls
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = Constants.TITAN_SPEED
    
    -- Add controls for titan
    -- Example: Add a script to handle titan input
end

-- Function to clean up player data
function Utils.cleanupPlayer(player)
    -- Clean up player data
end

-- Function to clean up titan data
function Utils.cleanupTitan(player)
    -- Clean up titan data
end

return Utils