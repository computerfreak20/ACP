if tweak_data and tweak_data.ACPConfig.Stop_Cloaker_Whine then
	_CopSound_play = _CopSound_play or CopSound.play 
	function CopSound:play( sound_name, source_name, sync ) 
		local event_id 
		if type( sound_name ) == "number" then 
			event_id = sound_name 
		else 
			event_id = SoundDevice:string_to_id( sound_name ) 
		end 
		 
		if event_id ~= SoundDevice:string_to_id( "cloaker_presence_loop" ) then 
			return _CopSound_play( self, sound_name, source_name, sync ) 
		end
		return 
	end
end