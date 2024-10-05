#!/bin/bash

# Generate a random number between 1 and 6
random_number=$(( (RANDOM % 6) + 1 ))

# Print the random number
echo "Random number between 1 and 6: $random_number"
