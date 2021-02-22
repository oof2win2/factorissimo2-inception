script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    if event.player_index ~= 1 then 
        -- teleport the player to the main factory surface
        player.teleport({x=0, y=31}, "Factory floor 1")
    end
    local surface = player.surface

    -- create the main factory for the player and then raise the event so Factorissimo can do it's pairing
    -- of surfaces and the doors
    surface.create_entity{name="factory-3", position = {x=10, y=10}, force="player", raise_built=true}

    -- teleport the player to the main factory surface
    player.teleport({x=0, y=32}, "Factory floor 1")

    -- iron outside
    surface.create_entity{name="infinity-chest", position={x=4, y=21}, force="player"}.set_infinity_container_filter(1, {name="iron-ore", count=50})
    surface.create_entity{name="infinity-chest", position={x=6, y=21}, force="player"}.set_infinity_container_filter(1, {name="iron-ore", count=50})
    surface.create_entity{name="infinity-chest", position={x=5, y=21}, force="player"}.set_infinity_container_filter(1, {name="iron-ore", count=50})
    surface.create_entity{name="infinity-chest", position={x=7, y=21}, force="player"}.set_infinity_container_filter(1, {name="iron-ore", count=50})
    surface.create_entity{name="express-loader", position={x=4, y=20}, orientation=defines.direction.north, force="player", type="output"}
    surface.create_entity{name="express-loader", position={x=5, y=20}, orientation=defines.direction.north, force="player", type="output"}
    surface.create_entity{name="express-loader", position={x=6, y=20}, orientation=defines.direction.north, force="player", type="output"}
    surface.create_entity{name="express-loader", position={x=7, y=20}, orientation=defines.direction.north, force="player", type="output"}
    surface.create_entity{name="express-transport-belt", position={x=4, y=18}, direction=defines.direction.north, force="player"}
    surface.create_entity{name="express-transport-belt", position={x=5, y=18}, direction=defines.direction.north, force="player"}
    surface.create_entity{name="express-transport-belt", position={x=6, y=18}, direction=defines.direction.north, force="player"}
    surface.create_entity{name="express-transport-belt", position={x=7, y=18}, direction=defines.direction.north, force="player"}

    -- copper outside
    surface.create_entity{name="infinity-chest", position={x=12, y=21}, force="player"}.set_infinity_container_filter(1, {name="copper-ore", count=50})
    surface.create_entity{name="infinity-chest", position={x=13, y=21}, force="player"}.set_infinity_container_filter(1, {name="copper-ore", count=50})
    surface.create_entity{name="infinity-chest", position={x=14, y=21}, force="player"}.set_infinity_container_filter(1, {name="copper-ore", count=50})
    surface.create_entity{name="infinity-chest", position={x=15, y=21}, force="player"}.set_infinity_container_filter(1, {name="copper-ore", count=50})
    surface.create_entity{name="express-loader", position={x=12, y=20}, direction=defines.direction.north, force="player", type="output"}
    surface.create_entity{name="express-loader", position={x=13, y=20}, direction=defines.direction.north, force="player", type="output"}
    surface.create_entity{name="express-loader", position={x=14, y=20}, direction=defines.direction.north, force="player", type="output"}
    surface.create_entity{name="express-loader", position={x=15, y=20}, direction=defines.direction.north, force="player", type="output"}
    surface.create_entity{name="express-transport-belt", position={x=12, y=18}, direction=defines.direction.north, force="player"}
    surface.create_entity{name="express-transport-belt", position={x=13, y=18}, direction=defines.direction.north, force="player"}
    surface.create_entity{name="express-transport-belt", position={x=14, y=18}, direction=defines.direction.north, force="player"}
    surface.create_entity{name="express-transport-belt", position={x=15, y=18}, direction=defines.direction.north, force="player"}

    -- random stuff outside
    surface.create_entity{name="infinity-chest", position={x=-2, y=12}, force="player"}.set_infinity_container_filter(1, {name="uranium-ore", count=50})
    surface.create_entity{name="express-loader", position={x=0, y=12}, direction=defines.direction.east, force="player", type="output"}
    surface.create_entity{name="express-transport-belt", position={x=1, y=12}, direction=defines.direction.east, force="player"}
    surface.create_entity{name="infinity-chest", position={x=-2, y=13}, force="player"}.set_infinity_container_filter(1, {name="coal", count=50})
    surface.create_entity{name="express-loader", position={x=0, y=13}, direction=defines.direction.east, force="player", type="output"}
    surface.create_entity{name="express-transport-belt", position={x=1, y=13}, direction=defines.direction.east, force="player"}
    surface.create_entity{name="infinity-chest", position={x=-2, y=14}, force="player"}.set_infinity_container_filter(1, {name="coal", count=50})
    surface.create_entity{name="express-loader", position={x=0, y=14}, direction=defines.direction.east, force="player", type="output"}
    surface.create_entity{name="express-transport-belt", position={x=1, y=14}, direction=defines.direction.east, force="player"}
    surface.create_entity{name="infinity-chest", position={x=-2, y=15}, force="player"}.set_infinity_container_filter(1, {name="coal", count=50})
    surface.create_entity{name="express-loader", position={x=0, y=15}, direction=defines.direction.east, force="player", type="output"}
    surface.create_entity{name="express-transport-belt", position={x=1, y=15}, direction=defines.direction.east, force="player"}

    surface.create_entity{name="pipe-to-ground", force="player", direction=defines.direction.west, position={x=18, y=12}}
    surface.create_entity{name="pipe-to-ground", force="player", direction=defines.direction.east, position={x=20, y=12}}
    surface.create_entity{name="infinity-pipe", position={x=21, y=12}, force="player"}.set_infinity_pipe_filter({name="crude-oil", percentage=100.0})
    surface.create_entity{name="pipe-to-ground", force="player", direction=defines.direction.west, position={x=18, y=13}}
    surface.create_entity{name="pipe-to-ground", force="player", direction=defines.direction.east, position={x=20, y=13}}
    surface.create_entity{name="infinity-pipe", position={x=21, y=13}, force="player"}.set_infinity_pipe_filter({name="crude-oil", percentage=100.0})
    surface.create_entity{name="pipe", force="player", direction=defines.direction.west, position={x=18, y=14}}
    surface.create_entity{name="infinity-pipe", position={x=19, y=14}, force="player"}.set_infinity_pipe_filter({name="water", percentage=100.0})
    surface.create_entity{name="pipe", force="player", direction=defines.direction.west, position={x=18, y=15}}
    surface.create_entity{name="infinity-pipe", position={x=19, y=15}, force="player"}.set_infinity_pipe_filter({name="water", percentage=100.0})

    surface.create_entity{name="infinity-chest", position={x=-2, y=6}, force="player"}.set_infinity_container_filter(1, {name="stone", count=50})
    surface.create_entity{name="express-loader", position={x=0, y=6}, direction=defines.direction.east, force="player", type="output"}
    surface.create_entity{name="express-transport-belt", position={x=1, y=6}, direction=defines.direction.east, force="player"}
    surface.create_entity{name="infinity-chest", position={x=-2, y=7}, force="player"}.set_infinity_container_filter(1, {name="stone", count=50})
    surface.create_entity{name="express-loader", position={x=0, y=7}, direction=defines.direction.east, force="player", type="output"}
    surface.create_entity{name="express-transport-belt", position={x=1, y=7}, direction=defines.direction.east, force="player"}


    local factorySurface = game.get_surface("Factory floor 1")
    -- iron belts inside
    factorySurface.create_entity{name="express-transport-belt", position={x=-25, y=30}, direction=defines.direction.north, force="player", raise_built=true}
    factorySurface.create_entity{name="express-transport-belt", position={x=-21, y=30}, direction=defines.direction.north, force="player", raise_built=true}
    factorySurface.create_entity{name="express-transport-belt", position={x=-10, y=30}, direction=defines.direction.north, force="player", raise_built=true}
    factorySurface.create_entity{name="express-transport-belt", position={x=-6, y=30}, direction=defines.direction.north, force="player", raise_built=true}

    --copper belts inside
    factorySurface.create_entity{name="express-transport-belt", position={x=5, y=30}, direction=defines.direction.north, force="player", raise_built=true}
    factorySurface.create_entity{name="express-transport-belt", position={x=9, y=30}, direction=defines.direction.north, force="player", raise_built=true}
    factorySurface.create_entity{name="express-transport-belt", position={x=20, y=30}, direction=defines.direction.north, force="player", raise_built=true}
    factorySurface.create_entity{name="express-transport-belt", position={x=24, y=30}, direction=defines.direction.north, force="player", raise_built=true}

    -- random stuff inside
    factorySurface.create_entity{name="express-transport-belt", position={x=-31, y=5}, direction=defines.direction.east, force="player", raise_built=true}      -- uranium ore
    factorySurface.create_entity{name="express-transport-belt", position={x=-31, y=9}, direction=defines.direction.east, force="player", raise_built=true}      -- coal
    factorySurface.create_entity{name="express-transport-belt", position={x=-31, y=20}, direction=defines.direction.east, force="player", raise_built=true}     -- coal
    factorySurface.create_entity{name="express-transport-belt", position={x=-31, y=24}, direction=defines.direction.east, force="player", raise_built=true}     -- coal

    factorySurface.create_entity{name="factory-input-pipe", force="player", direction=defines.direction.east, position={x=30, y=5}, raise_built=true}       -- crude oil
    factorySurface.create_entity{name="factory-input-pipe", force="player", direction=defines.direction.east, position={x=30, y=9}, raise_built=true}       -- crude oil
    factorySurface.create_entity{name="factory-input-pipe", force="player", direction=defines.direction.east, position={x=30, y=20}, raise_built=true}      -- water
    factorySurface.create_entity{name="factory-input-pipe", force="player", direction=defines.direction.east, position={x=30, y=24}, raise_built=true}      -- water
    
    factorySurface.create_entity{name="express-transport-belt", position={x=-31, y=-10}, direction=defines.direction.east, force="player", raise_built=true} -- stone
    factorySurface.create_entity{name="express-transport-belt", position={x=-31, y=-6}, direction=defines.direction.east, force="player", raise_built=true}  -- stone

    -- barrier to not get out :P
    factorySurface.create_entity{name="steel-chest", force="enemy", position={x=-3, y=32}}
    factorySurface.create_entity{name="steel-chest", force="enemy", position={x=-2, y=32}}
    factorySurface.create_entity{name="steel-chest", force="enemy", position={x=-1, y=32}}
    factorySurface.create_entity{name="steel-chest", force="enemy", position={x=0, y=32}}
    factorySurface.create_entity{name="steel-chest", force="enemy", position={x=1, y=32}}
    factorySurface.create_entity{name="steel-chest", force="enemy", position={x=2, y=32}}

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
end)

script.on_event(defines.events.on_player_respawned, function(event)
    local player = game.get_player(event.player_index)
    if player == null then return game.print("Error getting player to teleport after respawn. Report to mod author") end
    -- teleport the player to the main factory surface
    player.teleport({x=0, y=31}, "Factory floor 1")
end)
script.on_event(defines.events.on_cutscene_cancelled, function(event)
    local player = game.get_player(event.player_index)
    if player == null or player.character == null then return game.print("Error getting player to teleport after respawn. Report to mod author") end
    -- teleport the player to the main factory surface
    player.teleport({x=0, y=31}, "Factory floor 1")
end)
