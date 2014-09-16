if tweak_data and tweak_data.ACPConfig then
	-- Civilian Brain Check (Follow Distance)
	if tweak_data.ACPConfig.Hostage_Follow_Distance then
		function CivilianBrain:on_hostage_move_interaction( interacting_unit, command )
			if not self._logic_data.is_tied then
				return
			end
			
			if command == "move" then
				local following_hostages = managers.groupai:state():get_following_hostages( interacting_unit )
				if following_hostages and table.size( following_hostages ) >= tweak_data.player.max_nr_following_hostages then
					return
				end
				
				if not self._unit:anim_data().drop and self._unit:anim_data().tied then
					return
				end
				
				local stand_action_desc = { type = "act", variant = "stand_tied", body_part = 1, clamp_to_graph = true }
				local action = self._unit:movement():action_request( stand_action_desc )
				if not action then
					return
				end
				
				self._unit:movement():set_stance( "cbt" )
				
				local follow_objective = {
					type = "follow",
					follow_unit = interacting_unit,
					nav_seg = interacting_unit:movement():nav_tracker():nav_segment(),
					
					interrupt_dis = 0,
					interrupt_health = 0,
					loose_track_dis = 20000,
					distance = 500,
					stance = "cbt",
					fail_clbk = callback( self, self, "on_hostage_follow_objective_failed" )
				}
				
				self:set_objective( follow_objective )
				
				self._unit:interaction():set_tweak_data( "hostage_stay" )
				self._unit:interaction():set_active( true, true )
				
				interacting_unit:sound():say( "f38_any", false, true )
				
				self._following_hostage_contour_id = self._unit:contour():add( "friendly", true )
				
				managers.groupai:state():on_hostage_follow( interacting_unit, self._unit, true )
				
			elseif command == "stay" then
				if not self._unit:anim_data().stand then
					return
				end
				
				self:set_objective( { type = "surrender", amount = 1, aggressor_unit = interacting_unit } )
				
				if not self._unit:anim_data().stand then
					return
				end
				
				local stand_action_desc = { type = "act", variant = "drop", body_part = 1, clamp_to_graph = true }
				local action = self._unit:movement():action_request( stand_action_desc )
				if not action then
					return
				end
				
				self._unit:movement():set_stance( "hos" )
				
				self._unit:interaction():set_tweak_data( "hostage_move" )
				self._unit:interaction():set_active( true, true )
				
				if alive( interacting_unit ) then
					interacting_unit:sound():say( "f02x_sin", false, true )
				end
				
				if self._following_hostage_contour_id then
					self._unit:contour():remove_by_id( self._following_hostage_contour_id, true )
					self._following_hostage_contour_id = nil
				end
				
				managers.groupai:state():on_hostage_follow( interacting_unit, self._unit, false )
				
			elseif command == "release" then
				self._logic_data.is_tied = nil
				
				self:set_objective( nil )
				
				local stand_action_desc = { type = "act", variant = "panic", body_part = 1 }
				local action = self._unit:movement():action_request( stand_action_desc )
				if not action then
					return
				end
				
				self._unit:interaction():set_tweak_data( "intimidate" )
				self._unit:interaction():set_active( false, true )
				
				if self._following_hostage_contour_id then
					self._unit:contour():remove_by_id( self._following_hostage_contour_id, true )
					self._following_hostage_contour_id = nil
				end
				
				managers.groupai:state():on_hostage_follow( interacting_unit, self._unit, false )
			end
			
			return true
		end
	end

	-- NO LIMIT HOSTAGES
	if tweak_data.ACPConfig.Hostage_Follow_Limit then
		tweak_data.player.max_nr_following_hostages = 500
		if following_hostages and table.size( following_hostages ) >= tweak_data.player.max_nr_following_hostages then
			return
		end
	end
end