docker-compose -p npg-k6 -f .\docker-compose.yml down
docker-compose -p npg-k6 -f .\docker-compose.yml up -d
docker-compose -p npg-k6 run --rm k6 run /scripts/script.js