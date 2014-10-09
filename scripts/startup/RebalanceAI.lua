if tweak_data and tweak_data.ACPConfig.Rebalance_AI then
	-- TEAM LOGIC CHECKS
	if not TeamAILogicTravel then return end

	-- 3 AI
	CriminalsManager = CriminalsManager or class()
	if tweak_data.ACPConfig.Number_of_AI <= 3 and tweak_data.ACPConfig.Number_of_AI >= 0 then
		CriminalsManager.MAX_NR_TEAM_AI = tweak_data.ACPConfig.Number_of_AI
	end

	-- AI IPROVEMENTS
	 function TeamAILogicTravel.update( data )
	 local unit = data.unit
	 local objective = data.objective
	 
	 if not objective then
	  TeamAILogicIdle.on_new_objective( data, nil )
	  return
	 end
	 
	 local my_data = data.internal_data
	 local t = data.t
	 
	 if my_data.processing_advance_path or my_data.processing_coarse_path then
	  TeamAILogicTravel._upd_pathing( data, my_data )
	  if my_data ~= data.internal_data then
	   return
	  end
	 elseif my_data.advancing then
	  if data.objective.type == "follow" then
	   if (not unit:movement():chk_action_forbidden("walk") or unit:anim_data().act_idle) then
		local follow_unit_nav_seg = data.objective.follow_unit:movement():nav_tracker():nav_segment()
		if follow_unit_nav_seg ~= my_data.coarse_path[ my_data.coarse_path_index + 1 ][1] or my_data.coarse_path_index ~= #my_data.coarse_path - 1 then -- we are not moving to the follow_unit's nav_segment
		 local my_nav_seg = data.unit:movement():nav_tracker():nav_segment()
		 if follow_unit_nav_seg == my_nav_seg then
		  --debug_pause_unit( data.unit, "Im next to my follow unit. STOP! follow_unit_nav_seg", follow_unit_nav_seg, "my_data.coarse_path", inspect( my_data.coarse_path ), "my_data.coarse_path_index", my_data.coarse_path_index )
		  objective.in_place = true -- we have reached the objective area
		  TeamAILogicTravel.on_new_objective( data ) -- re-evaluate our objective
		  return
		 end
		end
	   end
	  end
	 elseif my_data.cover_leave_t then -- waiting in cover
	  if not my_data.turning and (not unit:movement():chk_action_forbidden("walk") or not (not unit:anim_data().act_idle)) then
	   if t > my_data.cover_leave_t then
		my_data.cover_leave_t = nil
	   elseif my_data.best_cover then
		local action_taken
		if not unit:movement():attention() then
		 action_taken = CopLogicTravel._chk_request_action_turn_to_cover( data, my_data )
		end
		if not action_taken then
		 if not ( my_data.best_cover[4] or unit:anim_data().crouch or data.unit:movement():cool() ) then
		  CopLogicAttack._chk_request_action_stand( data )
		 end
		end
	   end
	  end
	 elseif my_data.advance_path then
	  if (not unit:movement():chk_action_forbidden("walk") or unit:anim_data().act_idle) then
	   local haste, no_strafe
	   if objective and objective.haste then
		haste = objective.haste
	   elseif unit:movement():cool() then
		haste = "walk"
	   else
		haste = "run"
	   end
	  
	   CopLogicTravel._chk_request_action_walk_to_advance_pos( data, my_data, haste, objective and objective.rot, no_strafe )
	   if my_data.advancing then
		TeamAILogicTravel._check_start_path_ahead( data )
	   end
	  end
	 elseif objective then
	  if my_data.coarse_path then
	   local coarse_path = my_data.coarse_path
	   local cur_index = my_data.coarse_path_index
	   local total_nav_points = #coarse_path
	   if cur_index == total_nav_points then  -- We have reached the final nav point. The area is investigated.
		objective.in_place = true -- we have reached the objective area
		if objective.type == "investigate_area" or objective.type == "free" then
		 if not objective.action_duration then
		  managers.groupai:state():on_criminal_objective_complete( unit, objective )
		  return
		 end
		end
		TeamAILogicTravel.on_new_objective( data ) -- re-evaluate our objective
		return
	   else
		local to_pos = TeamAILogicTravel._get_exact_move_pos( data, cur_index + 1 )
		my_data.advance_path_search_id = tostring( data.key ).."advance"
		my_data.processing_advance_path = true
		local prio
		if objective and objective.follow_unit then
		 prio = 5
		end
		local nav_segs = CopLogicTravel._get_allowed_travel_nav_segs( data, my_data, to_pos )
		unit:brain():search_for_path( my_data.advance_path_search_id, to_pos, prio, nil, nav_segs )
	   end
	  else
	   local search_id = tostring( unit:key() ).."coarse"
	   local nav_seg
	   if objective.follow_unit then
		nav_seg = objective.follow_unit:movement():nav_tracker():nav_segment()
	   else
		nav_seg = objective.nav_seg
	   end
	   if unit:brain():search_for_coarse_path( search_id, nav_seg ) then
		my_data.coarse_path_search_id = search_id
		my_data.processing_coarse_path = true
	   end
	  end
	 else
	  CopLogicBase._exit( data.unit, "idle", { scan = true } )
	  return
	 end
	  local action_taken = data.unit:movement():chk_action_forbidden("walk") and not unit:anim_data().act_idle
	 local want_to_take_cover = TeamAILogicTravel._chk_wants_to_take_cover( data, my_data )
	 
	 -- Check if we should crouch or stand
	 if not action_taken then
	  if want_to_take_cover or data.char_tweak.no_stand then  -- I do not have cover or my cover is low and I am not crouched
	   if not unit:anim_data().crouch then
		action_taken = CopLogicAttack._chk_request_action_crouch( data )  --Is bugged with Stand, testing with stand, but probably will have to just use crouch.  Has bugged animations with stand.
	   end
	  elseif unit:anim_data().crouch then
	   if not data.char_tweak.allow_crouch then
		action_taken = CopLogicAttack._chk_request_action_stand( data )
	   end
	  end
	 end
	end
	 -----------------------------------------------------------------------------
	 function TeamAILogicAssault.update( data )
	 local my_data = data.internal_data
	 local t = data.t
	 local unit = data.unit
	 local focus_enemy = data.attention_obj
	 local in_cover = my_data.in_cover
	 local best_cover = my_data.best_cover
	 
	 CopLogicAttack._process_pathing_results( data, my_data )
	 
	 local focus_enemy = data.attention_obj
	 if not focus_enemy or focus_enemy.reaction < AIAttentionObject.REACT_AIM then
	  TeamAILogicAssault._upd_enemy_detection( data, true ) -- second param means it is not called as a queued task
	  if my_data ~= data.internal_data or not data.attention_obj or data.attention_obj.reaction <= AIAttentionObject.REACT_SCARED then
	   return
	  end
	  focus_enemy = data.attention_obj -- we found an enemy
	 end
	 
	 local enemy_visible = focus_enemy.verified
	 
	 local action_taken = my_data.turning or data.unit:movement():chk_action_forbidden( "walk" ) or my_data.moving_to_cover or my_data.walking_to_cover_shoot_pos or my_data._turning_to_intimidate
	 
	 my_data.want_to_take_cover = CopLogicAttack._chk_wants_to_take_cover( data, my_data ) -- out of ammo, suppressed etc
	 local want_to_take_cover = my_data.want_to_take_cover
	 
	 if not action_taken then
	  if want_to_take_cover and ( not in_cover or not in_cover[4] ) or data.char_tweak.no_stand then  -- I do not have cover or my cover is low and I am not crouched
	   if not unit:anim_data().crouch then
		action_taken = CopLogicAttack._chk_request_action_stand( data )
	   end
	  elseif unit:anim_data().crouch then
	   if not data.char_tweak.allow_crouch or my_data.cover_test_step > 2 then
		action_taken = CopLogicAttack._chk_request_action_stand( data )
	   end
	  end
	 end
	 
	 local move_to_cover
	 
	 if action_taken then
	 elseif want_to_take_cover then -- we don't want trouble
	  move_to_cover = true
	 end
	 
	 if not ( my_data.processing_cover_path or my_data.cover_path or my_data.charge_path_search_id or action_taken )
	  and best_cover
	  and ( not in_cover or best_cover[1] ~= in_cover[1] )
	 then
	  CopLogicAttack._cancel_cover_pathing( data, my_data )
	  local search_id = tostring( unit:key() ).."cover"
	  if data.unit:brain():search_for_path_to_cover( search_id, best_cover[1], best_cover[5] ) then
	   my_data.cover_path_search_id = search_id
	   my_data.processing_cover_path = best_cover
	  end
	 end
	 
	 if not action_taken and move_to_cover and my_data.cover_path then
	  action_taken = CopLogicAttack._chk_request_action_walk_to_cover( data, my_data )
	 end
	 
	 if not data.objective and ( not data.path_fail_t or data.t - data.path_fail_t > 6 ) then
	  managers.groupai:state():on_criminal_jobless( unit )
	  if my_data ~= data.internal_data then
	   return
	  end
	 end
	 
	 if data.t > my_data.cover_chk_t then
	  CopLogicAttack._update_cover( data )
	  my_data.cover_chk_t = data.t + TeamAILogicAssault._COVER_CHK_INTERVAL
	 end
	end
	if tweak_data.ACPConfig.Force_Revive_PO then
		tweak_data.character.russian.deathguard = nil
		tweak_data.character.spanish.deathguard = nil
		tweak_data.character.american.deathguard = nil
		tweak_data.character.german.deathguard = nil
	end
	if tweak_data.ACPConfig.AI_Dodge_Ability then
		tweak_data.character.russian.dodge = tweak_data.character.presets.dodge.athletic
		tweak_data.character.spanish.dodge = tweak_data.character.presets.dodge.athletic
		tweak_data.character.american.dodge = tweak_data.character.presets.dodge.athletic
		tweak_data.character.german.dodge = tweak_data.character.presets.dodge.athletic
	end
	if tweak_data.ACPConfig.AI_Run_Speed then
		tweak_data.character.russian.move_speed = tweak_data.character.presets.move_speed.lightning
		tweak_data.character.german.move_speed = tweak_data.character.presets.move_speed.lightning
		tweak_data.character.spanish.move_speed = tweak_data.character.presets.move_speed.lightning
		tweak_data.character.american.move_speed = tweak_data.character.presets.move_speed.lightning
	end
	tweak_data.character.presets.gang_member_damage.REGENERATE_TIME = 0.2         -- Amount of time to pass before regenerate
	tweak_data.character.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.1      -- Amount of time to pass before regenerate when this criminal is far away from players
	tweak_data.character.presets.gang_member_damage.HEALTH_INIT = tweak_data.ACPConfig.AI_Initial_Health  --Amount of health Team Ai have before getting downed.  (Default is 75)
	tweak_data.character.presets.gang_member_damage.DOWNED_TIME = 60 --(Amount of time in down until "dead", default is 30)
	tweak_data.character.presets.gang_member_damage.ARRESTED_TIME = 60     -- Amount of time in arrest before "dead" (Default is 60)
	tweak_data.character.presets.gang_member_damage.INCAPACITATED_TIME = 60 --(Amount of time in down until "dead", default is 30)
end
	
-- Cloaker Arrest Team AI on Takedown
if tweak_data and tweak_data.ACPConfig.AI_Cloaker_Arrest then
	if not TeamAIMovement then return end
	function TeamAIMovement:on_SPOOCed()
		self._unit:brain():set_logic( "surrender" )
		self._unit:network():send( "arrested" )
		self._unit:character_damage():on_arrested()
	end
end