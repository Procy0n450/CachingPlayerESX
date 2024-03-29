local CachePlayer = {}

RegisterNetEvent('esx:MiseEnCache')
AddEventHandler('esx:MiseEnCache', function()
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)
	if not CachePlayer[xPlayer.source] then 
		CachePlayer[xPlayer.source] = {}
		CachePlayer[xPlayer.source].group = xPlayer.getGroup() 
		CachePlayer[xPlayer.source].players = xPlayer.source 
		CachePlayer[xPlayer.source].job = xPlayer.job.name 
		CachePlayer[xPlayer.source].job2 = xPlayer.job2.name 
		CachePlayer[xPlayer.source].name = GetPlayerName(xPlayer.source)
		-- Ajouter ce que vous voulez mettre en cache 
		print("[^4"..CachePlayer[xPlayer.source].players.."^7] (^2Mise en cache^7) Joueur : (^4"..GetPlayerName(CachePlayer[xPlayer.source].players).."^7) Groupe : (^4"..CachePlayer[xPlayer.source].group.."^7) Jobs (^4"..CachePlayer[xPlayer.source].job.."^7) Crew : (^4"..CachePlayer[xPlayer.source].job2.."^7)")
	end
end)

AddEventHandler('playerDropped', function (reason)
    if CachePlayer[source] then  
        CachePlayer[source] = nil
    end
end)

function ESX.GetCachingPlayer()
	return CachePlayer
end 

-- Exemple server 
RegisterNetEvent('alerte:police')
AddEventHandler('alerte:police', function()
     local source = source 
     for k,v in pairs(ESX.GetCachingPlayer()) do 
	if v.job == "police" then 
	    TriggerClientEvent('esx:showAdvancedNotification', v.players, 'Alerte Police', 'Alerte Police', "Braquage en cours", 'CHAR_EXEMPLE', 1)
	end
      end 
end)
