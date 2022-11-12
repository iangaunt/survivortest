-- [[ services ]] --
local DataStoreService, Players, RunService, ServerStorage = game:GetService("DataStoreService"), game:GetService("Players"), game:GetService("RunService"), game:GetService("ServerStorage")

-- [[ objects ]] --
-- The folder containing the objects that could be stored.
local Tools = ServerStorage.Tools

-- [[ variables ]] --
-- The DataStore containing inventory data.
local inventoryStore: DataStore = DataStoreService:GetDataStore("InventoryDataStore")

-- The dictionary for storing what item each player has out at any given time.
local playersHeldTool: {[number]: string} = {}

-- The blacklist for items that should not be saved when the player leaves.
local blacklist: {string} = {"Torch"}

-- [[ functions ]] --
-- Saves player data by storing tools into a table, and then pushing it to DataStore.
local function save(player)
    local success, error = pcall(function()
        local inventory: {string} = {}

        -- If the player had a held item, add it to the inventory.
        if playersHeldTool[player.UserId] then
            table.insert(inventory, playersHeldTool[player.UserId])
        end

        -- Adds every tool in the Player's backpack to their inventory table, unless it is on the blacklist.
        for _, tool: Tool in pairs (player.Backpack:GetChildren()) do
            if not table.find(blacklist, tool.Name) then
                table.insert(inventory, tool.Name)
            end
        end

        -- Pass the finalized table through to the DataStore.
        inventoryStore:SetAsync(player.UserId, inventory)
    end)
end

-- If a player joins the game, iterate through their data table and provide them their tools.
Players.PlayerAdded:Connect(function(player)
    local data = inventoryStore:GetAsync(player.UserId)
    print(data)

    if data then
        for _, tool: string in pairs (data) do
            Tools[tool]:Clone().Parent = player.Backpack
        end
    end

    -- Every frame, assign the player to their held item in the playersHeldTool dictionary.
    RunService.Heartbeat:Connect(function()
        if player.Character then
            local equippedTool = player.Character:FindFirstChildWhichIsA("Tool") or nil

            playersHeldTool[player.UserId] = if equippedTool then equippedTool.Name else nil
        end
    end)
end)

-- If a player leaves the game or the server crashes, save their data to the DataStore.
Players.PlayerRemoving:Connect(function(player)
	local success, error = save(player)

	if error then
        print(error)
        return error
	end
end)

game:BindToClose(function()
	for _, player in pairs (Players:GetPlayers()) do
		local success, error = save(player)

		if error then
			print(error)
			return error
		end
	end

	task.wait(2)
end)