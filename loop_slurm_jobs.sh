#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Loop over each line in the text file
while IFS= read -r line; do
    # Get the two values from the line
    value1=$(echo "$line" | awk -F, '{print $1}')
    value2=$(echo "$line" | awk -F, '{print $2}')
    
    # Call another shell script with the two values
    sbatch one-out-fits-slurm.sh "$value1" "$value2"
done < "$input_file"
