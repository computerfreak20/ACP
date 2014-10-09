-- Interact Through Walls
if tweak_data and tweak_data.ACPConfig.Interact_Thru_Walls then
	if not ObjectInteractionManager then return end
	function ObjectInteractionManager:interact( player )
		if( alive( self._active_object ) ) then
			local interacted,timer = self._active_object:interaction():interact_start( player )
			if timer then
				self._active_object_locked_data = true
			end
			return interacted or interacted == nil or false, timer, self._active_object
		end
		return false
	end

	local mvec1 = Vector3()
	function ObjectInteractionManager:_update_targeted( player_pos, player_unit )    
		local mvec3_dis = mvector3.distance
		if( #self._close_objects > 0 ) then
			for k, v in pairs( self._close_objects ) do    
				if( alive( v ) and v:interaction():active() ) then
					if mvec3_dis( player_pos, v:interaction():interact_position() ) > v:interaction():interact_distance() then
						table.remove( self._close_objects, k )
					end
				else
					table.remove( self._close_objects, k )
		end    end    end
		
		for i = 1, self._close_freq, 1 do
			if( self._close_index >= self._interactive_count ) then
				self._close_index = 1
			else
				self._close_index = self._close_index + 1
			end
			local obj = self._interactive_objects[ self._close_index ]
			if( alive(obj) and obj:interaction():active() and not self:_in_close_list( obj ) ) then
				if( mvec3_dis(player_pos, obj:interaction():interact_position()) <= obj:interaction():interact_distance()  ) then
					table.insert( self._close_objects, obj )
		end    end    end
			
		local locked = false
		if self._active_object_locked_data then
			if not alive( self._active_object ) or not self._active_object:interaction():active() then
				self._active_object_locked_data = nil  
			else
				locked = ( mvec3_dis(player_pos, self._active_object:interaction():interact_position()) <= self._active_object:interaction():interact_distance() )
		end    end
		
		if locked then
			return
		end
		local last_active = self._active_object
		local blocked = player_unit:movement():object_interaction_blocked()
		if( #self._close_objects > 0 ) and not blocked then
			--find the one the player is looking at
			local active_obj = nil
			local current_dot = 0.9
			local player_fwd = player_unit:camera():forward()
			local camera_pos = player_unit:camera():position()
			tweak_data.interaction.open_from_inside.interact_distance = 0
			for k, v in pairs( self._close_objects ) do
				if( alive( v ) ) then
					mvector3.set( mvec1, v:interaction():interact_position() )
					mvector3.subtract( mvec1, camera_pos )
					mvector3.normalize( mvec1 )
					local dot = mvector3.dot( player_fwd, mvec1 )
					if( dot > current_dot ) then
						current_dot = dot
						active_obj = v
			end end end
			
			if( active_obj and self._active_object ~= active_obj ) then
				if alive( self._active_object ) then
					self._active_object:interaction():unselect()
				end
				if not active_obj:interaction():selected( player_unit ) then
					active_obj = nil
			end    end
			self._active_object = active_obj
		else
			self._active_object = nil
		end
		-- unselect the last one
		if( alive( last_active ) ) then
			if( not self._active_object ) then
				self._active_object = nil
				last_active:interaction():unselect()
	end    end    end
end