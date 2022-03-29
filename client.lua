QBCore = exports["qb-core"]:GetCoreObject()

RegisterCommand("createnewitem", function()
    local item = exports['qb-input']:ShowInput({
        header = "Enter the name of the item",
        submitText = "Confirm",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'itemname',
                text = 'Item Name'
            },
            {
                type = 'text',
                isRequired = true,
                name = 'label',
                text = 'Label'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'weight',
                text = 'Weight'
            },
            {
                type = 'text',
                isRequired = true,
                name = 'image',
                text = 'Image'
            },
            {
                type = 'text',
                isRequired = true,
                name = 'description',
                text = 'Description'
            },
        }
    })
    if item then
        if not item.itemname then return end
        if not item.label then return end
        if not item.weight then return end
        if not item.image then return end
        if not item.description then return end
        TriggerServerEvent("qb-additem:server:additem", item.itemname, item.label, item.weight, item.image, item.description)
    end
end)
