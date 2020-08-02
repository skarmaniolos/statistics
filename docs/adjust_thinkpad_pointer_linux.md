# Explaining how to modify ThinkPad trackpoint sensitivity in Linux

## Initial setup
First, check the trackpoint settings; in particular the sensitivity and speed.
`udevadm info --query all --attribute-walk --path /sys/devices/platform/i8042/serio1`
If there is no output from this command, consider trying to find exactly what the device is registered as. This may require a kernel update.

## Creating the config file
Now that we can see the device, we can create a rules file. 
- First, navigate to the rules directory
  `/etc/udev/rules.d`
- Create a trackpoint rules file 
  `touch 10-trackpoint.rules`
- Populate the file with your desired configuration changes
  `KERNEL=="serio1", SUBSYSTEM=="serio", DRIVERS=="psmouse", ATTR{sensitivity}="125"`

## Implement the change
In my experience, I restarted (or logged out... I can't remember) to see the changes in effect. The way to check is to run the following code and monitor the output. Initially, we had a value of 200 for the sensitivity, now we should see the value has changed to 125. 
`cat /sys/devices/platform/i8042/serio1/sensitivity`

### Reference
For more information and help troubleshooting, visit:
[0] https://wiki.archlinux.org/index.php/TrackPoint
[1] http://www.thinkwiki.org/wiki/How_to_configure_the_TrackPoint
