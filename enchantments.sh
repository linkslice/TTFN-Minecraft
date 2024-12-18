#!/bin/bash

# Minecraft container ID
CONTAINER_ID="7c2b6313ed69"

# List of possible enchantments and their levels
ENCHANTMENTS=(
    "protection 4"
    "fire_protection 4"
    "feather_falling 4"
    "blast_protection 4"
    "projectile_protection 4"
    "respiration 3"
    "aqua_affinity 1"
    "thorns 3"
    "depth_strider 3"
    "frost_walker 2"
    "sharpness 5"
    "smite 5"
    "bane_of_arthropods 5"
    "knockback 2"
    "fire_aspect 2"
    "looting 3"
    "efficiency 5"
    "silk_touch 1"
    "unbreaking 3"
    "fortune 3"
    "power 5"
    "punch 2"
    "flame 1"
    "infinity 1"
    "luck_of_the_sea 3"
    "lure 3"
    "mending 1"
    "curse_of_vanishing 1"
    "curse_of_binding 1"
)

# Function to select a random enchantment
get_random_enchantment() {
    local index=$(( RANDOM % ${#ENCHANTMENTS[@]} ))
    echo "${ENCHANTMENTS[$index]}"
}

# Infinite loop to run as a daemon
while true; do
    # Select a random enchantment
    ENCHANTMENT=$(get_random_enchantment)

    # Choose a random sleep time (5-15 minutes)
    TOTAL_SLEEP=$(( RANDOM % 600 + 300 )) # 300-900 seconds (5 to 15 minutes)

    # Announce the enchantment and time until it happens
    MINUTES=$(( TOTAL_SLEEP / 60 ))
    SECONDS=$(( TOTAL_SLEEP % 60 ))
    docker exec -it "$CONTAINER_ID" send-command "say A special enchantment '$ENCHANTMENT' is coming in $MINUTES minutes and $SECONDS seconds! Be ready!"

    # Sleep until 10 seconds before the event
    SLEEP_BEFORE_10=$(( TOTAL_SLEEP - 10 ))
    sleep "$SLEEP_BEFORE_10"

    # Announce 10-second warning
    docker exec -it "$CONTAINER_ID" send-command "say Hold the item you want enchanted with '$ENCHANTMENT'! Enchanting in 10 seconds..."

    sleep 10

    # Apply the enchantment to all players holding an item
    docker exec -it "$CONTAINER_ID" send-command "enchant @a $ENCHANTMENT"

    # Announce success
    docker exec -it "$CONTAINER_ID" send-command "say Enchantment '$ENCHANTMENT' applied! Enjoy your powered-up items!"

done
