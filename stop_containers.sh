#!/bin/bash

# Get ids of all active docker containers with "cdn77" prefix
container_ids=$(docker ps --filter "name=cdn77*" --format "{{.ID}}")

# Check whether some containers with "cdn77" are active
if [ -z "$container_ids" ]; then
    echo "No active containers with 'cdn77' prefix."
    exit 0
fi

# Stop and delete all docker containers with "cdn77" prefix
echo "Start process for stop and delete containers with 'cdn77' prefix..."
for container_id in $container_ids; do
    docker stop "$container_id" >/dev/null 2>&1
    docker rm "$container_id" >/dev/null 2>&1
    echo "Container with id of $container_id was stopped and deleted."
done

echo "All containers with 'cdn77' prefix were successfully stopped and then deleted."