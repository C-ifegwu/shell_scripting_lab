#!/bin/bash

# Get the directory where the script is located
script_dir=$(dirname "$0")

# Define the path to the reminder script
reminder_script="$script_dir/app/reminder.sh"
config_file="$script_dir/config/config.env"
functions_file="$script_dir/modules/functions.sh"

# Check if the necessary files exist
if [[ ! -f "$reminder_script" ]]; then
    echo "Error: reminder.sh script not found in $script_dir/app/"
    exit 1
fi

if [[ ! -f "$config_file" ]]; then
    echo "Error: config.env file not found in $script_dir/config/"
    exit 1
fi

if [[ ! -f "$functions_file" ]]; then
    echo "Error: functions.sh file not found in $script_dir/modules/"
    exit 1
fi

if [[ ! -f "$script_dir/assets/submissions.txt" ]]; then
    echo "Error: submissions.txt file not found in $script_dir/assets/"
    exit 1
fi

# Check if reminder.sh is executable; make it executable if not
if [[ ! -x "$reminder_script" ]]; then
    echo "Making reminder.sh executable..."
    chmod +x "$reminder_script"
fi

# Print startup message
echo "Starting the Submission Reminder App..."
echo "--------------------------------------"

# Source the config file and functions file
source "$config_file"
source "$functions_file"

# Run the reminder script
"$reminder_script"

# Check if the script ran successfully
if [[ $? -eq 0 ]]; then
    echo "Reminder app ran successfully!"
else
    echo "Error: Something went wrong while running the reminder app."
    exit 1
fi

echo "Reminder app startup completed."

