#!/bin/bash

SERVER="http://localhost"
PORT="8081"
OUTPUT_FILE="file.txt"

# Make an HTTP request to the stub_status endpoint
response=$(curl -s -D - "$SERVER:$PORT/metrics")

# Parse the response to extract relevant information
get_info () {
    # Get headers from request
    headers=$(echo "$response" | awk 'BEGIN{RS="\r\n\r\n"} NR==1{print}')
    # The current number of active client connections including Waiting connections
    active_connections=$(echo "$response" | awk '/Active connections:/ {print $3}')
    # The total number of accepted client connections.
    accepts=$(echo "$response" | awk '/^ *[0-9]+ [0-9]+ [0-9]+/ {print $1}')
    # The total number of handled connections
    handled=$(echo "$response" | awk '/^ *[0-9]+ [0-9]+ [0-9]+/ {print $2}')
    # The total number of client requests
    requests=$(echo "$response" | awk '/^ *[0-9]+ [0-9]+ [0-9]+/ {print $3}')
    # The current number of connections where nginx is reading the request header
    reading=$(echo "$response" | awk '/Reading:/ {print $2}')
    # The current number of connections where nginx is writing the response back to the client
    writing=$(echo "$response" | awk '/Writing:/ {print $4}')
    # The current number of idle client connections waiting for a request
    waiting=$(echo "$response" | awk '/Waiting:/ {print $6}')
}

write_info() {
    # Print the extracted information
    echo "$(date)" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    echo "HEADERS:" >> "$OUTPUT_FILE"
    echo "$headers" >> "$OUTPUT_FILE"
    echo >> "$OUTPUT_FILE"
    echo "STUB STATUS INFO:" >> "$OUTPUT_FILE"
    echo "Active connections: $active_connections" >> "$OUTPUT_FILE"
    echo "Accepts: $accepts" >> "$OUTPUT_FILE"
    echo "Handled: $handled" >> "$OUTPUT_FILE" 
    echo "Requests: $requests" >> "$OUTPUT_FILE"
    echo "Reading: $reading" >> "$OUTPUT_FILE"
    echo "Writing: $writing" >> "$OUTPUT_FILE"
    echo "Waiting: $waiting" >> "$OUTPUT_FILE"
}

if [ -z "$response" ]; then 
    echo "Server is not active"
    exit 0
else 
    get_info
    write_info
fi

