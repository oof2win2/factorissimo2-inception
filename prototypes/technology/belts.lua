local belt_names = {}

for _, belt in pairs(data.raw["transport-belt"]) do
	belt_names[belt.name] = true
end

-- Create an ordering of the belts by speed
-- to be used in the backup code
local belts_by_speed = {}
for belt_name, _ in pairs(belt_names) do
	belts_by_speed[#belts_by_speed+1] = belt_name
end
local ordering = function (b1, b2)
	return data.raw["transport-belt"][b1].speed < data.raw["transport-belt"][b2].speed
end
table.sort(belts_by_speed, ordering)


for _, tech in pairs(data.raw["technology"]) do
	if tech.effects then
		for _, effect in pairs(tech.effects) do
			if effect.type == "unlock-recipe" and data.raw.recipe[effect.recipe] then
				local has_recipe = ""
				-- the single recipe result is a string and it is the name of the belt
				local result_name = data.raw.recipe[effect.recipe].result
				local normal_result_name = data.raw.recipe[effect.recipe].normal and
					data.raw.recipe[effect.recipe].normal.result
				local expensive_result_name = data.raw.recipe[effect.recipe].expensive and
					data.raw.recipe[effect.recipe].expensive.result
				if result_name and belt_names[result_name] then has_recipe = result_name end
				if normal_result_name and belt_names[normal_result_name] then has_recipe = normal_result_name end
				if expensive_result_name and belt_names[expensive_result_name] then has_recipe = expensive_result_name end

				-- essentially the same thing, but for multiple results
				if data.raw.recipe[effect.recipe].results then
					for _, result in pairs(data.raw.recipe[effect.recipe].results) do
						if result.name and belt_names[result.name] then has_recipe = result.name end
					end
				end

				if data.raw.recipe[effect.recipe].normal and data.raw.recipe[effect.recipe].normal.results then
					for _, result in pairs(data.raw.recipe[effect.recipe].normal.results) do
						if result.name and belt_names[result.name] then has_recipe = result.name end
					end
				end
				if data.raw.recipe[effect.recipe].expensive and data.raw.recipe[effect.recipe].expensive.results then
					for _, result in pairs(data.raw.recipe[effect.recipe].expensive.results) do
						if result.name and belt_names[result.name] then has_recipe = result.name end
					end
				end

				if has_recipe ~= "" then
					local item = data.raw.item[has_recipe]
					-- add the technology to the belt
					print("extended tech for " .. has_recipe)
					data:extend { {
						type = "technology",
						name = "f2pl-belt-" .. has_recipe,
						icon = item.icon,
						icon_size = item.icon_size,
						icon_mipmaps = item.icon_mipmaps,
						prerequisites = { tech.name },
						unit = {
							count = math.min(tech.unit.count, 500),
							ingredients = tech.unit.ingredients,
							time = 15
						},
						localised_name = { "", { "technology-name.f2pl-belt" }, " ", { "item-name." .. has_recipe } },
					} }
					belt_names[has_recipe] = nil -- unsert the belt from the list
				end
			end
		end
	end
end


-- For belt types where we do not have a natural parent technology we 
-- create a separate level 0 technology. Two special cases:
-- 1. We start with external connections using the slowest belt tech, 
--    so no technology upgrading to this level is added.
-- 2. For the upgrade to the first tier there is no prerequisite, as we
--    do not know about a technology unlocking the belt itself, nor is 
--    there a technology that upgrades the external connection to the
--    previous belt tier (as that is the starting tier)
for belt_name, _ in pairs(belt_names) do
	-- Find speed index
	local index = nil
	for i, v in ipairs(belts_by_speed) do
		if v == belt_name then index = i end
	end
	if index > 1 then -- Skip slowest belt
		log("Adding tech for " .. belt_name)
		prerequisites = {}
		if index > 2 then
			-- There is a tech upgrading to 1 tier lower belts
			local prev_belt_name = belts_by_speed[index-1]
			prerequisites = {"f2pl-belt-" .. prev_belt_name}
		end
		local item = data.raw.item[belt_name]
		data:extend { {
			type = "technology",
			name = "f2pl-belt-" .. belt_name,
			icon = item.icon,
			icon_size = item.icon_size,
			icon_mipmaps = item.icon_mipmaps,
			prerequisites = prerequisites,
			unit = {
				count = 100,
				ingredients = { { "automation-science-pack", 1 } },
				time = 15
			},
			localised_name = { "", { "technology-name.f2pl-belt" }, " ", { "item-name." .. belt_name } },
		} }
	end
end
