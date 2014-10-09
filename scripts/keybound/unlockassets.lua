if inGame() and not isPlaying() then
	for _,asset_id in pairs (managers.assets:get_all_asset_ids( true )) do
		managers.assets:unlock_asset( asset_id )
	end
end