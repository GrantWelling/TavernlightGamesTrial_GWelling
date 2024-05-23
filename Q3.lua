-- Last modified: 2024.05.23 13:58 by Grant Welling

-- Assumptions:
-- party:getMembers() returns a table of Player objects
-- party:removeMember() takes a Player object as an argument
-- Player object has a getName() method that returns the player's name as a string
-- GetPlayer() returns an existing Player object

function removeFromPlayerParty(playerId, memberName) --Fixed camelCase of memberName
    local player = GetPlayer(playerId) -- Changed to local variable to store the player object, and assumed that GetPlayer() returns an existing Player object
    local party = player:getParty()
    
    for k,v in pairs(party:getMembers()) do
        if v:getName() == memberName then -- Changed to use the getName() method for comparison with the memberName
            party:removeMember(v)
            break -- Exit the loop once the member is found and removed
        end
    end
end