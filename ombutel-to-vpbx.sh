#!/bin/bash
set -e

#Delete all the Ombutel/VitalPBX Repositories
rm -rf /etc/yum.repos.d/vitalpbx*.repo
rm -rf /etc/yum.repos.d/ombu*.repo

#Clean Yum Cache
yum clean all
rm -rf /var/cache/yum

#Download the beta repo of VitalPBX
wget -P /etc/yum.repos.d/ https://raw.githubusercontent.com/VitalPBX/OmbutelMigration/master/vitalpbx-migration.repo

yum remove ombutel* -y
yum remove telerec -y
yum remove sonata* -y

# Delete old asterisk sounds folders
rm -rf /var/lib/asterisk/sounds/en_US_f_Allison
rm -rf /var/lib/asterisk/sounds/es_NI_f_Maria
rm -rf /var/lib/asterisk/sounds/fr_CA_f_June

unlink /var/lib/asterisk/sounds/en
unlink /var/lib/asterisk/sounds/en_US
unlink /var/lib/asterisk/sounds/es
unlink /var/lib/asterisk/sounds/es_NI
unlink /var/lib/asterisk/sounds/fr
unlink /var/lib/asterisk/sounds/fr_CA

# Delete Obsolte Themes
rm -rf /usr/share/ombutel/www/themes/ombutel
rm -rf /usr/share/ombutel/www/themes/ombulight

#Install VitalPBX
yum install vitalpbx

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
