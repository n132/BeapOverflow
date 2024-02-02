#!/bin/bash

# Initialize min and max with null
min=
max=

for i in {1..10000}; do
    # Run your program and capture its output
    output=$(./main) # replace your_program with your actual program command
    
    # Initialize min and max with the first output value
    if [ -z "$min" ] || [ -z "$max" ]; then
        min=$output
        max=$output
    fi

    # Update min if the current output is smaller
    if [ "$output" -lt "$min" ]; then
        min=$output
    fi

    # Update max if the current output is larger
    if [ "$output" -gt "$max" ]; then
        max=$output
    fi
done

echo "Minimum returned number: $min"
echo "Maximum returned number: $max"

