ESX = exports.es_extended:getSharedObject()
local aperto = false

RegisterCommand(Config.Command, function()
    if Config.Isadmin then
        for _, v in pairs(Config.Admin.group) do
            ESX.TriggerServerCallback("fennel_group_sv", function(gruppoadd)
				if gruppoadd == v then
                    openMenu()
				else
					ESX.ShowNotification(Config.NotifyNoPermission)
				end
			end)
        end
    elseif not Config.Isadmin then
        if not aperto then
            aperto = true
            SetNuiFocus(true, true)
            SendNUIMessage({open = true})
        elseif aperto then
            aperto = false
            SetNuiFocus(false, false)
            SendNUIMessage({open = false})
        end
    end
end)

function openMenu()
    if not aperto then
        aperto = true
        SetNuiFocus(true, true)
        SendNUIMessage({open = true})
    elseif aperto then
        aperto = false
        SetNuiFocus(false, false)
        SendNUIMessage({open = false})
    end
end

RegisterNUICallback('action', function(data)
    local giocatore = PlayerPedId()
    local cordinate = GetEntityCoords(giocatore)
    if data.azione == 'close' then
        aperto = false
        SetNuiFocus(false, false)
        SendNUIMessage({open = false})
    elseif data.azione == 'setta' then
        aperto = false
        SetNuiFocus(false, false)
        SendNUIMessage({open = false})
        TriggerServerEvent('fennel:settablips_sv', data.id, data.color, data.name, data.grandezza, cordinate)
    else
        print('[FENNEL BLIPS] [ERROR] Nui Callback NIL')
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    local File = LoadResourceFile(GetCurrentResourceName(), "config/Blips.json")
    local Table = json.decode(File)
    for index, value in pairs(Table) do
        print('[FENNEL BLIPS] [INFO] Salvataggio Impostazioni, Applicando...')
        TriggerEvent('fennel_setblip_cl', value.idblip, value.coloreblip, value.nomeblip, value.scaleblip, value.pos.x, value.pos.y, value.pos.z)
    end
end)

AddEventHandler('onServerResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    local File = LoadResourceFile(GetCurrentResourceName(), "config/Blips.json")
    local Table = json.decode(File)
    for index, value in pairs(Table) do
        print('[FENNEL BLIPS] [INFO] Salvataggio Impostazioni, Applicando...')
        TriggerEvent('fennel_setblip_cl', value.idblip, value.coloreblip, value.nomeblip, value.scaleblip, value.pos)
    end
end)

RegisterNetEvent('fennel_setblip_cl', function(id, colore, nome, grandezza, x, y, z)
    local blipset = AddBlipForCoord(vector3(x, y, z))
	SetBlipSprite(blipset, id)
	SetBlipScale(blipset, grandezza)
	SetBlipColour(blipset, colore)
	SetBlipAsShortRange(blipset, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString(nome)
	EndTextCommandSetBlipName(blipset)
end)