local belt_names = {}

for _, belt in pairs(data.raw["transport-belt"]) do
	belt_names[belt.name] = true
end

print(serpent.line(belt_names))

for _, tech in pairs(data.raw["technology"]) do
	if tech.effects then
		for _, effect in pairs(tech.effects) do
			if effect.type == "unlock-recipe" then
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


-- for the remaining techs, we need to add the belts as level 0 techs, EXCEPT for the slowest one
local slowest_belt = nil
for belt_name, _ in pairs(belt_names) do
	if slowest_belt == nil then
		slowest_belt = belt_name
	else
		if data.raw["transport-belt"][belt_name].speed < data.raw["transport-belt"][belt_name].speed then
			slowest_belt = belt_name
		end
	end
end

-- now for the remaining belts, add them as level 0 techs
for belt_name in pairs(belt_names) do
	if belt_name ~= slowest_belt then
		local item = data.raw.item[belt_name]
		data:extend { {
			type = "technology",
			name = "f2pl-belt-" .. belt_name,
			icon = item.icon,
			icon_size = item.icon_size,
			icon_mipmaps = item.icon_mipmaps,
			prerequisites = { "f2pl-belt-" .. slowest_belt },
			unit = {
				count = 100,
				ingredients = { { "automation-science-pack", 1 } },
				time = 15
			},
			localised_name = { "", { "technology-name.f2pl-belt" }, " ", { "item-name." .. belt_name } },
		} }
	end
end
