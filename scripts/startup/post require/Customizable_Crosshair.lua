if tweak_data and tweak_data.ACPConfig.Persistent_Crosshair then
	local HUDManager__setup_player_info_hud_pd2_original = HUDManager._setup_player_info_hud_pd2

	HUDCrosshairBase = HUDCrosshairBase or class()

	function HUDCrosshairBase:init(hud)
		self._hud_panel = hud.panel
		
		self._icon_table = {
			--Gage reticles
			dot = { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_s_1", suffix = "_il" },
			cross1 =  { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_2", suffix = "_il" },
			cross2 =  { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_3", suffix = "_il" },
			cross3 =  { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_4", suffix = "_il" },
			circle1 =  { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_5", suffix = "_il" },
			circle2 =  { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_6", suffix = "_il" },
			circle3 =  { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_7", suffix = "_il" },
			circle4 =  { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_8", suffix = "_il" },
			angle1 =  { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_9", suffix = "_il" },
			angle2 =  { texture = "units/pd2_dlc1/weapons/wpn_effects_textures/wpn_sight_reticle_10", suffix = "_il"},
			--Standard hit confirm
			hit_x = { scale = 0.5, texture = "guis/textures/pd2/hitconfirm", dynamic_color = true },
			hit_o = { scale = 0.5, texture = "guis/textures/pd2/hitconfirm_crit", dynamic_color = true }
		}
		self._texture_switch = {
			[Color.red] = "",
			[Color.yellow] = "_yellow",
			[Color.green] = "_green",
			[Color.blue] = "_blue"
		}
	end

	function HUDCrosshairBase:_clear_table(prefix, panel_table)
		for i = 1, #panel_table do
			local name = prefix .. "_" .. i
			if self._hud_panel:child(name) then
				self._hud_panel:remove(self._hud_panel:child(name))
			end
		end
		while #panel_table > 0 do table.remove(panel_table, 1) end
	end

	function HUDCrosshairBase:_create_bitmap_panel(name, texture, color, alpha, scale)
		local new_panel = self._hud_panel:bitmap({
			valign = "center",
			halign = "center",
			visible = false,
			name = name,
			texture = texture,
			color = color,
			layer = 0,
			alpha = math.clamp(alpha, 0, 1),
			h = math.round(50 * scale),
			w = math.round(50 * scale),
			blend_mode = "add"
		})
		new_panel:set_center(self._hud_panel:w() / 2, self._hud_panel:h() / 2)
		
		return new_panel
	end

	--Must provide non nil arguments for calls to this function, parameters are NOT checked. Call clear table before calling this
	function HUDCrosshairBase:_setup_panels(name, parts, panel_table, prefix)
		local i = 1
		for _, part in ipairs(parts) do
			local icon = self._icon_table[part.texture] or nil
			
			if icon then
				local texture = icon.dynamic_color and icon.texture or ((icon.prefix or "") .. icon.texture .. (self._texture_switch[part.color] or "") .. (icon.suffix or ""))
				local color = icon.dynamic_color and part.color or Color.white
				local scale = math.max((part.scale or 1) * (icon.scale or 1), 0)
				local alpha = math.max(part.alpha or 1, 0)
				local duration = math.max(part.duration or 0.25, 0)
		
				while alpha > 0 do
					local panel_name = (prefix and (prefix .. "_") or "") .. name .. "_" .. i
					local new_panel = self:_create_bitmap_panel(panel_name, texture, color, alpha, scale)
					local table_entry = (name == "crosshair" and new_panel) or { panel = new_panel, duration = duration, alpha = math.clamp(alpha, 0, 1) }
					table.insert(panel_table, i, table_entry)
					alpha = alpha - 1
					i = i + 1
				end
			end
		end
	end

	-----------------------------------------------------------------------------------------------------

	HUDCrosshair = HUDCrosshair or class(HUDCrosshairBase)

	function HUDCrosshair:init(hud)
		HUDCrosshair.super.init(self, hud)

		self._crosshair_table = { }
		self._visible = false
		self._active_crosshair = nil
		self:setup_crosshair()
	end

	function HUDCrosshair:_clear_table()
		for name, parts in pairs(self._crosshair_table) do
			HUDCrosshair.super._clear_table(self, name .. "_crosshair", parts)
		end
		self._crosshair_table = { }
		self._active_crosshair = nil
		self._visible = false
	end

	-- Call clear table before calling this
	function HUDCrosshair:_setup_default(name, panel_table)
		--Default to no crosshair, so add nothing
	end

	function HUDCrosshair:setup_crosshair(crosshair, active_crosshair)
		self:_clear_table()
		if crosshair then
			local new_default_crosshair
			for name, parts in pairs(crosshair) do
				new_default_crosshair = new_default_crosshair or name
				self._crosshair_table[name] = { }
				self:_setup_panels("crosshair", parts, self._crosshair_table[name], name)
			end
			self._active_crosshair = self._crosshair_table[active_crosshair] and active_crosshair or new_default_crosshair
			self:show_crosshair(self._visible)
		else
			self._setup_default("crosshair", self._crosshair_table)
		end
	end
		
	function HUDCrosshair:show_crosshair(visible)
		if visible ~= self._visible then
			self._visible = visible
			for i, part in ipairs(self._crosshair_table[self._active_crosshair]) do 
				part:set_visible(visible) 
			end
		end
	end

	function HUDCrosshair:crosshair_visible()
		return self._visible
	end

	function HUDCrosshair:select_crosshair(index)
		if self._crosshair_table[index] then
			self:show_crosshair(false)
			self._active_crosshair = index
			self:show_crosshair(self._visible)
		end
	end

	function HUDCrosshair:get_selected_crosshair()
		return self._active_crosshair
	end

	function HUDCrosshair:get_crosshair_names()
		local names = { }
		for name, _ in pairs(self._crosshair_table) do
			table.insert(names, name)
		end
		return names
	end

	-----------------------------------------------------------------------------------------------------

	HUDHitConfirmNew = HUDHitConfirmNew or class(HUDCrosshairBase)

	function HUDHitConfirmNew:init(hud)
		HUDHitConfirmNew.super.init(self, hud)

		self._hit_confirm_table = { }
		self._headshot_confirm_table = { }
		self._crit_confirm_table = { }
		self:setup_hit_confirm()
	end

	-- Call clear table before calling this
	function HUDHitConfirmNew:_setup_default(name, panel_table)
		--No need to make a new panel, just use the default panel from original HitConfirm instance. Deep clone panel and use copy instead?
		local default_panel_name = "_" .. (name == "headshot_confirm" and "hit_confirm" or name) --Dirty fix because no default panel exists for headshots; uses standard hit confirm
		local default_panel = managers.hud._hud_hit_confirm[default_panel_name]
		
		table.insert(panel_table, 1, { panel = default_panel, duration = 0.25, alpha = 1 })
		panel_table[1].panel:set_center(self._hud_panel:w() / 2, self._hud_panel:h() / 2)
	end

	function HUDHitConfirmNew:setup_hit_confirm(hit_confirm, crit_confirm, headshot_confirm)
		self:_clear_table("hit_confirm", self._hit_confirm_table)
		if hit_confirm then
			self:_setup_panels("hit_confirm", hit_confirm, self._hit_confirm_table)
		else
			self:_setup_default("hit_confirm", self._hit_confirm_table)
		end
		
		self:_clear_table("crit_confirm", self._crit_confirm_table)
		if crit_confirm then 
			self:_setup_panels("crit_confirm", crit_confirm, self._crit_confirm_table) 
		else 
			self:_setup_default("crit_confirm", self._crit_confirm_table) 
		end
		
		self:_clear_table("headshot_confirm", self._headshot_confirm_table)
		if headshot_confirm then 
			self:_setup_panels("headshot_confirm", headshot_confirm, self._headshot_confirm_table) 
		else 
			self:_setup_default("headshot_confirm", self._headshot_confirm_table) 
		end
	end

	function HUDHitConfirmNew:on_hit_confirmed()
		self:_animate_panels(self._hit_confirm_table)
	end

	function HUDHitConfirmNew:on_headshot_confirmed()
		self:_animate_panels(self._headshot_confirm_table)
	end

	function HUDHitConfirmNew:on_crit_confirmed()
		self:_animate_panels(self._crit_confirm_table)
	end

	function HUDHitConfirmNew:_animate_panels(panel_table)
		local table_ref = managers.hud:crosshair_visible() and panel_table.crosshair_visible or panel_table.crosshair_invisible or panel_table
			
		for i, v in pairs(table_ref) do
			v.panel:stop()
			v.panel:animate( callback(self, self, "_animate_show"), v.duration, v.alpha)
		end
	end

	function HUDHitConfirmNew:_animate_show(panel, duration, alpha)
		panel:set_visible(true)
		panel:set_alpha(alpha)
		local t = duration
		while t > 0 do
			local dt = coroutine.yield()
			t = t - dt
			panel:set_alpha( t/duration * alpha )
		end
		panel:set_visible( false )
	end

	-----------------------------------------------------------------------------------------------------

	-- HUDManager interface functions

	function HUDManager:setup_crosshair(crosshair, active_crosshair)	--New
		self._hud_crosshair:setup_crosshair(crosshair, active_crosshair)
	end

	function HUDManager:setup_hit_confirm(hit, crit, headshot)	--New
		self._hud_hit_confirm_new:setup_hit_confirm(hit, crit, headshot)
	end

	function HUDManager:crosshair_visible()	--New
		return self._hud_crosshair:crosshair_visible()
	end

	function HUDManager:show_crosshair(visible)	--New
		self._hud_crosshair:show_crosshair(visible)
	end

	function HUDManager:select_crosshair(crosshair) --New
		self._hud_crosshair:select_crosshair(crosshair)
	end

	function HUDManager:get_selected_crosshair() --New
		self._hud_crosshair:get_selected_crosshair()
	end

	function HUDManager:get_crosshair_names() --New
		return self._hud_crosshair:get_crosshair_names()
	end

	function HUDManager:_setup_player_info_hud_pd2()	--Hook for setup
		HUDManager__setup_player_info_hud_pd2_original(self)
		
		local hud = managers.hud:script( PlayerBase.PLAYER_INFO_HUD_PD2 )
		self._hud_crosshair = HUDCrosshair:new(hud)
		self._hud_hit_confirm_new = HUDHitConfirmNew:new(hud)
	end

	function HUDManager:on_hit_confirmed()	--Overloaded
		if managers.user:get_setting( "hit_indicator" ) then
			self._hud_hit_confirm_new:on_hit_confirmed()
		end
	end

	function HUDManager:on_headshot_confirmed()	--Overloaded
		if managers.user:get_setting( "hit_indicator" ) then
			self._hud_hit_confirm_new:on_headshot_confirmed()
		end
	end

	function HUDManager:on_crit_confirmed()	--Overloaded
		if managers.user:get_setting( "hit_indicator" ) then
			self._hud_hit_confirm_new:on_crit_confirmed()
		end
	end
end