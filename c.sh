#!/bin/bash

# Detect operating system
OS=$(uname -s)
OSS=""
if [ "$OS" = "Darwin" ]; then
    OSS="macOS"
else
    OSS="Linux"
fi

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

# Make an API request to OpenAI and parse the response
output=$(curl -s "https://api.openai.com/v1/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  --data-raw '{
    "model": "gpt-4",
    "messages": [
      {
        "role": "system",
        "content": "You are a converter from natural language to '"$OSS"' terminal commands. You are being told the task, and return the command and nothing else."
      },
      {
        "role": "user",
        "content": "'"${argz}"'"
      }
    ]
  }' | awk -F'"content":' '{print $2}'| cut -c 3- | rev | cut -c 3- | rev);

# Output the result
echo $output
