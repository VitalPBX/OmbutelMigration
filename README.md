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
2. When you go to the GUI a database error appears
<pre>
Fatal error: Uncaught exception 'Exception' with message 'SQLSTATE[42S02]: Base table or view not found: 1146 Table 'ombutel.ombu_role_permissions'
</pre>

  You must to go to the Linux console and execute the following script:
<pre>
usr/share/ombutel/scripts/apply_patches
</pre>

3. When you ran manually the patches script (apply_patches) a database error appears saying that there is a duplicated entry
<pre>
Importing 20170330.2.directdial_feature_codes.sql...
PHP Fatal error: Uncaught exception 'Exception' with message 'ERROR 1062 (23000) at line 5: Duplicate entry 'direct_toggle_cfi' for key 'feature_name'
</pre>
  You must to take the filename and insert it manually to the patches table as follow:
  <pre>
  mysql -uroot ombutel -e"insert into ombu_patches(filename) values ('20170330.2.directdial_feature_codes.sql')"
  </pre>

4. If Cannot install the VitalPBX Trunks Passthrough addon, go to the console and
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
