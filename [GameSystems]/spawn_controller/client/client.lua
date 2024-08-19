local spawnPos = vector3(235.883,-883.232,30)
local firstSpawn = true
local currentModel = 'a_m_m_skater_01'
AddEventHandler('onClientGameTypeStart', function()
    exports.spawnmanager:setAutoSpawnCallback(function ()
        if(firstSpawn) then
            exports.spawnmanager:spawnPlayer({
                x = spawnPos.x,
                y = spawnPos.y,
                z = spawnPos.z,
                model = currentModel
            })
            firstSpawn = false
            return
        else
            local playerPed = PlayerPedId()
            local pos = GetEntityCoords(playerPed)
            RequestModel(currentModel)
            while not HasModelLoaded(currentModel) do
                Wait(10)
            end
            exports.spawnmanager:spawnPlayer({
                x = pos.x,
                y = pos.y,
                z = pos.z,
                model = currentModel
            })
        end
    end)
    exports.spawnmanager:setAutoSpawn(false)
    exports.spawnmanager:forceRespawn()
end)
RegisterCommand('setModel',function (source,args)
    local model = args[1] or 'null'
    if IsModelValid(model) then
        currentModel = model
    end
end)