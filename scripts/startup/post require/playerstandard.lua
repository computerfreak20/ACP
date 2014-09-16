if tweak_data and tweak_data.ACPConfig then
	-- REVIVE SHOUT FIRST TRY
	if tweak_data.ACPConfig.Revive_First_Shout then
		if PlayerStandard then
			if not _startActionIntimidate then _startActionIntimidate = PlayerStandard._start_action_intimidate end
			function PlayerStandard:_start_action_intimidate( t )
				if not self._intimidate_t or t - self._intimidate_t > tweak_data.player.movement_state.interaction_delay then
					local skip_alert = managers.groupai:state():whisper_mode()
					local voice_type, plural, prime_target = self:_get_unit_intimidation_action( true, true, true, false, true, nil, nil, nil )
					if voice_type == "revive" then
						local static_data = managers.criminals:character_static_data_by_unit( prime_target.unit )
						if not static_data then return end
						prime_target.unit:interaction():interact( self._unit )
						self._ext_movement:rally_skill_data().morale_boost_delay_t = managers.player:player_timer():time() + ( self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5 )
						self:_do_action_intimidate(t, "cmd_get_up", "f36x_any", skip_alert)
					else _startActionIntimidate(self, t) end
				end
			end
		end
	end

	--Interact While Looking Around--
	if tweak_data.ACPConfig.Interact_Lookaround then
		if not PlayerStandard then return end
		if not _intlookcat then _intlookcat = PlayerStandard._check_action_interact
		end 
		function PlayerStandard:_check_action_interact( t, input )
			local new_action,timer,interact_object
			local interaction_wanted = input.btn_interact_press
			self._unit:base():set_slot( self._unit, 4 )
			if interaction_wanted then
				local action_forbidden = self:chk_action_forbidden( "interact" ) 
				or self._unit:base():stats_screen_visible() 
				or self:_interacting() 
				or self._ext_movement:has_carry_restriction()
				or self:is_deploying()
				or self:_changing_weapon()
				if not action_forbidden then	
					new_action,timer,interact_object = managers.interaction:interact( self._unit )
					if new_action then
						self:_play_interact_redirect( t, input )
					end
					if timer then
						new_action = true
						self:_start_action_interact( t, input, timer, interact_object )
					end
					new_action = new_action or self:_start_action_intimidate( t )
				end
			end
			if input.btn_interact_release then
				self:_interupt_action_interact()
			end
			return new_action
		end
	end

	--DONT SHOUT AT TIED CIVS
	if tweak_data.ACPConfig.No_Shout_At_Hostages then
		PlayerStandard.__get_unit_intimidation_action = PlayerStandard.__get_unit_intimidation_action or PlayerStandard._get_unit_intimidation_action
		 
		function PlayerStandard:_get_unit_intimidation_action(...)
				local args = {...}
				if args[2] then
						for k,v in pairs( managers.enemy:all_civilians() ) do
								if v.unit:in_slot( 21 ) and v.unit:anim_data().tied then
										v.unit:set_slot( 22 )
								end
						end
				end
				return self:__get_unit_intimidation_action(...)
		end
	end

	--Sprint in every direction
	if tweak_data.ACPConfig.Sprint_Every_Direction then
		function PlayerStandard:_can_run_directional() return true 
		end
	end
end