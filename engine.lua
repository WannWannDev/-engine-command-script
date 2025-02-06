RegisterCommand("engine", function(source, args, rawCommand)
    local player = GetPlayerPed(-1) -- Get the player's Ped
    local vehicle = GetVehiclePedIsIn(player, false) -- Get the vehicle the player is in
    
    if vehicle and vehicle ~= 0 then
        if GetIsVehicleEngineRunning(vehicle) then
            SetVehicleEngineOn(vehicle, false, false, true) -- Turn off engine
            SetVehicleUndriveable(vehicle, true)
            TriggerEvent("chatMessage", "[ENGINE]", {255, 0, 0}, "Engine turned off.")
        else
            SetVehicleEngineOn(vehicle, true, false, true) -- Turn on engine
            SetVehicleUndriveable(vehicle, false)
            TriggerEvent("chatMessage", "[ENGINE]", {0, 255, 0}, "Engine turned on.")
        end
    else
        TriggerEvent("chatMessage", "[ENGINE]", {255, 0, 0}, "You are not in a vehicle.")
    end
end, false)