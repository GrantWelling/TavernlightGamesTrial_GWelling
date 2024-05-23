-- Last modified: 2024.05.23 13:30 by Grant Welling

-- While modifying this script, I decided that the releaseStorage function was redundant given the existance of the player:setStorageValue function.
-- I assumed that the player's storage value 1000 is set to 1 when they are logged in and that it should be set to -1 when they log out.
    
function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        player:setStorageValue(1000, -1) -- Changed to directly modify the player's storage value instead of calling releaseStorage
    end
    
    return true
end
    