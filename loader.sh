#!/bin/bash

URL="http://192.168.56.22/get"
TOTAL_REQUESTS=100
CONCURRENT_REQUESTS=10

echo "Starting load test to $URL"
echo "Sending $TOTAL_REQUESTS requests with $CONCURRENT_REQUESTS concurrent..."

for ((i=1; i<=TOTAL_REQUESTS; i++)); do
  (
    RESPONSE=$(curl -s "$URL")
    echo "[$i] $RESPONSE"
  ) &

  # Limit concurrency
  if (( i % CONCURRENT_REQUESTS == 0 )); then
    wait
  fi
done

wait
echo "Load test completed."
