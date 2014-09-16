if tweak_data and tweak_data.ACPConfig.Persistent_Crosshair then
	local crosshair_init		--Crosshair
	local hit_init				--Hit confirmation indicator
	local headshot_init			--Headshot confirmation indicator. Default uses same texture as hit confirm, and is not used by the vanilla game
	local crit_init				--Critical hit confirmation indicator. Default has a unique texture, but is not used by the vanilla game

	crosshair_init = {
		civilian = {
			{ scale = 1.2, alpha = 0.7, texture = "dot", color = Color.green }
		},
		special_enemy = {
			{ scale = 1.2, alpha = 0.7, texture = "dot", color = Color.yellow }
		},
		normal_enemy = {
			{ scale = 1.2, alpha = 0.7, texture = "dot", color = Color.yellow }
		},
		no_target = {
			{ scale = 1.2, alpha = 0.7, texture = "dot", color = Color.blue }
		}
	}

	hit_init = {
		{ scale = 1.5, alpha = 5, texture = "dot", color = Color.red, duration = 0.5}
	}

	-----------------------------------------------------------------------------------------------------

	local PlayerMovement_update_original = PlayerMovement.update
	local PlayerMovement_init_original = PlayerMovement.init

	local function get_crosshair_by_ray(unit)
		local from = unit:movement():m_head_pos()
		local to = unit:camera():forward() * 20000
		mvector3.add(to, from)
		local unit_hit

		local ray = World:raycast("ray", from, to, "slot_mask", World:make_slot_mask(12, 21, 22, 33))	--Enemies and civilians
		if ray and ray.unit then
			if not World:raycast("ray", from, ray.hit_position, "slot_mask", managers.slot:get_mask( "AI_visibility" ), "ray_type", "ai_vision") then
				unit_hit = ray.unit
			end
		end
		
		local crosshair_name = "no_target"
		if unit_hit then
			if managers.enemy:is_civilian(unit_hit) then	--Civilian
				crosshair_name = "civilian"
			elseif managers.groupai:state():is_enemy_special(unit_hit) or (unit_hit:base() and unit_hit:base().tweak_table == "sniper") then	--Special enemy (or sniper)
				crosshair_name = "special_enemy"
			else	--Process of elimination; normal enemy
				crosshair_name = "normal_enemy"
			end
		end
		
		return crosshair_name
	end

	function PlayerMovement:update(...)
		PlayerMovement_update_original(self, ...)

		local in_steelsight = self._state_data.in_steelsight
		local weapon_category = self._unit:inventory():equipped_unit():base():weapon_tweak_data().category
		local weapon_name = self._unit:inventory():equipped_unit():base()._name_id
		local casing_mode = self._current_state_name == "mask_off"
		
		--Feel free to add some custom conditions for showing/hiding the crosshair in this function if you want to.
		--At the moment, it is always enabled on sniper rifles and LMGs, and  disabled for other weapons when you ADS.
		
		local crosshair_visible = not in_steelsight

		if crosshair_visible then
			managers.hud:select_crosshair(get_crosshair_by_ray(self._unit))
		end
		managers.hud:show_crosshair(crosshair_visible)
	end

	function PlayerMovement:init(...)
		PlayerMovement_init_original(self, ...)
		
		if managers.hud then
			managers.hud:setup_crosshair(crosshair_init, "no_target")
			managers.hud:setup_hit_confirm(hit_init, crit_init, headshot_init)
		end
	end
end