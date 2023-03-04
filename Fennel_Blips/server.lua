ESX = exports.es_extended:getSharedObject()

ESX.RegisterServerCallback('fennel_group_sv', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local gruppo = xPlayer.getGroup()
		if gruppo ~= nil then 
			cb(gruppo)
		else
			cb('user')
		end
	end
end)

RegisterServerEvent('fennel:settablips_sv', function(id, colore, nome, grandezza, posizione)
    local File = LoadResourceFile(GetCurrentResourceName(), "config/Blips.json")
    local Table = json.decode(File)
    if file ~= nil then
        print('[FENNEL BLIPS] [ERROR] Blips.json Inesistente | Ripristino in Corso...')
        SaveResourceFile(GetCurrentResourceName(), "config/Blips.json", "[]", -1)
    else
        table.insert(Table, {
            idblip = id,
            coloreblip = colore,
            nomeblip = nome, 
            scaleblip = grandezza,
            pos = posizione
        })
        SaveResourceFile(GetCurrentResourceName(), 'config/Blips.json', json.encode(Table, { indent = true }), -1)
    end
end)