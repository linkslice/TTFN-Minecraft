#!/bin/bash
#

docker exec -it 7c2b6313ed69 send-command say Counting down to a special Christmas Present!
sleep 5
docker exec -it 7c2b6313ed69 send-command say oh what could it be?


# Container ID (replace this with your actual container ID)
container_id="7c2b6313ed69"

# Array of Christmas messages
messages=("Do I hear reindeers?" "Gift drop incoming soon!" "Merry Christmas, everyone!" "Who's ready for some holiday cheer?" "Tis the season to be jolly!")

# Array of potions (ID 1–46)
potions=("minecraft:potion 1 1" #Potion of Regeneration 
	"minecraft:potion 1 2" #Potion of Strength 
	"minecraft:potion 1 3" #Potion of Swiftness 
	"minecraft:potion 1 4" #Potion of Fire Resistance
	"minecraft:potion 1 5" #Potion of Poison 
	"minecraft:potion 1 6" #Potion of Night Vision
	"minecraft:potion 1 7" #Potion of Weakness 
	"minecraft:potion 1 8" #Potion of Leaping 
	"minecraft:potion 1 9" #Potion of Harming 
	"minecraft:potion 1 10" #Potion of Water Breathing
	"minecraft:potion 1 11" #Potion of Invisibility 
	"minecraft:potion 1 12" #Potion of Strength (Extended)
	"minecraft:potion 1 13" #Potion of Fire Resistance
	"minecraft:potion 1 14" #Potion of Water Breathing
	"minecraft:potion 1 15" #Potion of Invisibility (Extended)
	"minecraft:potion 1 16" #Potion of Healing 
	"minecraft:potion 1 17" #Potion of Poison (Extended)
	"minecraft:potion 1 18" #Potion of Harming (Extended)
	"minecraft:potion 1 19" #Potion of Weakness (Extended)
	"minecraft:potion 1 20" #Potion of Slow Falling
	"minecraft:potion 1 21" #Potion of Regeneration (Extended)
	"minecraft:potion 1 22" #Potion of Swiftness (Extended)
	"minecraft:potion 1 23" #Potion of Leaping (Extended)
	"minecraft:potion 1 24" #Potion of Luck 
	"minecraft:potion 1 25" #Potion of Bad Luck
	"minecraft:potion 1 26" #Potion of Decay 
	"minecraft:potion 1 27" #Potion of Luck (Extended)
	"minecraft:potion 1 28" #Potion of Bad Luck
	"minecraft:potion 1 29" #Potion of Decay (Extended)
	"minecraft:potion 1 30" #Potion of the Turtle
	"minecraft:potion 1 31" #Potion of the Turtle
	"minecraft:potion 1 32" #Potion of Fire Resistance
	"minecraft:potion 1 33" #Potion of Poison (Splash)
	"minecraft:potion 1 34" #Potion of Night Vision
	"minecraft:potion 1 35" #Potion of Weakness (Splash)
	"minecraft:potion 1 36" #Potion of Leaping (Splash)
	"minecraft:potion 1 37" #Potion of Harming (Splash)
	"minecraft:potion 1 38" #Potion of Water Breathing
	"minecraft:potion 1 39" #Potion of Invisibility (Splash)
	"minecraft:potion 1 40" #Potion of Healing (Splash)
	"minecraft:potion 1 41" #Potion of Regeneration (Splash)
	"minecraft:potion 1 42" #Potion of Swiftness (Splash)
	"minecraft:potion 1 43" #Potion of Turtle Master
	"minecraft:potion 1 44" #Potion of Luck (Splash)
	"minecraft:potion 1 45" #Potion of Decay (Splash)
	"minecraft:potion 1 46") #Potion of Slow Falling

# Function to give a random potion to a player
give_random_potion() {
    random_potion=${potions[$((RANDOM % ${#potions[@]}))]}
    docker exec -it $container_id send-command give @p $random_potion
}

# Infinite loop (daemon mode)
while true; do
    # Randomly select and broadcast a Christmas message
    random_message=${messages[$((RANDOM % ${#messages[@]}))]}
    docker exec -it $container_id send-command say "$random_message"

    # Random sleep time between 1 and 15 minutes (in seconds)
    sleep_time=$((RANDOM % 300 + 60))  # sleep time between 60 and 900 seconds
    sleep $sleep_time

    # Occasionally give a random potion (e.g., 1 in 5 chances)
    if ((RANDOM % 2 == 0)); then
        give_random_potion
    fi
done

