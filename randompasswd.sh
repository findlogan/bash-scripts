#!/bin/bash

# Prompt for password length
read -p "Enter the password length: " password_length

# Check if the entered password length is a positive integer
if ! [[ $password_length =~ ^[0-9]+$ ]]; then
  echo "Invalid password length. Please enter a positive integer."
  exit 1
fi

# Prompt for including special characters
read -p "Include special characters? (y/n): " include_special

# Set the character sets based on whether special characters are included
if [ "$include_special" == "y" ]; then
  character_set="A-Za-z0-9!@#$%^&*()_+-=<>?/{}[]|"
else
  character_set="A-Za-z0-9"
fi

# Generate the secure password
password=$(tr -dc "$character_set" < /dev/urandom | head -c "$password_length")

# Display the generated password
echo "Generated Password: $password"

# Prompt for saving the password to a text file
read -p "Save the password to a text file? (y/n): " save_password

if [ "$save_password" == "y" ]; then
  read -p "Enter the full path and filename to save the password: " save_path
  echo "$password" > "$save_path"
  echo "Password saved to $save_path."
fi
