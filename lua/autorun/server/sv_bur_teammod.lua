local Base = 2000

function JoinTeam(ply,cmd,args)

	local choice = string.lower(args[1])
	local target = tonumber(args[2])
	
	if not target then
		ent = ply
	else
		ent = Entity(target)
	end

	if choice == "red" then
		ent:SetTeam(Base + 1)
	elseif choice == "blue" then
		ent:SetTeam(Base + 2)
	elseif choice == "green" then
		ent:SetTeam(Base + 3)
	elseif choice == "yellow" then
		ent:SetTeam(Base + 4)
	else
		ent:SetTeam(1001)
	end

	--print(team.GetName(ent:Team()))
	
	NotifyTeamChange(ent)

end

concommand.Add( "JoinTeam", JoinTeam, TeamAutoComplete, "Join a Team", FCVAR_CLIENTCMD_CAN_EXECUTE )

function ForceTeam(ply,cmd,args)
	--if ply:IsAdmin() == true or ply:IsSuperAdmin() == true then
		local victim = player.GetAll()[tonumber(args[1])]
		local num = tonumber(args[2])
		
		if type(num) ~= "number" then return end
	
	
		if not IsValid(victim) then 
			ply:ChatPrint("INVALID PLAYER")
			return
		end
		
		if num > 4 or num == 0 then
			victim:SetTeam(1001)
		else
			victim:SetTeam(Base + num)
		end
		
		NotifyTeamChange(victim)
		


		
		
	--end
end

concommand.Add( "ForceTeam", ForceTeam, TeamAutoComplete, "Join a Team", FCVAR_CLIENTCMD_CAN_EXECUTE )



function NotifyTeamChange(ply)

	--print("Sending Message...")
	
	net.Start("TCCS")
		net.WriteEntity( ply )
		net.WriteInt(ply:Team(),16)
	net.Broadcast()

end

util.AddNetworkString("TCCS")

function GetChatCommands(ply,text,teamChat)

	local command = string.sub(text,1,5)
	local destination = string.sub(text,7)
	
	if string.lower(command) == "!team" then
		JoinTeam(ply,command,{destination})
		return false
	end
end

hook.Add("PlayerSay","Grab Chat Commands",GetChatCommands)

print("sv_bur_teamselection.lua loaded")