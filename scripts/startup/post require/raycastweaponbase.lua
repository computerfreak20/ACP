local NO_POINTLESS_PICKUPS = true --Don't pick up dropped ammo if your only non-full weapon can't be refilled (e.g. saw)
local ENABLE_CUSTOM_FL = true --Enabled aced fully loaded for mods with custom ammo pickup values
local ENABLE_SPILLOVER = true --Stack fractional pickups instead of rounding

function RaycastWeaponBase:add_ammo()
	if self:ammo_max() or (NO_POINTLESS_PICKUPS and self._ammo_pickup[1] == 0 and self._ammo_pickup[2] == 0) then
		return false
	end
	
	local multiplier_min = 1
	local multiplier_max = 1
	
	if self._ammo_data and self._ammo_data.ammo_pickup_min_mul then
		multiplier_min = multiplier_min * self._ammo_data.ammo_pickup_min_mul
	end
	if not (self._ammo_data and self._ammo_data.ammo_pickup_min_mul) or ENABLE_CUSTOM_FL then
		multiplier_min = multiplier_min * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
	end

	if self._ammo_data and self._ammo_data.ammo_pickup_max_mul then
		multiplier_max = multiplier_max * self._ammo_data.ammo_pickup_max_mul
	end
	if not (self._ammo_data and self._ammo_data.ammo_pickup_max_mul) or ENABLE_CUSTOM_FL then
		multiplier_max = multiplier_max * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
	end
	
	local pickup_roll = math.lerp(self._ammo_pickup[1] * multiplier_min, self._ammo_pickup[2] * multiplier_max, math.random())
	self._pickup_spillover = math.max(0, (self._pickup_spillover or 0) + (ENABLE_SPILLOVER and pickup_roll or math.round(pickup_roll)))
	local add_amount = math.floor(self._pickup_spillover)
	self._pickup_spillover = self._pickup_spillover - add_amount
	self:set_ammo_total(math.clamp(self:get_ammo_total() + add_amount, 0, self:get_ammo_max()))
	return true
end