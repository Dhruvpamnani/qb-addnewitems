QBCore = exports["qb-core"]:GetCoreObject()

local ItemsTable = {}

RegisterNetEvent('QBCore:Server:UpdateObject', function()
    if source ~= '' then return false end -- Safety check if the event was not called from the server.
    QBCore = exports['qb-core']:GetCoreObject()
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)
    local LoadJson = json.decode(LoadResourceFile(GetCurrentResourceName(), 'items.json'))
    ItemsTable = LoadJson
    for k, v in pairs(ItemsTable) do
        local infotable = {
            name = v.name,
            type = 'item',
            unique = false,
            useable = true,
            shouldClose = true,
            combinable = nil,
            label = v.label,
            weight = v.weight,
            image = v.image,
            description = v.description
        }
        exports["qb-core"]:AddItem(infotable.name, infotable)
    end
    
end)


RegisterServerEvent("qb-additem:server:additem", function(itemName, label, weight, image, description)
    local infotable = {
        name = itemName,
        type = 'item',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        label = label,
        weight = weight,
        image = image,
        description = description
    }
    exports["qb-core"]:AddItem(infotable.name, infotable)

    table.insert(ItemsTable, infotable)
    SaveResourceFile(GetCurrentResourceName(), "items.json", json.encode(ItemsTable), -1)
end)


