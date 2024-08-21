#!/bin/sh

# yes or no prompt
# usage: `yon {prompt} {default response}`
yon() {
    local prompt="$1"					# custom message prompt
    local default_response="${2:-y}"	# default user response (y/n)
    local user_input					# user response
    local prompt_suffix

    # setting the suffix for default response
    if [ "$default_response" == "y" ]; then
        prompt_suffix="(Y/n)"
    elif [ "$default_response" == "n" ]; then
        prompt_suffix="(y/N)"
    else
        echo "Invalid default response. Please use 'y' or 'n'."
        return 1
    fi

    # Prompt the user for input
    read -p "$prompt $prompt_suffix: " user_input

    # Convert input to lowercase
    user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

    # replace user input with the default response if empty
    if [[ -z "$user_input" ]]; then
        user_input="$default_response"
    fi

    # Check the user input and return the appropriate exit code
    if [ "$user_input" == "y" ]; then
        return 0  # true
    elif [ "$user_input" == "y" ]; then
        return 1  # false
    else
        return 1  # false
    fi
}
