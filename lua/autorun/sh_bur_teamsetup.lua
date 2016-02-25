AddCSLuaFile()
--[[
function TeamDamageMod(victim,attacker)
	if victim:HasGodMode() or GetConVarNumber("sbox_godmode") ~= 0 then
		return false
	elseif attacker:IsPlayer() then
		if victim:Team() == attacker:Team() and victim:Team() ~= 1001 and attacker ~= victim then
			return false
		end
	end
end

hook.Add("PlayerShouldTakeDamage","Team Damage Mod", TeamDamageMod )
--]]


local Base = 2000

team.SetUp( Base + 1, "Red" , Color(255,0,0,255) , true )
team.SetUp( Base + 2, "Blue" , Color(0,0,255,255) , true )
team.SetUp( Base + 3, "Green" , Color(0,255,0,255) , true )
team.SetUp( Base + 4, "Yellow" , Color(255,255,0,255) , true )

print("sh_bur_teamsetup.lua loaded")