function TeamDamageMod(victim,attacker)

	local World = game.GetWorld( )
	
	if victim:HasGodMode() or GetConVarNumber("sbox_godmode") ~= 0 then
		return false
	end

	
	
	if attacker:IsPlayer() then

		if victim:Team() == attacker:Team() and victim:Team() ~= 1001 then
			--World.FriendlyFire = true
			return false

		end
		
	end
		

	
	
		
end

hook.Add("PlayerShouldTakeDamage","Team Damage Mod", TeamDamageMod )

function TeamchatOverride(listener,talker)

	return true, false

end

hook.Add("PlayerCanHearPlayersVoice","Teamchat Override",TeamchatOverride)