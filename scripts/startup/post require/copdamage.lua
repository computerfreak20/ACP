if tweak_data and tweak_data.ACPConfig then
	-- MESSIAH WITH ANY WEAPON
	if tweak_data.ACPConfig.Messiah_Any_Weapon then
		if CopDamage then
			if not _copdamagebullet then _copdamagebullet = CopDamage.damage_bullet end
			function CopDamage:damage_bullet( attack_data )
				local result = _copdamagebullet(self, attack_data)
				if result and result.type == "death" and attack_data.attacker_unit == managers.player:player_unit() then
					if attack_data.attacker_unit:character_damage():bleed_out() then
						if not self:_type_civilian( self._unit:base()._tweak_table ) then
							if managers.player:has_category_upgrade( "player", "pistol_revive_from_bleed_out" ) then
								if attack_data.attacker_unit:character_damage():consume_messiah_charge() then
									attack_data.attacker_unit:character_damage():revive( true )
								end
							end
						end
					end
				end
				return result
			end
		end
	end

	-- explosives damage multiplier
	if tweak_data.ACPConfig.Explosive_Damage_Multiplier then
		if not CopDamage.damage_explosion_original then
			CopDamage.damage_explosion_original = CopDamage.damage_explosion
		end
		function CopDamage:damage_explosion( attack_data )
			attack_data.damage = attack_data.damage * 5
			return self:damage_explosion_original( attack_data )
		end
	end
end