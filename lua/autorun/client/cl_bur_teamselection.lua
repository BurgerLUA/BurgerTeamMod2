AddCSLuaFile()

net.Receive("TCCS", function(len) 

	local ply = net.ReadEntity()
	local teamnumber = net.ReadInt(16)
	local Who = ply:Nick()
	local What = team.GetName( teamnumber )	
	local White = Color(255,255,255,255)
	local TColor = team.GetColor(teamnumber)
	
	chat.AddText(TColor,Who,White," has joined ",TColor,"Team " .. What .. ".")

end)

print("sv_bur_friendlyfire.lua loaded")
