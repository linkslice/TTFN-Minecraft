#!/bin/bash
#

docker exec -it 7c2b6313ed69 send-command effect @a health_boost 600 120 true
docker exec -it 7c2b6313ed69 send-command effect @a instant_health 1 255 true
docker exec -it 7c2b6313ed69 send-command give @a minecraft:torch 64
docker exec -it 7c2b6313ed69 send-command give @a minecraft:diamond_sword 1
docker exec -it 7c2b6313ed69 send-command give @a minecraft:diamond_pickaxe 1
docker exec -it 7c2b6313ed69 send-command give @a minecraft:golden_apple 5
docker exec -it 7c2b6313ed69 send-command say Its dangerous to go alone. Take these.


