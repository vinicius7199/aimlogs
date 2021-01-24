-----------------------------------------------------------------------------------------------------------------------------------------
--VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local used = false
-----------------------------------------------------------------------------------------------------------------------------------------
--FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))
        local id = GetPlayerName(PlayerId())
        if aiming then

            Citizen.SetTimeout(15000, function()
                used = false
            end)
            
            if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                local pedId = GetPlayerServerId(aiming)
				local ped = PlayerPedId()
				local IsWeaponLasso = IsPedWeaponReadyToShoot(ped)
				print(weapon)
                if used == false then
                    TriggerServerEvent('aimlogs:log', pedId )
                    used = true
                end
            end 
        end 

        if not aiming then
            used = false
        end
    end 
end)
