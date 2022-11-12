--[[ services ]]--
local Players, Teams = game:GetService("Players"), game:GetService("Teams")

--[[ variables ]]--
-- The group ID of the group the AutoTeam will be assigned to.
local groupId: number = 15853255

-- The default team that a new player will be assigned to.
local defaultTeam: Team = Teams.Member

-- [ functions ] --
Players.PlayerAdded:Connect(function(player: Player)
    -- Grabs a String from the group to get the player's role in the group.
    local rank: string = player:GetRoleInGroup(groupId)

    -- Assigns them their role if its found, and if not, they are defaulted to defaultTeam.
    player.Team = if rank == "Guest" or not Teams[rank] then defaultTeam else Teams[rank]
end)