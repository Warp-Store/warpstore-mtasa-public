commands = {
    ['hyperscripts:addVip'] = function (args)
        local playerID = tonumber(args[1]);
        local vipName = args[2]
        local vipNumber = args[3]
        local vipDays = tonumber(args[4])

        local HSVIP = exports['[HS]VIP_System']

        local player = getPlayerID(playerID);
        local playerAccount = getAccountName( getPlayerAccount( player ))

        HSVIP:givePremium(playerAccount, vipName, vipDays, 'Dias', 'VIP:0'..vipNumber)
    end,
    ['hyperscripts:addCoin'] = function (args)
        local playerID = tonumber(args[1]);
        local elementData = args[2]
        local quantityCoin = tonumber(args[3]);
        
        local player = getPlayerID(playerID);
        local currentCoins = getElementData(player, elementData) or 0;

        setElementData(player, elementData, currentCoins + quantityCoin)
    end,
    ['hyperscripts:giveItem'] = function (args)
        local playerID = tonumber(args[1]);
        local item = args[2]
        local quantity = tonumber(args[3]);
        
        local player = getPlayerID(playerID);
        local inventory = exports['[HS]Hyper_Inventory'];

        if not inventory:giveItem( player, item, quantity ) then
            return config.InfoBox.execute(player, 'Você não possui espaço suficiente para receber o item '..item..' contate a administração.', config.InfoBox.status.warn)
        end
    end,
    ['hyperscripts:addVehicle'] = function (args)
        local playerID = tonumber(args[1]);
        local vehicle = string.gsub(args[2], '-', ' ');
        local vehicleCategory = string.gsub(args[3], '-', ' ');
        local vehicleModel = tonumber(args[4]);
        
        local player = getPlayerID(playerID);
        local conce = exports['[HS]Dealership_System'];

        local verify = conce:getVehicle( account, vehicleName )
        if not verify then
            conce:setVehicleConce( player, { ['name'] = vehicle, ['model'] = vehicleModel }, { 255, 255, 255 }, vehicleCategory )
        end
    end,
    ['hyperscripts:addVehicleVip'] = function ( args )
        local playerID = tonumber(args[1]);
        local vehicle = string.gsub(args[2], '-', ' ')
        local validate = tonumber(args[3])
        
        local player = getPlayerID(playerID);
        local conce = exports['Dealership_System'];

        local vehicleConfig = conce:getVehicleVipConfig(vehicle);

        local verify = conce:getVehicle( account, vehicleName )
        if not verify then
            local plate = conce:generatePlate( )
            conce:setVehicleVip( player, vehicle, conce:generatePlate( ), vehicleConfig.category, vehicleConfig.model, validate )
        end
    end
}