// Last modified: 2024.05.23 13:30 by Grant Welling

// The potential memory leak lies in the fact that a dynamically allocated Player object is created, but is never deleted, even if it is never used.
// I fixed the code by deleting the Player object at each appropriate location where it is no longer needed.


void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    bool playerWasCreated = false;

        if (!player) {
            player = new Player(nullptr);

            if (!IOLoginData::loadPlayerByName(player, recipient)) {
                delete player; // Added this line to delete the Player object if it is not used.
                return;
            }

            playerWasCreated = true;
        }

    Item* item = Item::CreateItem(itemId);

    if (!item) {
        if (playerWasCreated) {
            delete player; // Added this line to delete the Player object if it was created in this function and the item is not created. 
        }
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
        if (playerWasCreated) {
            delete player; // Added this line to delete the Player object if it was created in this function and is offline. 
        }
    }
}