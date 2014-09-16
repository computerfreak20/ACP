--NO INVISIBLE WALLS
if inGame() and isPlaying() and not inChat() then
	if isHost() then
		  CollisionData = {
		  ["673ea142d68175df"] = 1, ["86efb80bf784046f"] = 1, ["b37a4188fde4c161"] = 1, ["7ae8fcbfe6a00f7b"] = 1, ["c5c4442c5e147cb0"] = 1, ["8f3cb89b79b42ec4"] = 1, ["e8fe662bb4d262d3"] = 1, ["9d8b22836aa015ed"] = 1,
		  ["63be2c801283f573"] = 1, ["78f4407343b48f6d"] = 1, ["29d0139549a54de7"] = 1, ["e379cc9592197cd8"] = 1, ["7a4c85917d8d8323"] = 1, ["9eda9e73ac0ef710"] = 1, ["276de19dc5541f30"] = 1, ["6cdb4f6f58ec4fa8"] = 1}
		  for _,unit in ipairs(World:find_units_quick("all", 1)) do
			 if CollisionData[unit:name():key()] then
				unit:set_slot(0)
			 end
		  end
		showHint("Invisible Walls Removed",3)
	else
		showHint("You're not the Host, dumbass",3)
	end
end