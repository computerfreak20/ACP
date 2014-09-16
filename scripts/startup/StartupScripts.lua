if tweak_data and tweak_data.ACPConfig then
	--Bulldozers can be melee'd by anything now
	if tweak_data.ACPConfig.Melee_Bulldozers then
		if not TankCopDamage then return end
		function TankCopDamage.damage_melee( ... )
			return TankCopDamage.super.damage_melee( ... )
		end
		function HuskTankCopDamage.damage_melee( ... )
			return HuskTankCopDamage.super.damage_melee( ... )
		end
	end
	
	--No Delay Between Shouts
	if tweak_data.ACPConfig.No_Shout_Delay then
		tweak_data.player.movement_state.interaction_delay = 0
		tweak_data.upgrades.morale_boost_base_cooldown = 0
	end
	
	--No fall damage
	if tweak_data.ACPConfig.No_Fall_Damage then
		if not PlayerDamage then return end
		function PlayerDamage:damage_fall(data)
			return false
		end
	end
	
	--No Job Heat
	if tweak_data.ACPConfig.No_Job_Heat then
		function JobManager:heat_to_experience_value(heat)
			return math.round(heat)
		end
		for k, v in pairs(tweak_data.narrative:get_jobs_index()) do
			Global.job_manager.heat[v] = 0.5
		end
	end
	
	-- INFINITE STAMINA
	if tweak_data.ACPConfig.Infinite_Stamina then
		function PlayerMovement:_change_stamina( value ) 
		end
		function PlayerMovement:is_stamina_drained() return false 
		end
	end

	-- FAST MASK ON
	if tweak_data.ACPConfig.Fast_Mask_On then
		if not _fastMask then _fastMask = tweak_data.player.put_on_mask_time
		end
		tweak_data.player.put_on_mask_time = 0.1
	end

	-- Infinite Saw
	if tweak_data.ACPConfig.Infinite_Saw then
		if not _fireSaw then _fireSaw = SawWeaponBase.fire end
		function SawWeaponBase:fire( from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit )
			local result = _fireSaw( self, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit )

			if managers.player:player_unit() == self._setup.user_unit then
				self.set_ammo(self, 1.0)
			end

			return result
		end
	end

	-- Shotguns do not queue shots now, all pellets are fired instantly
	if not GamePlayCentralManager then return end
	function GamePlayCentralManager:play_impact_sound_and_effects( params )
		self:_play_bullet_hit(params)
	end

	-- Drills don't jam (unless cops disable them)
	if tweak_data.ACPConfig.Stop_Drill_Jamming then
		if not _jamValue then _jamValue = TimerGui._set_jamming_values end
		function TimerGui:_set_jamming_values() return end
	end

	-- Ammo bags refill grenades & cable ties
	if tweak_data.ACPConfig.Grenade_Refill then
		if AmmoBagBase then
			function AmmoBagBase:_take_ammo( unit )
				local taken = 0
				local inventory = unit:inventory()
				if inventory then
					local n = 0
					for _,weapon in pairs( inventory:available_selections() ) do
						-- An empty weapon is worth 2 nades
						if weapon.unit:base():out_of_ammo() then
							n = n + 2
						-- If the weapon is not empty, but also not full, it is worth 1 nade
						elseif not weapon.unit:base():ammo_full() then
							n = n + 1
						end
					end
					-- In-case of both weapons being empty, the most nades we can get is still 3
					if n > 3 then n = 3 end
					if n > 0 then managers.player:add_grenade_amount(n) end
					for _,weapon in pairs( inventory:available_selections() ) do
						local took = weapon.unit:base():add_ammo_from_bag( self._ammo_amount )
						taken = taken + took
						self._ammo_amount = self._ammo_amount - took
						if self._ammo_amount <= 0 then
							self:_set_empty()
							return taken
						end
					end
				end
				return taken
			end
		end
	end
			
	-- No flashbangs
	if tweak_data.ACPConfig.No_Flashbangs then
		function CoreEnvironmentControllerManager:set_flashbang( flashbang_pos, line_of_sight, travel_dis, linear_dis ) end
	end

	-- Remove Escape Timers
	if tweak_data.ACPConfig.No_Escape_Timer then
		if managers.job:current_level_id() ~= "kosugi" then
			function ElementPointOfNoReturn:on_executed(...) end
		end
	end

	-- Resist arrest
	if not Interception then return end
	local _arrestedUpdate = Interception.Backup(PlayerArrested, "update")
	function PlayerArrested:update( t, dt )
		_arrestedUpdate(self, t, dt)
		managers.player:set_player_state( "standard" )
	end

	-- Prevent Panic Button
	if tweak_data.ACPConfig.Prevent_Panic_Button then
		local prevent_panic_buttons = function()
			CopMovement._actionRequest = backuper:backup('CopMovement.action_request')
			function CopMovement:action_request( action_desc )
				if action_desc.variant == "run" then return false end
				return CopMovement._actionRequest(self, action_desc)
			end
		end
	end
end