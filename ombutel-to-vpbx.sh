#!/bin/bash
set -e
# Update Ombutel as Usual
yum update ombutel -y

# Delete old asterisk sounds folders
rm -rf /var/lib/asterisk/sounds/en_US_f_Allison
rm -rf /var/lib/asterisk/sounds/es_NI_f_Maria
rm -rf /var/lib/asterisk/sounds/fr_CA_f_June

# Reinstall the latest version of asterisk sounds
yum reinstall asterisk-sounds-* -y

# Remove the old ssh welcome
rm -rf /etc/profile.d/obtwelcome.sh

# All Done
echo Welcome to VitalPBX!
/bin/bash /etc/profile.d/vitalwelcome.sh
