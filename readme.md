# c.sh - Terminal Helper Script
<img width="815" alt="image" src="https://github.com/user-attachments/assets/53ce4443-ea01-43aa-9455-0fa245bbc69e">

## Description
c.sh is a versatile shell script designed to help users automate the interaction with the OpenAI API directly from macOS and Linux terminals. It detects the operating system, configures API credentials, and parses arguments to communicate with the OpenAI GPT-4 model, facilitating the conversion of natural language instructions into terminal commands.

## Features
- **OS Detection:** Automatically detects whether it's running on macOS or Linux.
- **API Integration:** Seamlessly integrates with OpenAI's API using your personal API key.
- **Argument Parsing:** Efficiently parses command line arguments for API requests.
- **Simplified Usage:** Provides a straightforward interface for sending queries and receiving command instructions.

## Prerequisites
- linux or macos
- curl (Command line tool for transferring data with URLs)

## Installation
1. Download `c.sh` to your local machine.
2. Ensure it is executable:
   ```bash
   chmod +x c.sh
   ```
3. Set your OpenAI API key in the script by replacing `YOUR_API_KEY_HERE` with your actual API key.

## Usage
To use c.sh, provide a natural language instruction as an argument:
```bash
./c.sh "your natural language instruction here"
```
If no argument is provided, the script will prompt you with the correct usage method:
```bash
Usage: ./c.sh <message>
```

## Example
To get the terminal command for listing all files in the current directory:
```bash
./c.sh "list all files"
```

## Security Note
This script requires your OpenAI API key. Ensure that you keep this key secure and do not expose it in shared or public environments.

## License
This script is distributed under the MIT license. See `LICENSE` file for more details.
