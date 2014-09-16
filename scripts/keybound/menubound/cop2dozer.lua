--Cop2Dozer--
function spawn_bulldozer(position, rotation)
	local unit_name = Idstring( "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3" )
	local spawn_ai = { init_state = "attack" }
	local unit = World:spawn_unit( unit_name, position, rotation )
	unit:base().bulldozer = true
	unit:movement():set_character_anim_variables()
	unit:brain():set_spawn_ai( spawn_ai )
	unit:brain():set_active( true )
end

bullcop = bullcop or function()
	if isHost() then
		if not CopDamage_die_original then CopDamage_die_original = CopDamage.die end
		function CopDamage:die( variant )
			return CopDamage_die_original(self, variant)
		end
		
		function CopDamage:die( ... )
			if not self._unit:base().bulldozer then
				spawn_bulldozer(self._unit:position(), self._unit:rotation())
			end

			local result = CopDamage_die_original( self, ... )
			return result
		end
	end
end
if isHost() then
	bullcop()
	showHint("Cop2Dozer Activated",3)
else
	showHint("You're not the Host, dumbass",3)
end