local factoryStatic = require("statics.factoryInputs")

local function createOutsideStuff(surface)
    for _, direction in pairs(factoryStatic.directions) do
        local positions = factoryStatic.outdoorPos.positions[direction]
        -- reverse direction for belts as they need to go in
        local entityDirection = direction + 4
        if entityDirection >= 8 then entityDirection = entityDirection - 8 end
        for i = 1, 8, 1 do
            local offsetX = factoryStatic.outdoorPos.offsets[direction].x[i]
            local offsetY = factoryStatic.outdoorPos.offsets[direction].y[i]
            local position = { positions.chest[1]+offsetX, positions.chest[2]+offsetY }
            surface.create_entity{name="infinity-chest", position=position, force="player"}
        end
        for i = 1, 8, 1 do
            local offsetX = factoryStatic.outdoorPos.offsets[direction].x[i]
            local offsetY = factoryStatic.outdoorPos.offsets[direction].y[i]
            local position = { positions.loader[1]+offsetX, positions.loader[2]+offsetY }
            log(entityDirection)
            local entity = surface.create_entity{name="express-loader", position=position, force="player", type="output", direction=entityDirection}
        end
        for i = 1, 8, 1 do
            local offsetX = factoryStatic.outdoorPos.offsets[direction].x[i]
            local offsetY = factoryStatic.outdoorPos.offsets[direction].y[i]
            local position = { positions.belt[1]+offsetX, positions.belt[2]+offsetY }
            surface.create_entity{name="express-transport-belt", position=position, direction=entityDirection, force="player"}
        end
    end
end
local function createFactoryStuff(surface)
    -- for _, direction in pairs(factoryStatic.directions) do
    --     local positions = factoryStatic.indoorPos.positions[direction]
    --     -- reverse direction for belts as they need to go in
    --     local entityDirection = direction + 4
    --     if entityDirection >= 8 then entityDirection = entityDirection - 8 end
    --     for i = 1, 8, 1 do
    --         local offsetX = factoryStatic.indoorPos.offsets[direction].x[i]
    --         local offsetY = factoryStatic.indoorPos.offsets[direction].y[i]
    --         local position = { positions.belt[1]+offsetX, positions.belt[2]+offsetY }
    --         surface.create_entity{name="express-transport-belt", position=position, direction=entityDirection, force="player"}
    --     end
    -- end

    -- barrier to not get out :P
    surface.set_tiles({
        {name="factory-wall-3", position={x=-2, y=30}},
        {name="factory-wall-3", position={x=-1, y=30}},
        {name="factory-wall-3", position={x=0, y=30}},
        {name="factory-wall-3", position={x=1, y=30}},

        {name="out-of-map", position={x=-3, y=31}},
        {name="out-of-map", position={x=-2, y=31}},
        {name="out-of-map", position={x=-1, y=31}},
        {name="out-of-map", position={x=0, y=31}},
        {name="out-of-map", position={x=1, y=31}},
        {name="out-of-map", position={x=2, y=31}},
        {name="out-of-map", position={x=-3, y=32}},
        {name="out-of-map", position={x=-2, y=32}},
        {name="out-of-map", position={x=-1, y=32}},
        {name="out-of-map", position={x=0, y=32}},
        {name="out-of-map", position={x=1, y=32}},
        {name="out-of-map", position={x=2, y=32}},
    })
end

local on_player_created = function(event)
    local player = game.get_player(event.player_index)
    if event.player_index ~= 1 then 
        -- teleport the player to the main factory surface
        player.teleport({x=0, y=30}, "Factory floor 1")
        return
    end

    local surface = player.surface

    -- create the main factory for the player and then raise the event so Factorissimo can do it's pairing
    -- of surfaces and the doors
    local factory = surface.create_entity{name="factory-3", position = {x=10, y=10}, force="player", raise_built=true}
    global.factory = {}
    global.factory.name = "factory-3"
    global.factory.position = factory.position
    global.factory.surface_name = "Factory floor 1"
    global.factory.placed_on_surface_name = factory.surface.name

    -- teleport the player to the main factory surface
    player.teleport({x=0, y=30}, "Factory floor 1")

    -- createOutsideStuff(surface)

    local factorySurface = game.get_surface("Factory floor 1")
    createFactoryStuff(factorySurface)
    global.combinator = factorySurface.create_entity{name="factory-input-combinator", position={x=4, y=31}, force="player"}

    -- research tech to build more factories
    for index, force in pairs(game.forces) do
        game.forces[index].technologies["factory-architecture-t1"].researched = true
        game.forces[index].technologies["factory-architecture-t2"].researched = true
        game.forces[index].technologies["factory-architecture-t3"].researched = true
        game.forces[index].technologies["factory-connection-type-fluid"].researched = true
        game.forces[index].technologies["factory-interior-upgrade-lights"].researched = true
        game.forces[index].technologies["factory-recursion-t1"].researched = true
        game.forces[index].technologies["factory-recursion-t2"].researched = true
    end
end

local on_player_respawned = function(event)
    local player = game.get_player(event.player_index)
    if player == nil then return game.print("Error getting player to teleport after respawn. Report to mod author") end
    -- teleport the player to the main factory surface
    player.teleport({x=0, y=30}, "Factory floor 1")
end

local on_cutscene_cancelled = function(event)
    local player = game.get_player(event.player_index)
    if player == nil or player.character == nil then return game.print("Error getting player to teleport after respawn. Report to mod author") end
    -- teleport the player to the main factory surface
    player.teleport({x=0, y=30}, "Factory floor 1")
end

local factories = {}
factories.events = {
    [defines.events.on_player_created] = on_player_created,
    [defines.events.on_player_respawned] = on_player_respawned,
    [defines.events.on_cutscene_cancelled] = on_cutscene_cancelled
}
factories.on_init = function()
    if remote.interfaces["freeplay"] then
        remote.call("freeplay", "set_skip_intro", true)
        remote.call("freeplay", "set_disable_crashsite", true)
    end
end
return factories