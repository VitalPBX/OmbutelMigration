# Migrating from Ombutel to VitalPBX

### Table of Contents
**[Usage Instructions](#usage-instructions)**<br>
**[Troubleshooting](#troubleshooting)**<br>
**[Important Notes](#important-notes)**<br>
**[Next Steps, Feedback, Social Networks](#next-steps)**<br>


## Usage Instructions

1. Download the script ombutel-to-vpbx.sh:
<pre>
wget https://raw.githubusercontent.com/VitalPBX/OmbutelMigration/master/ombutel-to-vpbx.sh
</pre>
2. Give execution permissions:
<pre>
chmod +x ombutel-to-vpbx.sh
</pre>
3. Execute the Script:
<pre>
./ombutel-to-vpbx.sh
</pre>

## Troubleshooting

1. If Doesn't appears any of the audio prompts of asterisk, please execute
the following commands:
<pre>
yum reinstall asterisk-sounds-* -y
yum reinstall vitalpbx-sounds* -y
</pre>
2. If Cannot install the VitalPBX Trunks Passthrough addon, go to the console and
execute the following commands and then, try to install again:
<pre>
yum remove ombutel-trunks-passthrough -y
yum clean all
rm -rf /var/cache/yum
</pre>

## Important Notes
- The Sonata Recordings add-on may be uninstalled when upgrading to VitalPBX, in such case, you must to install it from the VitalPBX add-ons module

## Next Steps
- [VitalPBX Documentation](https://goo.gl/ZRbc1v)
- [Support Forum](https://goo.gl/r8Y4tS)
- [Online Store](https://goo.gl/93ozNo)
- [Issues Tracker](https://goo.gl/6v4T8h)

### Social Networks
- [Facebook](https://goo.gl/Qy7Q1e)
- [Twitter](https://goo.gl/8fMsSc)
- [Instagram](https://goo.gl/QzvZEJ)
- [Youtube](https://goo.gl/h9SW1i)

![VPBX Logo](https://raw.githubusercontent.com/VitalPBX/OmbutelMigration/master/logo.png)
