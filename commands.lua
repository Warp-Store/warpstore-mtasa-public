commands = {
    ["addVehicle"] = function (args)
        local playerID = tonumber(args[1]);
        local carId = tonumber(args[2]);

        local vehicleSpawn = createVehicle(carId, 0, 0, 0)

        local player = getPlayerID(playerID);
        local x, y, z = getElementPosition(player)

        spawnVehicle(vehicleSpawn, x, y, z);
        warpPlayerIntoVehicle(player, vehicleSpawn)
    end
}