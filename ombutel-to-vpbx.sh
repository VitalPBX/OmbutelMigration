#!/bin/bash
set -e

#Check if Ombutel is Installed
OMBUTEL_INSTALLED="yes"
if ! rpm -q ombutel >/dev/null 2>/dev/null
    then OMBUTEL_INSTLLED="no"
fi

#Download the beta repo of VitalPBX
wget -P /etc/yum.repos.d/ https://raw.githubusercontent.com/VitalPBX/OmbutelMigration/master/vitalpbx.repo

if [ "$OMBUTEL_INSTALLED" = "yes" ]; then
  # Update Ombutel as Usual
  yum update ombutel -y
else
  # Install VitalPBX
  yum install vitalpbx -y
fi

# Delete old asterisk sounds folders
rm -rf /var/lib/asterisk/sounds/en_US_f_Allison
rm -rf /var/lib/asterisk/sounds/es_NI_f_Maria
rm -rf /var/lib/asterisk/sounds/fr_CA_f_June

# Reinstall the latest version of asterisk sounds
yum reinstall asterisk-sounds-* -y

# Reinstall VitalPBX sounds
yum reinstall vitalpbx-sounds* -y

# Remove the old ssh welcome
rm -rf /etc/profile.d/obtwelcome.sh

# All Done
echo Welcome to VitalPBX!
/bin/bash /etc/profile.d/vitalwelcome.sh
