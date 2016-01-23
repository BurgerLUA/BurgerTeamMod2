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


local TriScale = 25

function TeamModHUDPaint()

	local ply = LocalPlayer()
	
	if ply:Team() ~= 1001 then
	
		for k,v in pairs(team.GetPlayers(ply:Team())) do
		
			if v ~= ply then
		
				local Position = v:GetPos() + v:OBBCenter()*2
				local Screen = Position:ToScreen()
				local x = Screen.x
				local y = Screen.y
				local IsVisible = false
				local TeamColor = team.GetColor(ply:Team())
				local TriShape = {
					{x = x - TriScale,y = y - TriScale},
					{x = x + TriScale,y = y - TriScale},
					{x = x + 0,y = y + 0},
				}
				
				local XMin = ScrW()*0.2
				local XMax = ScrW()*0.8
				local YMin = ScrH()*0.2
				local YMax = ScrH()*0.8

				if (x < XMax and x > XMin) and (y < YMax and y > YMin) then
					IsVisible = true
				end

				if IsVisible then
					--print("Visible")
					surface.SetDrawColor( TeamColor )
					draw.NoTexture()
					surface.DrawPoly( TriShape )
					
				else
					x = math.Clamp(x,XMin,XMax)
					y = math.Clamp(y,YMin,YMax)
				end
				
				draw.DrawText( v:Nick(), "TargetID", x, y, TeamColor, TEXT_ALIGN_CENTER )
				draw.DrawText( v:Health() .. "%", "TargetID", x, y + 20, TeamColor, TEXT_ALIGN_CENTER )
				
			end
		
		end
	
	end



end

hook.Add("HUDPaint","TeamMod: Hud Paint",TeamModHUDPaint)







print("sv_bur_teamselection.lua loaded")
