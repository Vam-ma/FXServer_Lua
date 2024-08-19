RegisterCommand('spawn', function (source,args)
    local model = args[1] or 'null'
    if not IsModelInCdimage(model) or not IsModelAVehicle(model) then
        TriggerEvent('chat:addMessage', {
            args = {'Vehicle: ' .. model .. ' not found'}
        })
        return
    end

    local currentVehicle = GetVehiclePedIsIn(PlayerPedId(),false)
    if (currentVehicle > 0) then
        SetEntityAsMissionEntity(currentVehicle, true, true)
        DeleteVehicle(currentVehicle)
    end

    RequestModel(model)

    while not HasModelLoaded(model) do
        Wait(10)
    end

    local playerPed = PlayerPedId()
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