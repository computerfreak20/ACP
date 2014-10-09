function HUDManager:set_blackscreen_skip_circle(current, total)
	IngameWaitingForPlayersState._skip_data = {total = 0, current = 1}
	managers.hud._hud_blackscreen:set_skip_circle(current, total)
end
function HUDManager.set_blackscreen_mid_text(_ARG_0_, _ARG_1_, ...)
	managers.hud._hud_blackscreen._blackscreen_panel:child("mid_text"):set_center_y(managers.hud._hud_blackscreen._blackscreen_panel:child("mid_text"):y() - 50)
	managers.hud._hud_blackscreen:set_mid_text("ACP v" .. string.format("%.2f", tweak_data.ACPConfig.Version) .. " Initialized")
end