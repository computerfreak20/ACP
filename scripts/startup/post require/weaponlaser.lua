local weapon_laser_update_orig = WeaponLaser.update
local sin = math.sin
function WeaponLaser:update(unit, t, dt)
        weapon_laser_update_orig(self, unit, t, dt)
    self._themes.rainbowlaser = {
        light = Color(sin(135 * t + 0) / 2 + 0.5, sin(140 * t + 60) / 2 + 0.5, sin(145 * t + 120) / 2 + 0.5) * 10,
        glow = Color(sin(135 * t + 0) / 2 + 0.5, sin(140 * t + 60) / 2 + 0.5, sin(145 * t + 120) / 2 + 0.5) / 2,
        brush = Color(0.5, sin(135 * t + 0) / 2 + 0.5, sin(140 * t + 60) / 2 + 0.5, sin(145 * t + 120) / 2 + 0.5)
    }
	if tweak_data and tweak_data.ACPConfig.All_Lasers_Rainbow then
		self:set_color_by_theme("rainbowlaser")
	else
		if not self._is_npc then
			self:set_color_by_theme("rainbowlaser")
		else
			self:set_color_by_theme("cop_sniper")
		end
	end
end