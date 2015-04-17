AddCSLuaFile()

net.Receive("TCCS", function(len) 



	local ply = net.ReadEntity()
	local teamnumber = net.ReadInt(16)

	print("TeamNumber: " .. teamnumber)
	
	
	local Who = ply:Nick()
	local What = team.GetName( teamnumber )
	--local What = "Faggot"
		
	local White = Color(255,255,255,255)
	local TColor = team.GetColor(teamnumber)

	chat.AddText(TColor,Who,White," has joined ",TColor,"Team " .. What .. ".")

end)

print("sv_bur_friendlyfire.lua loaded")

local NextTime


function TeammateGlow()

	local Team = LocalPlayer():Team()

	if Team ~= 1001 then
	
		
		local TeamPlayers = team.GetPlayers(Team)
		local TeamColor = team.GetColor(Team)
		local BlurX = 5
		local BlurY = 5
		local Passes = 1
		local Additive = true
		local IgnoreZ = true
	
		halo.Add(TeamPlayers,TeamColor,BlurX,BlurY,Passes,Additive,IgnoreZ )
	
	end
	


end

hook.Add("HUDPaint","Clientside Score Notify",TeammateGlow)
