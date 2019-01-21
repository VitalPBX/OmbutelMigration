#!/bin/bash
set -e

#Delete all the Ombutel/VitalPBX Repositories
rm -rf /etc/yum.repos.d/vitalpbx*.repo
rm -rf /etc/yum.repos.d/ombu*.repo

#Clean Yum Cache
yum clean all
rm -rf /var/cache/yum

#Check if Ombutel is Installed
OMBUTEL_INSTALLED="yes"
if ! rpm -q ombutel >/dev/null 2>/dev/null
    then OMBUTEL_INSTLLED="no"
fi

#Check if Sonata Recordings is Installed
SONATAREC_INSTALLED="yes"
if ! rpm -q sonata-recordings >/dev/null 2>/dev/null
    then SONATAREC_INSTALLED="no"
fi

#Download the beta repo of VitalPBX
wget -P /etc/yum.repos.d/ https://raw.githubusercontent.com/VitalPBX/OmbutelMigration/master/vitalpbx-migration.repo

if [ "$SONATAREC_INSTALLED" = "yes" ]; then
  yum update sonata-recordings -y
  yum remove ombutel-trunks-passthrough -y
fi

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

# Delete Obsolte Themes
rm -rf /usr/share/ombutel/www/themes/ombutel
rm -rf /usr/share/ombutel/www/themes/ombulight

# Reinstall the latest version of asterisk sounds
yum reinstall asterisk-sounds-* -y

# Reinstall VitalPBX sounds
yum reinstall vitalpbx-sounds* -y

# Remove the old ssh welcome
rm -rf /etc/profile.d/obtwelcome.sh

#Remove the repository used during the migration
rm -rf /etc/yum.repos.d/vitalpbx-migration.repo

#Clean Yum Cache Again
yum clean all
rm -rf /var/cache/yum

# All Done
echo Welcome to VitalPBX!
/bin/bash /etc/profile.d/vitalwelcome.sh
