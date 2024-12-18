#!/bin/bash

# Loop forever
while true; do
  # Sleep for a random time between 1 and 15 minutes (900 seconds max)
  sleep $((RANDOM % 300 + 60))s

  # New random Christmas messages
  messages=("Jingle bells, jingle bells, here come the gifts!" "Ho ho ho! Look out, a gift drop is coming!" "Merry Christmas to all, and to all a good loot!" "Santa's sleigh is full of surprises!" "Tis the season to be gifting! Get ready!" "The elves have been working overtime... gifts incoming!" "Have you been naughty or nice? Here's a gift anyway!" "The Christmas spirit is strong in the world today!" "Gifts for everyone! Let's celebrate the season!")

  # Pick a random message from the array
  random_message=${messages[$RANDOM % ${#messages[@]}]}
  
  # Broadcast the message to the server
  docker exec -it 7c2b6313ed69 send-command "say $random_message"

  # Randomly give out gifts (1 in 5 chance)
  if ((RANDOM % 2 == 0)); then
    # Pick a random gift from the list
    gift_id=$((RANDOM % 13))
    case $gift_id in
      0) 
        # Diamond Sword with Enchantments
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:diamond_sword 1 0"
        docker exec -it 7c2b6313ed69 send-command "enchant @a minecraft:sharpness 5"
        docker exec -it 7c2b6313ed69 send-command "enchant @a minecraft:unbreaking 3"
        docker exec -it 7c2b6313ed69 send-command "enchant @a minecraft:fire_aspect 2"
        ;;
      1) 
        # Elytra
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:elytra 1 0"
        ;;
      2) 
        # Totem of Undying
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:totem_of_undying 1 0"
        ;;
      3) 
        # Shulker Box
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:shulker_box 1 0"
        ;;
      4) 
        # Netherite Sword
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:netherite_sword 1 0"
        ;;
      5) 
        # Enchanted Golden Apple
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:enchanted_golden_apple 1 0"
        ;;
      6) 
        # Experience Bottle
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:experience_bottle 10 0"
        ;;
      7) 
        # Trident
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:trident 1 0"
        ;;
      8) 
        # Beacon
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:beacon 1 0"
        ;;
      9) 
        # Saddle
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:saddle 1 0"
        ;;
      10) 
        # Healing Tipped Arrow
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:tipped_arrow 10 0"
        ;;
      11) 
        # Snow Block
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:snowball 10 0"
        ;;
      12) 
        # Firework Rocket
        docker exec -it 7c2b6313ed69 send-command "give @a minecraft:firework_rocket 10 0"
        ;;
    esac
  fi
done
