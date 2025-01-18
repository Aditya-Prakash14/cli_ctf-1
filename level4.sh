#!/bin/bash

# Set the flag content
flag="FLAG=QS{B1n4ry_Wh1sp3r3r_2024}     Massage=hunt"

# Create the main challenge directory
mkdir -p level4_ctf
cd level4_ctf

# Create a file with base64 encoded flag and restricted permission
echo "$(echo "$flag" | base64)" > flag_file
chmod 444 flag_file # set read for all users, no write

# Create a directory for the privileged user's script
mkdir privileged_script
cd privileged_script

# Create a program that will extract the flag as another user, but no sudo is required
echo "#!/bin/bash" > get_flag.sh
echo "cat ../flag_file | base64 -d" >> get_flag.sh
chmod +x get_flag.sh

cd ..
# Provide some initial setup info to the user
echo "Level 4 Challenge Started!"
echo "You need to execute the script to get the flag."
