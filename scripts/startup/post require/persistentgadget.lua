if tweak_data and tweak_data.ACPConfig then
	if tweak_data.ACPConfig.Persistent_Gadget then
		if not _NewRaycastWeaponBase_on_equip then _NewRaycastWeaponBase_on_equip = NewRaycastWeaponBase.on_equip end
		function NewRaycastWeaponBase:on_equip()
			_NewRaycastWeaponBase_on_equip(self)
			self:set_gadget_on(self._stored_gadget_on or 0, false)
		end

		if not _NewRaycastWeaponBase_toggle_gadget then _NewRaycastWeaponBase_toggle_gadget = NewRaycastWeaponBase.toggle_gadget end
		function NewRaycastWeaponBase:toggle_gadget()
			if _NewRaycastWeaponBase_toggle_gadget(self) then
				self._stored_gadget_on = self._gadget_on
				return true
			end
		end
	end

	function RaycastWeaponBase:add_ammo()
		if self:ammo_max() then
			return false
		end

		local multiplier_min = 1 * (self._ammo_data and self._ammo_data.ammo_pickup_min_mul or 1) * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
		local multiplier_max = 1 * (self._ammo_data and self._ammo_data.ammo_pickup_max_mul or 1) * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)

		local add_amount = math.max(0, math.round(math.lerp(self._ammo_pickup[1] * multiplier_min, self._ammo_pickup[2] * multiplier_max, math.random())))
		self:set_ammo_total(math.clamp(self:get_ammo_total() + add_amount, 0, self:get_ammo_max()))
		return true
	end
end