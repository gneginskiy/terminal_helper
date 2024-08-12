#!/bin/bash
# Set your OpenAI API key
OPENAI_API_KEY='YOUR_API_KEY_HERE'

# Verify if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <message>"
    exit 1
fi

# Concatenate all arguments into a single string
argz=""
while [ $# -gt 0 ]; do
    argz="$argz $1"
    shift
done

# Trim leading space in arguments
argz="${argz:1}"

# Make an API request to OpenAI and parse the response with jq
output=$(curl -s "https://api.openai.com/v1/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  --data-raw '{
    "model": "gpt-4",
    "messages": [
      {
        "role": "system",
        "content": "respond without extra words. only the code"
      },
      {
        "role": "user",
        "content": "'"${argz}"'"
      }
    ]
  }' | jq -r '.choices[0].message.content' | sed 's/\\n/\\r\\n/g' );

# Output the result
echo "$output"
