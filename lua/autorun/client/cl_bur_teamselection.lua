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

--[[
function ScoreNotify()

	if not NextTime or NextTime < CurTime() then
	
	
	
		chat.AddText("Cocks")
		
		
		NextTime = CurTime() + 10
	
	
	end

end

hook.Add("Think","Clientside Score Notify",ScoreNotify)
--]]