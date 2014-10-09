if tweak_data and tweak_data.ACPConfig then
	-- Increased bag throwing distance
	if tweak_data.ACPConfig.Bag_Weight then
		if not _BagMod then _BagMod = PlayerManager.carry_blocked_by_cooldown end
			-- Carry mods (throwing distance, movement speed, jumping, running)
			local car_arr = { 'being', 'mega_heavy', 'heavy', 'medium', 'light', 'coke_light', 'very_heavy', 'explosives' }
			for i, name in ipairs(car_arr) do
					if not tweak_data.carry.types["__" .. name] then
							tweak_data.carry.types["__" .. name] = clone(tweak_data.carry.types[name])
			end
					tweak_data.carry.types[ name ].throw_distance_multiplier = 1.2
					tweak_data.carry.types[ name ].move_speed_modifier = 1
					tweak_data.carry.types[ name ].jump_modifier = 1
					tweak_data.carry.types[ name ].can_run = true
					tweak_data.carry.types.explosives.can_explode = false
			end
					function PlayerManager:carry_blocked_by_cooldown() return false
					end
	end

	-- Instant Deploy Equipment
	if tweak_data.ACPConfig.Instant_Deploy then
		PlayerManager.selected_equipment_deploy_timer = function(self) return 0 end
	end

	-- NO BAG COOLDOWN
	if tweak_data.ACPConfig.Bag_Cooldown then
		function PlayerManager:carry_blocked_by_cooldown() return false 
		end
	end
	
	function PlayerManager:aquire_default_upgrades()
		managers.upgrades:aquire_default("cable_tie")
		managers.upgrades:aquire_default("player_special_enemy_highlight")
		managers.upgrades:aquire_default("player_hostage_trade")
		managers.upgrades:aquire_default("player_sec_camera_highlight")
		managers.upgrades:aquire_default("player_corpse_dispose")
		managers.upgrades:aquire_default("player_corpse_dispose_amount_1")
		managers.upgrades:aquire_default("player_civ_harmless_melee")
		managers.upgrades:aquire_default("striker_reload_speed_default")
		managers.upgrades:aquire_default("player_additional_assets")
		managers.upgrades:aquire_default("player_buy_spotter_asset")
		managers.upgrades:aquire_default("player_buy_bodybags_asset")
		for i = 1, PlayerManager.WEAPON_SLOTS do
			if not managers.player:weapon_in_slot(i) then
				self._global.kit.weapon_slots[i] = managers.player:availible_weapons(i)[1]
			end 
		end
		self:_verify_equipment_kit()
	end  
end