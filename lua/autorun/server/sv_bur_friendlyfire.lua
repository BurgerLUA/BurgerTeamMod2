function TeamDamageMod(victim,attacker)

	if attacker:IsPlayer() then

		if victim:Team() == attacker:Team() and victim:Team() ~= 1001 then
		
			return false

		end
		
	end
		
end

hook.Add("PlayerShouldTakeDamage","Team Damage Mod", TeamDamageMod )

function TeamchatOverride(listener,talker)

	return true, false

end

hook.Add("PlayerCanHearPlayersVoice","Teamchat Override",TeamchatOverride)