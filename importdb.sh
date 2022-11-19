#!/bin/bash
mongod &
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup, adding artists to mongodb --"
    mongoimport --db BristolData --collection Artists --type json --jsonArray --uri mongodb://localhost:27017 --file /tmp/Artists.json
else
    echo "-- Not first container startup, skipping adding artists --"
fi
echo "-- Done --"
cd /app/ || exit
python3 -m flask run --host=0.0.0.0