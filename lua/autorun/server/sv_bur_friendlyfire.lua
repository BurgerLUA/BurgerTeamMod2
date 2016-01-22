function TeamchatOverride(listener,talker)
	return true, false
end

hook.Add("PlayerCanHearPlayersVoice","Teamchat Override",TeamchatOverride)