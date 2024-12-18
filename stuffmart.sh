#!/bin/bash
while true; do
  sleep $((RANDOM % 300 + 60))s

  # Random Christmas message
  messages=("Do I hear reindeers?" "Gift drop incoming soon!" "Merry Christmas, everyone!" "Santa's sleigh is arriving!")
  random_message=${messages[$RANDOM % ${#messages[@]}]}
  docker exec -it 7c2b6313ed69 send-command "say $random_message"

  # Randomly give out gifts (1 in 5 chance)
  if ((RANDOM % 2 == 0)); then
    # Pick a random gift
    gift_id=$((RANDOM % 14))
    case $gift_id in
      0) docker exec -it 7c2b6313ed69 send-command "give @a elytra 1 0";;
      1) docker exec -it 7c2b6313ed69 send-command "give @a totem_of_undying 1 0";;
      2) docker exec -it 7c2b6313ed69 send-command "give @a shulker_box 1 0";;
      3) docker exec -it 7c2b6313ed69 send-command "give @a netherite_sword 1 0";;
      4) docker exec -it 7c2b6313ed69 send-command "give @a enchanted_golden_apple 1 0";;
      5) docker exec -it 7c2b6313ed69 send-command "give @a experience_bottle 10 0";;
      6) docker exec -it 7c2b6313ed69 send-command "give @a trident 1 0";;
      7) docker exec -it 7c2b6313ed69 send-command "give @a beacon 1 0";;
      8) docker exec -it 7c2b6313ed69 send-command "give @a saddle 1 0";;
      10) docker exec -it 7c2b6313ed69 send-command "give @a snowball 10 0";;
      11) docker exec -it 7c2b6313ed69 send-command "give @a cooked_beef 10 0";;
      12) docker exec -it 7c2b6313ed69 send-command "give @a firework_rocket 10 0";;
      13) docker exec -it 7c2b6313ed69 send-command "give @a coal 10 0";;
    esac
  fi
done
