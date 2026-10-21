-- TitanScript.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Constants = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Constants"))
local Utils = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Utils"))

local function onPlayerAdded(player)
    -- Check if player is a titan
    if player:GetAttribute("IsTitan") then
        -- Initialize titan properties
        player:SetAttribute("Health", Constants.TITAN_HEALTH)
        
        player.CharacterAdded:Connect(function(character)
            -- Set up titan properties and controls
            Utils.setupTitan(player, character)
        end)
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)

-- Handle titan removal
local function onPlayerRemoving(player)
    -- Clean up titan data
    if player:GetAttribute("IsTitan") then
        Utils.cleanupTitan(player)
    end
end

Players.PlayerRemoving:Connect(onPlayerRemoving)