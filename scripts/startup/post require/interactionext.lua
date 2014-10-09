if tweak_data and tweak_data.ACPConfig then
	-- Increased interact distance (except on cameras, shaped charges, body bags, burn money & place camera [Firestarters job], or trip mines)
	if tweak_data.ACPConfig.Increased_Int_Distance then
		function BaseInteractionExt:interact_distance()
			local int = self.tweak_data
			if int == "access_camera"
				or int == "shaped_sharge"
				or tostring(self._unit:name()) == "Idstring(@ID14f05c3d9ebb44b6@)"
				or int == "burning_money"
				or int == "drill"
				or int == "open_from_inside"
				or int == "lance"
				or int == "lance_upgrade"
				or int == "stn_int_place_camera"
				or int == "big_computer_server"
				or int == "trip_mine" then
				return self._tweak_data.interact_distance or tweak_data.interaction.INTERACT_DISTANCE
			end
			return 300 -- default is 200
		end
	end

	-- Increased Camera Loop Duration
	if tweak_data.ACPConfig.Increased_Loop_Time then
		tweak_data.upgrades.values.player.tape_loop_duration = {30, 30}
	end

	-- Infinite Number of Camera Loops
	if tweak_data.ACPConfig.Infinite_Camera_Loops then
		function SecurityCameraInteractionExt:_interact_blocked(player)
			SecurityCamera.active_tape_loop_unit = false
		end
	end

	-- Increased interaction speed
	if tweak_data.ACPConfig.Increased_Int_Speed then
		if not __BaseInteractionExtOriginalTimer then __BaseInteractionExtOriginalTimer = BaseInteractionExt._get_timer end
		function BaseInteractionExt:_get_timer()
			local int = self.tweak_data
			if int == "hold_take_painting" 
				or int == "cut_fence"
				or int == "gage_assignment"
				or int == "pickup_phone"
				or int == "pickup_tablet"
				or int == "hostage_move"
				or int == "stash_server_pickup"
				or int == "grenade_briefcase"
				or int == "requires_ecm_jammer"
				or int == "requires_ecm_jammer_atm"
				or int == "shelf_sliding_suburbia"
				or int == "pick_lock_easy_no_skill"
				or int == "use_server_device"
				or int == "use_computer"
				or int == "hold_take_gas_can"
				or int == "breach_door"
				or int == "weapon_case"
				or int == "open_door_with_keys"
				or int == "hostage_stay"
				or int == "bodybags_bag"
				or int == "hold_place_gps_tracker"
				or int == "invisible_interaction_open"
				or int == "painting_carry_drop"
				or int == "sewer_manhole"
				or int == "steal_methbag"
				or int == "grenade_crate"
				or int == "cash_register"
				or int == "money_briefcase"
				or int == "open_slash_close"
				or int == "open_slash_close_act"
				or int == "gasoline"
				or int == "hostage_convert"
				or int == "hospital_security_cable"
				or int == "open_slash_close_sec_box"
				or int == "pick_lock_easy"
				or int == "carry_drop" then
				return 0.01
			elseif int == "hold_take_server"
				or int == "corpse_dispose"
				or int == "crate_loot_close"
				or int == "rewire_timelock"
				or int == "breach_door"
				or int == "crate_loot_crowbar" then
				return 0.75
			elseif int == "shaped_sharge" 
				or int == "stash_planks"
				or int == "stash_planks_pickup"
				or int == "c4_diffusible"
				or int == "money_small_take"
				or int == "pick_lock_x_axis"
				or int == "hold_open_vault"
				or int == "votingmachine2"
				or int == "c4_special"
				or int == "barricade_fence"
				or int == "sc_tape_loop" then
				return 1.5
			elseif int == "pick_lock_hard_no_skill" then
				return 2.5
			elseif int == "lance_jammed"
				or int == "lance_upgrade"
				or int == "hack_numpad"
				or int == "pick_lock_deposit_transport"
				or int == "drill_upgrade"
				or int == "revive"
				or int == "drill_jammed" then
				return 4
			elseif int == "pick_lock_hard" 
				or int == "gen_int_thermite_apply" then
				return 10
			else
				return __BaseInteractionExtOriginalTimer (self)
			end
		end
	end
end