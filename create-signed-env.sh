#!/bin/bash

# Prompt the user for each part of the subject line
read -p "Enter country code 'US' (C): " country
read -p "Enter state or province name 'California' (ST): " state
read -p "Enter locality 'Los Angeles' (L): " locality
read -p "Enter organization name 'PixelOS' (O): " organization
read -p "Enter organizational unit 'PixelOS' (OU): " organizational_unit
read -p "Enter common name 'pixelos' (CN): " common_name
read -p "Enter email address 'android@android.com' (emailAddress): " email

# Construct the subject line
subject="/C=${country}/ST=${state}/L=${locality}/O=${organization}/OU=${organizational_unit}/CN=${common_name}/emailAddress=${email}"

# Print the subject line
echo "Using Subject Line:"
echo "$subject"

# Prompt the user to verify if the subject line is correct
read -p "Is the subject line correct? (y/n): " confirmation

# Check the user's response
if [[ $confirmation != "y" && $confirmation != "Y" ]]; then
    echo "Exiting without changes."
    exit 1
fi
clear

# Create key
echo "Press ENTER TWICE to skip password (about 10-15 enter hits total). Cannot use a password for inline signing!"
mkdir ~/.android-certs

for x in bluetooth media networkstack nfc platform releasekey sdk_sandbox shared testkey verifiedboot; do \
    ./development/tools/make_key ~/.android-certs/$x "$subject"; \
done

mv ~/.android-certs/* vendor/aosp/signing/keys/

echo "Done! Now build as usual."
echo "Make copies of your vendor/aosp/signing/keys folder as it contains your keys!"
sleep 3
