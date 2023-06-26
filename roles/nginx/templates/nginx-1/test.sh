#!/bin/bash
CONTAINER_IP=$(hostname -i | awk '{print $1}')

SERVER="$CONTAINER_IP"
PORT="80"
PARAMETER="metrics"
OUTPUT_FILE="/var/log/test.log"
TIME_INTERVAL=120

# Make an HTTP request to the stub_status endpoint and get info from the metrics page
get_info() {
    response=$(curl -s -D - "$SERVER:$PORT/$PARAMETER")
    headers=$(echo "$response" | awk 'BEGIN{RS="\r\n\r\n"} NR==1{print}')
    active=$(echo "$response" | awk '/Active connections:/ {print $3}')
    accepts=$(echo "$response" | awk '/^ *[0-9]+ [0-9]+ [0-9]+/ {print $1}')
    handled=$(echo "$response" | awk '/^ *[0-9]+ [0-9]+ [0-9]+/ {print $2}')
    requests=$(echo "$response" | awk '/^ *[0-9]+ [0-9]+ [0-9]+/ {print $3}')
    reading=$(echo "$response" | awk '/Reading:/ {print $2}')
    writing=$(echo "$response" | awk '/Writing:/ {print $4}')
    waiting=$(echo "$response" | awk '/Waiting:/ {print $6}') 
}

# Store for headers
headers () {
    echo "HEADERS:" >> "$OUTPUT_FILE"
    echo "$headers" >> "$OUTPUT_FILE"
}

# Store for stub status info
stub_info() {
    echo "STUB STATUS INFO:" >> "$OUTPUT_FILE"
    echo "Total number of active client connections (including Waiting connections): $active" >> "$OUTPUT_FILE"
    echo "Total number of accepted client connections: $accepts" >> "$OUTPUT_FILE"
    echo "Total number of handled connections: $handled" >> "$OUTPUT_FILE"
    echo "Total number of client requests: $requests" >> "$OUTPUT_FILE"
    echo "Number of connections reading the request header: $reading" >> "$OUTPUT_FILE"
    echo "Number of connections writing the response back to the client: $writing" >> "$OUTPUT_FILE"
    echo "Number of idle client connections waiting for a request: $waiting" >> "$OUTPUT_FILE"
}

while true; do     
    get_info
    if [ -z "$response" ]; then
        echo "[$(date)] ERROR Server is not active" >> "$OUTPUT_FILE"
    elif [[ "$response" =~ "404 Not Found" ]]; then
        echo "[$(date)] ERROR Website is not found" >> "$OUTPUT_FILE"
        headers
    else
        echo "[$(date)] INFO Check stub status" >> "$OUTPUT_FILE"
        headers
        stub_info
    fi
    sleep $TIME_INTERVAL
done;