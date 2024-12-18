#!/bin/bash

# Infinite loop to run as a daemon
while true; do
  # Sleep for a random time between 1 and 10 minutes (600 seconds max)
  sleep $((RANDOM % 600 + 60))s

  # Broadcast a message to let players know a gift is incoming
  messages=("Here comes some stylish gear!" "Need a wardrobe update? Incoming!"
            "Santa's elves have crafted some fine armor!" "Tis the season for protection and style!"
            "Fresh gear delivered to your doorstep!" "Who's ready for some festive fashion?")
  random_message=${messages[$RANDOM % ${#messages[@]}]}
  docker exec -it 7c2b6313ed69 send-command "say $random_message"

  # Pick a random wearable item to give
  gear_id=$((RANDOM % 18))
  case $gear_id in
    0)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:leather_helmet 1 0" ;;
    1)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:leather_chestplate 1 0" ;;
    2)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:leather_leggings 1 0" ;;
    3)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:leather_boots 1 0" ;;
    4)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:golden_helmet 1 0" ;;
    5)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:golden_chestplate 1 0" ;;
    6)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:golden_leggings 1 0" ;;
    7)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:golden_boots 1 0" ;;
    8)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:iron_helmet 1 0" ;;
    9)  docker exec -it 7c2b6313ed69 send-command "give @a minecraft:iron_chestplate 1 0" ;;
    10) docker exec -it 7c2b6313ed69 send-command "give @a minecraft:iron_leggings 1 0" ;;
    11) docker exec -it 7c2b6313ed69 send-command "give @a minecraft:iron_boots 1 0" ;;
    12) docker exec -it 7c2b6313ed69 send-command "give @a minecraft:diamond_helmet 1 0" ;;
    13) docker exec -it 7c2b6313ed69 send-command "give @a minecraft:diamond_chestplate 1 0" ;;
    14) docker exec -it 7c2b6313ed69 send-command "give @a minecraft:diamond_leggings 1 0" ;;
    15) docker exec -it 7c2b6313ed69 send-command "give @a minecraft:diamond_boots 1 0" ;;
    16) docker exec -it 7c2b6313ed69 send-command "give @a minecraft:elytra 1 0" ;;
    17) docker exec -it 7c2b6313ed69 send-command "give @a minecraft:turtle_helmet 1 0" ;;
  esac

  # Random chance to enchant gear for extra fun
  if ((RANDOM % 3 == 0)); then
    enchantments=("protection 4" "fire_protection 4" "feather_falling 4" "unbreaking 3" "blast_protection 4")
    random_enchant=${enchantments[$RANDOM % ${#enchantments[@]}]}
    docker exec -it 7c2b6313ed69 send-command "enchant @a minecraft:$random_enchant"
    docker exec -it 7c2b6313ed69 send-command "say Lucky you—your gear came enchanted with $random_enchant!"
  fi
done
