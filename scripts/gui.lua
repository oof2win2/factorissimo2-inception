local factoryStatic = require("statics.factoryInputs")

local function create_buttons(player)
    local selector_filter = {}
    for _, item in pairs(global.availableItems) do
        log(serpent.line(global.availableItems))
        if item.name and item.amount >= 1 then
            table.insert(selector_filter, {filter="name", name=item.name})
        end
    end
    if selector_filter[1] == nil then
        log("blank")
        table.insert(selector_filter, {filter="stack-size", comparison="=", value=100000})
        log(serpent.line(selector_filter))
    end
    log(serpent.line(selector_filter))
    
    local function createButtons(flow, button, direction)
        button.tags.direction = direction
        flow.clear()
        for i = 1, 4, 1 do
            button.tags.num = i
            local itemname = global.selected[button.tags.direction][button.tags.num]
            button.item = itemname
            flow.add(button)
            button.item = nil
        end
        flow.add{type="sprite", name="dummy_buttons_button", sprite="tile/lab-dark-2"}
        for i = 5, 8, 1 do
            button.tags.num = i
            local itemname = global.selected[button.tags.direction][button.tags.num]
            button.item = itemname
            flow.add(button)
            button.item = nil
        end
    end
    local button = {type="choose-elem-button", tags={action="f2pl_select_item"}, flow="vertical", elem_type="item", elem_filters=selector_filter}
    local top_content = player.opened.content_frame.top_content
    local mid_content = player.opened.content_frame.mid_content
    local bot_content = player.opened.content_frame.bot_content
    createButtons(mid_content.children[1], button, defines.direction.west)
    createButtons(mid_content.children[3], button, defines.direction.east)
    createButtons(top_content.children[1], button, defines.direction.north)
    createButtons(bot_content.children[1], button, defines.direction.south)
end
local function create_interface(player)
    local screen = player.gui.screen
    local player_global = global.players[player.index]
    if screen["f2pl_input_selector"] ~= nil then
        screen["f2pl_input_selector"].destroy()
    else
        local main_frame = screen.add{type="frame", caption={"factoryinput.title"}, name="f2pl_input_selector"}
        -- main_frame.style.size = {385, 165}
        main_frame.auto_center = true

        local content_frame = main_frame.add{type="frame", name="content_frame", direction="vertical"}
        -- local content_table = content_frame.add{type="table", name="content_table", column_count=3}

        -- flow setup
        local top_content = content_frame.add{type="flow", name="top_content", style="f2pl_horizontal_centerflow"}
        local mid_content = content_frame.add{type="flow", name="mid_content", style="f2pl_horizontal_centerflow"}
        local bot_content = content_frame.add{type="flow", name="bot_content", style="f2pl_horizontal_centerflow"}

        local top_buttons_flow = top_content.add{type="flow", name="top_buttons_flow", direction="horizontal", style="f2pl_horizontal_centerflow"}
        local left_buttons_flow = mid_content.add{type="flow", name="left_buttons_flow", direction="vertical"}
        local preview_flow = mid_content.add{type="flow", name="preview_flow", direction="horizontal"}
        local right_buttons_flow = mid_content.add{type="flow", name="right_buttons_flow", direction="vertical"}
        local bottom_buttons_flow = bot_content.add{type="flow", name="bottom_buttons_flow", direction="horizontal", style="f2pl_horizontal_centerflow"}
        
        local entity = game.get_surface(global.factory.placed_on_surface_name).find_entity(global.factory.name, global.factory.position)
        if entity == nil then return end
        local preview = preview_flow.add{type="entity-preview", tags={main="f2pl_factory_preview"}}
        preview.style.size = {512, 512}
        preview.entity = entity

        -- alignment of stuff
        top_buttons_flow.style.horizontal_align = "center"
        top_buttons_flow.style.horizontally_stretchable = true
        left_buttons_flow.style.vertical_align = "center"
        left_buttons_flow.style.vertically_stretchable = true
        right_buttons_flow.style.vertical_align = "center"
        right_buttons_flow.style.vertically_stretchable = true
        bottom_buttons_flow.style.vertical_align = "center"
        bottom_buttons_flow.style.horizontally_stretchable = true

        player_global.elements.main_frame = main_frame
        player.opened = main_frame

        create_buttons(player)
    end
end
local function set_item_input(direction, id, input)
    local indoorSurface = game.get_surface(global.factory.surface_name)
    local outdoorSurface = game.get_surface(global.factory.placed_on_surface_name)
    local belt_tier_name = global.belt_tier_name
    local entityDirection = direction + 4
    if entityDirection >= 8 then entityDirection = entityDirection - 8 end
    local outdoorPos = factoryStatic.outdoorPos.positions[direction]
    local indoorPos = factoryStatic.indoorPos.positions[direction]
    local outOffsetX = factoryStatic.outdoorPos.offsets[direction].x[id]
    local outOffsetY = factoryStatic.outdoorPos.offsets[direction].y[id]
    local inOffsetX = factoryStatic.indoorPos.offsets[direction].x[id]
    local inOffsetY = factoryStatic.indoorPos.offsets[direction].y[id]

    local chestPosition = { outdoorPos.chest[1]+outOffsetX, outdoorPos.chest[2]+outOffsetY }
    local loaderPosition = { outdoorPos.loader[1]+outOffsetX, outdoorPos.loader[2]+outOffsetY }
    local outdoorBeltPosition = { outdoorPos.belt[1]+outOffsetX, outdoorPos.belt[2]+outOffsetY }
    local indoorBeltPosition = { indoorPos.belt[1]+inOffsetX, indoorPos.belt[2]+inOffsetY }
    local infinitychest = outdoorSurface.create_entity{name="infinity-chest", position=chestPosition, force="player"}
    outdoorSurface.create_entity{name=belt_tier_name.."loader", position=loaderPosition, force="player", type="output", direction=entityDirection}
    outdoorSurface.create_entity{name=belt_tier_name.."transport-belt", position=outdoorBeltPosition, direction=entityDirection, force="player", raise_built=true}
    indoorSurface.create_entity{name=belt_tier_name.."transport-belt", position=indoorBeltPosition, direction=entityDirection, force="player", raise_built=true}
    infinitychest.set_infinity_container_filter(1, {name=input, count=50, index=1})
end
local function set_fluid_input(direction, id, input)
    log("setting fluid input")
    local fluidInput = input:sub(1, input:find("-barrel")-1)
    local indoorSurface = game.get_surface(global.factory.surface_name)
    local outdoorSurface = game.get_surface(global.factory.placed_on_surface_name)
    local entityDirection = direction + 4
    if entityDirection >= 8 then entityDirection = entityDirection - 8 end
    local outdoorPos = factoryStatic.outdoorPos.positions[direction]
    local indoorPos = factoryStatic.indoorPos.positions[direction]
    local outOffsetX = factoryStatic.outdoorPos.offsets[direction].x[id]
    local outOffsetY = factoryStatic.outdoorPos.offsets[direction].y[id]
    local inOffsetX = factoryStatic.indoorPos.offsets[direction].x[id]
    local inOffsetY = factoryStatic.indoorPos.offsets[direction].y[id]

    local infPipePosition = { outdoorPos.infpipe[1]+outOffsetX, outdoorPos.infpipe[2]+outOffsetY }
    local outdoorBulkpipePosition = { outdoorPos.bulkpipe[1]+outOffsetX, outdoorPos.bulkpipe[2]+outOffsetY }
    local indoorBulkpipePosition = { indoorPos.bulkpipe[1]+inOffsetX, indoorPos.bulkpipe[2]+inOffsetY }
    local infinitypipe = outdoorSurface.create_entity{name="infinity-pipe", position=infPipePosition, force="player"}
    outdoorSurface.create_entity{name="factory-input-pipe", position=outdoorBulkpipePosition, force="player", type="output", direction=entityDirection, raise_built=true}
    indoorSurface.create_entity{name="factory-output-pipe", position=indoorBulkpipePosition, direction=entityDirection, force="player", raise_built=true}
    infinitypipe.set_infinity_pipe_filter({name=fluidInput, percentage=100.0})
end
local function remove_input(direction, id)
    local indoorSurface = game.get_surface(global.factory.surface_name)
    local outdoorSurface = game.get_surface(global.factory.placed_on_surface_name)
    local entityDirection = direction + 4
    if entityDirection >= 8 then entityDirection = entityDirection - 8 end
    local outdoorPos = factoryStatic.outdoorPos.positions[direction]
    local indoorPos = factoryStatic.indoorPos.positions[direction]
    local outOffsetX = factoryStatic.outdoorPos.offsets[direction].x[id]
    local outOffsetY = factoryStatic.outdoorPos.offsets[direction].y[id]
    local inOffsetX = factoryStatic.indoorPos.offsets[direction].x[id]
    local inOffsetY = factoryStatic.indoorPos.offsets[direction].y[id]


    local chestPosition = { outdoorPos.chest[1]+outOffsetX+0.5, outdoorPos.chest[2]+outOffsetY+0.5 }
    local outdoorBeltPosition = { outdoorPos.belt[1]+outOffsetX+0.5, outdoorPos.belt[2]+outOffsetY+0.5 }
    local indoorBeltPosition = { indoorPos.belt[1]+inOffsetX+0.5, indoorPos.belt[2]+inOffsetY+0.5 }
    local indoorBulkpipePosition = { indoorPos.bulkpipe[1]+inOffsetX+0.5, indoorPos.bulkpipe[2]+inOffsetY+0.5 }
    local outside = outdoorSurface.find_entities({outdoorBeltPosition, chestPosition})
    local inside = indoorSurface.find_entities({indoorBulkpipePosition, indoorBeltPosition})
    for _, entity in pairs(outside) do
        if entity.name == "infinity-pipe" then
            local filter = entity.get_infinity_pipe_filter(1)
            if filter ~= nil then
                if global.availableItems[filter.name .. "-barrel"] ~= nil then
                    global.availableItems[filter.name .. "-barrel"].amount = global.availableItems[filter.name .. "-barrel"].amount + 1
                else
                    global.availableItems[filter.name .. "-barrel"] = {name= filter.name.."-barrel", amount=1}
                end
            end
        elseif entity.name == "infinity-chest" then
            local filter = entity.get_infinity_container_filter(1)
            if filter ~= nil then
                if global.availableItems[filter.name] ~= nil then
                    global.availableItems[filter.name].amount = global.availableItems[filter.name].amount + 1
                else
                    global.availableItems[filter.name].amount = 1
                end
            end
        end
        entity.destroy({raise_destroy = true})
    end
    for _, entity in pairs(inside) do
        entity.destroy({raise_destroy = true})
    end
end

local function change_input(name, amount)
    local input = global.availableItems[name]
    if input and input.amount then
        input.amount = input.amount + amount
    else
        global.availableItems[name] = {name=name, amount=0}
    end
end

local function on_gui_elem_changed(event)
    if event.element.tags == nil or event.element.tags.action ~= "f2pl_select_item" then return end
    local element = event.element
    global.selected[element.tags.direction][element.tags.num] = element.elem_value
    remove_input(element.tags.direction, element.tags.num)
    if element.elem_value ~= nil and element.elem_value:find("barrel") == nil  then
        set_item_input(element.tags.direction, element.tags.num, element.elem_value)
        change_input(element.elem_value, -1)
    elseif element.elem_value ~= nil and element.elem_value:find("barrel") ~= nil then
        set_fluid_input(element.tags.direction, element.tags.num, element.elem_value)
        change_input(element.elem_value, -1)
    end
    create_buttons(game.get_player(event.player_index))
end

local function toggle_interface(player)
    local player_global = global.players[player.index]
    local main_frame = player_global.elements.main_frame

    if main_frame == nil then
        create_interface(player)
    else
        main_frame.destroy()
        player_global.elements = {}
    end
end

local guis = {}
guis.events = {
    [defines.events.on_gui_opened] = function(event)
        if event.entity == nil or event.entity.name ~= "factory-input-combinator" then return end
        local player = game.get_player(event.player_index)

        toggle_interface(player)
    end,
    [defines.events.on_gui_closed] = function(event)
        if event.element and event.element.name == "f2pl_input_selector" then
            local player = game.get_player(event.player_index)
            toggle_interface(player)
        end
    end,
    [defines.events.on_player_created] = function(event)
        global.players[event.player_index] = { controls_active = false, selected_item = nil, elements = {} }
    end,
    [defines.events.on_gui_elem_changed] = on_gui_elem_changed,
    [defines.events.on_research_finished] = function(event)
        if event.research.name == nil then return end
        if event.research.name == "factory-input-belt-2" then
            global.belt_tier_name = "fast-"
        elseif event.research.name == "factory-input-belt-3" then
            global.belt_tier_name = "express-"
        end
        if event.research.name:find("factory%-extra%-") ~= nil then
            local resource = event.research.name:sub(15):sub(1, -3)
            if global.availableItems[resource] ~= nil then
                global.availableItems[resource].amount = global.availableItems[resource].amount + 1
            else
                global.availableItems[resource] = {name=resource, amount=1}
            end
        end
    end,
}
guis.on_init = function()
    global.players = {}

    global.usedItems = {}
    global.availableItems = {
        ["water-barrel"] = {name="water-barrel", amount=1}
    }
    local resources = game.get_filtered_entity_prototypes{{filter="type",type="resource"}}
    for _, prototype in pairs(resources) do
        if prototype.resource_category:find("fluid") ~= nil then
            global.availableItems[prototype.name .. "-barrel"] = {name=prototype.name .. "-barrel", amount=1}
        else
            global.availableItems[prototype.name] = {name=prototype.name, amount=1}
        end
    end

    global.belt_tier_name = ""

    global.selected = {}
    for _, value in pairs(defines.direction) do
        global.selected[value] = {}
    end
end

guis.on_configuration_changed = function(config_changed_data)
    if config_changed_data.mod_changes["Factorissimo2-Playthrough"] then
        for _, player in pairs(game.players) do
            local main_frame = player.opened
            if main_frame ~= nil and main_frame.entity ~= nil and main_frame.entity.name == "factory-input-combinator" then 
                toggle_interface(player) 
            end
        end
        for name, amount in pairs(global.availableItems) do
            log(serpent.line(global.availableItems[name]))
            global.availableItems[name] = {name=name, amount=amount}
            log(serpent.line(global.availableItems[name]))
        end
    end
end

return guis