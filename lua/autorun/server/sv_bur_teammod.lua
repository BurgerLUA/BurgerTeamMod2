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
	
		local StringName = tostring(args[1])
		local TeamNumber = tonumber(args[2])
		
		if type(StringName) ~= "string" then return end
		if type(TeamNumber) ~= "number" then return end
		
		local PlayerTable = {}

		for k,v in pairs(player.GetAll()) do
			if StringName == "bot" then
				if v:IsBot() then 
					table.Add(PlayerTable,{v})
				end
			elseif StringName == "*" then
				table.Add(PlayerTable,{v})
			elseif FakePlayerTableFind(StringName,string.lower(v:Nick())) then
				table.Add(PlayerTable,{v})
			end
		end
		
		for l,b in pairs(PlayerTable) do
			if IsValid(b) then 
				if TeamNumber > 4 or TeamNumber == 0 then
					b:SetTeam(1001)
				else
					b:SetTeam(Base + TeamNumber)
				end
				
				NotifyTeamChange(b)
		
			end
		end


	--end
end

concommand.Add( "ForceTeam", ForceTeam, TeamAutoComplete, "Join a Team", FCVAR_CLIENTCMD_CAN_EXECUTE )

function FakePlayerTableFind(Needle,Haystack)

	if not Needle then return end
	if not Haystack then return end
	
	local Start, End = string.find(Haystack,Needle,0,true)
	
	if Start and End then
		return true
	else
		return false
	end

end



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