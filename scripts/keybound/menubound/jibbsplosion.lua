if tweak_data and tweak_data.ACPConfig then
	-- Jibb'splosion mode, dis shit can get hard @_@
	function startevildozer()
		local BossBulldozer = class()
		
		function BossBulldozer:init()
		self.start = true
		self.count = 0
		self.count_2 = 0
		self:spawn()
		if tweak_data.ACPConfig.MORE_DAKKA then
			PlayMediaQueued("scripts/keybound/menubound/jibb.mp3")
		end
		for i=1,2 do
		self:spawn_bags(i)
		end
		end
		function CopLogicIdle._chk_relocate( data )
		if data.objective and data.objective.type == "follow" then
			if data.is_converted then
				if TeamAILogicIdle._check_should_relocate( data, data.internal_data, data.objective ) then
				data.objective.in_place = nil
				CopLogicIdle._exit( data.unit, "travel" )
				return true
				end
			return
			end
				
			local relocate = false
			local follow_unit = data.objective.follow_unit
			local advance_pos = follow_unit:brain() and follow_unit:brain():is_advancing()
			local follow_unit_pos = advance_pos or data.m_pos
			if data.objective.relocated_to and mvector3.equal( data.objective.relocated_to, follow_unit_pos ) then
			-- we have already relocated to this pos
			return
			end
			relocate = true
			if not relocate then
				local ray_params = {
				tracker_from = data.unit:movement():nav_tracker(),
				pos_to = follow_unit_pos
				}
				local ray_res = managers.navigation:raycast( ray_params )
					if ray_res then
					--print( "relocating due to obstacle" )
					relocate = true
					end
			end
				if relocate then
					data.objective.in_place = nil
					data.objective.nav_seg = follow_unit:movement():nav_tracker():nav_segment()
					data.objective.relocated_to = mvector3.copy( follow_unit_pos )
					CopLogicBase._exit( data.unit, "travel" )
					return true
				end
		end
		end
		
		function GroupAIStateBase:on_police_called( called_reason ) end
		function CivilianLogicFlee.clbk_chk_call_the_police( ignore_this, data ) end
		if managers.groupai.state then
			managers.groupai:state()._whisper_mode = false
		end
		function CopDamage:_comment_death( unit, type )	end
		function CopDamage:_AI_comment_death( unit, type )	end

		
		function BossBulldozer:follow_unit()
		local new_objective
		local valid_criminals = {}
		for pl_key, pl_record in pairs( managers.groupai:state():all_player_criminals() ) do
		if pl_record.status ~= "dead" then
		table.insert( valid_criminals, pl_key )
		end
		end
		if #valid_criminals > 0 then
		local follow_unit = managers.groupai:state():all_player_criminals()[ valid_criminals[ math.random( #valid_criminals ) ] ].unit -- pick a random player
		new_objective = { type = "follow", follow_unit = follow_unit, scan = true, is_default = true}
		end
		return new_objective
		end
		
		function BossBulldozer:spawn_bags(i)
		self._pos = (i == 1 and Vector3( -3247.38, -248.782, 84.6494) or Vector3( -5093.23, 3254.08, 1.10006))
		self._rot = managers.player:player_unit():rotation()
		self._ammo_upgrade_lvl = managers.player:upgrade_level( "ammo_bag", "ammo_increase" )
		self.ammo = AmmoBagBase.spawn( self._pos, self._rot, self._ammo_upgrade_lvl )
		end
		
		function BossBulldozer:spawn(pos)
		self._unit_name = Idstring( "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
		self._pos = pos or Vector3(-1556, -784, 0)
		self._rot = managers.player:player_unit():rotation()
		self._spawn_ai = { init_state = "attack", objective = self:follow_unit() }
		self.unit_bulld = World:spawn_unit( self._unit_name, self._pos, self._rot )
		self.unit_bulld:brain():set_spawn_ai( self._spawn_ai )
		self.unit_bulld:base().bulld = true
		end
		
		function BossBulldozer:all_skills(i)
		if i == 1 then
		for i=1,2 do
		self:call_cops(i, (self.count >= 7 and false or true))
		end
		elseif i == 2 then
		self:teleport()
		elseif i == 3 then
		for i=1,2 do
		self:spawn_clone(i)
		end end end
		
		function BossBulldozer:activate_random_skill()
		if self.count_2 < 2 and self.count >= 5 then
		self._random = math.random(1,3)
		self.count_2 = self.count_2 + 1
		else
		self._random = math.random(1,2)
		end
		self:all_skills(self._random)
		end	
		
		function BossBulldozer:call_cops(i, type)
		self._unit_name = (type and Idstring( "units/payday2/characters/ene_shield_1/ene_shield_1") or Idstring( "units/payday2/characters/ene_shield_1/ene_shield_1"))
		self._pos = (i == 1 and self.unit_bulld:position() + Vector3(100,0,0) or self.unit_bulld:position() - Vector3(100,0,0))
		self._rot = self.unit_bulld:rotation()
		self.unit_swat = World:spawn_unit( self._unit_name, self._pos, self._rot )
		--self.unit_swat:base():set_contour( true )
		--self.unit_swat:network():send( "set_contour", true )
		end	

		
		function BossBulldozer:spawn_clone(i)
		self._unit_name = Idstring( "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
		self._pos = (i == 1 and self.unit_bulld:position() + Vector3(100,0,0) or self.unit_bulld:position() - Vector3(100,0,0))
		self._rot = self.unit_bulld:rotation()
		self._spawn_ai = { init_state = "attack", objective = self:follow_unit() }
		self.unit_bulld = World:spawn_unit( self._unit_name, self._pos, self._rot )
		self.unit_bulld:brain():set_spawn_ai( self._spawn_ai )
		self.unit_bulld:base().bulld = true
		end	
		
		function CopDamage:health()
		return self._health
		end

		function BossBulldozer:teleport()
		local valid_criminals = {}
		for pl_key, pl_record in pairs( managers.groupai:state():all_player_criminals() ) do
		if pl_record.status ~= "dead" then
		table.insert( valid_criminals, pl_key )
		end
		end
		if #valid_criminals > 0 then
		self._unit = managers.groupai:state():all_player_criminals()[ valid_criminals[ math.random( #valid_criminals ) ] ].unit -- pick a random player
		end
		World:delete_unit(self.unit_bulld)
		self:spawn(self._unit:position())
		end

		local _deadCop = CopDamage.die 
		function CopDamage:die( ... )
		if tweak_data.ACPConfig.Infinite_Dozers then
			if self._unit:base().bulld and self._unit:name() == Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3") and BossBulldozer.count < 99999 then
			BossBulldozer.count = BossBulldozer.count + 1
			BossBulldozer:spawn(self._unit:position())
			end
		else
			if self._unit:base().bulld and self._unit:name() == Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3") and BossBulldozer.count < 100 then
			BossBulldozer.count = BossBulldozer.count + 1
			BossBulldozer:spawn(self._unit:position())
			end
		end		
		local result = _deadCop( self, ... )
		self._unit:set_slot( 0 ) 
		managers.network:session():send_to_peers_synched( "remove_unit", self._unit )
		return result
		end 
		
		BossBulldozer:init()
	end
	local function destroy_unit(unit)
		if unit:character_damage():pickup() and unit:character_damage():pickup()  ~= "ammo" then
			unit:character_damage():drop_pickup()
		end
		World:delete_unit(unit)
	end
	numapocalypse = numapocalypse or function()
		for u_key, u_data in pairs(managers.enemy:all_enemies()) do
			destroy_unit(u_data.unit)
		end

		for u_key, u_data in pairs(managers.enemy:all_civilians()) do
			destroy_unit(u_data.unit)
		end

		for _, cam_unit in ipairs(SecurityCamera.cameras) do
			if cam_unit:enabled() then
				cam_unit:base():set_detection_enabled(false)
	end end end
	if isHost() then
		numapocalypse()
		startevildozer()
		showHint("Jibbsplosion Activated",3)
	else
		showHint("You're not the Host, dumbass.",3)
	end
end