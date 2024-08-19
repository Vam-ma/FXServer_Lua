RegisterCommand(
	'spawn', 
	function (source,args)
        if(args[1] == nil) then
            return
        end
        local model = args[1]
        if not IsModelInCdImage(model) or not IsModelAVehicle(model) then
            TriggerEvent('chat:addMessage', {
                args = {'Vehicle' .. model .. 'not found'}
            })
            return
        end

        RequestModel(model)

        while not HasModelLoaded(model) do
            Wait(10)
        end

        local playerPed = PlayerPedID()
        local pos = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)

        local vehicle = CreateVehicle(
            model,
            pos,
            heading,
            true
        )
        SetPedIntoVehicle(playerPed,vehicle,-1)

        SetModelAsNoLongerNeeded(model)
    end
)