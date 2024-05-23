-- Last modified: 2024.05.23 14:00 by Grant Welling

-- In my modification of this script, I assumed that the return value from db.storeQuery would come in the form of a lua table with a "name" key.

function printSmallGuildNames(memberCount)
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local result = db.storeQuery(string.format(selectGuildQuery, memberCount)) -- Fixed result variable name
    
    --Iterating over the result, print the guild names
    for i = 1, #result do
        print(result[i].name)
    end
end
