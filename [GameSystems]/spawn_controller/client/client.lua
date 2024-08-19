local spawnPos = vector3(235.883,-883.232,85)

AddEventHandler('onClientGameTypeStart', function()
    exports.spawnmanager:setAutoSpawnCallback(function ()
        exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'a_m_m_skater_01'
        }, function ()
            local playerPed = PlayerPedID()
            local name = GetPlayerName(playerPed)
            TriggerEvent('chat:addMessage',{
                args = {'Hello ' .. name .. '!~'}
            })
        end)
    end)
    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)