# Upgrading BIOS on ThinkPad X220
The purpose of this file is to simply record how I went about upgrading the BIOS and adding a custom boot image for future refence.

## Preparing the installation medium
- In order to upgrade the BIOS we will need to get the BIOS file from Lenovo website. Just grab whichever model matches your computer and make sure to get the ISO version.
- Next download the geteltorito package.
- Navigate to the ISO directory. For me it was `~/Downloads`.
- Run the following command and replace the `<filename>` with your file  `$ geteltorito.pl -o bios.img ~/Downloads/8duj25us.iso`
- Now that we have the `.img` file, we can burn it using:
  `sudo dd if=biosupdate.img of=/dev/sdb bs=64k`

## Add the custom BIOS image
- Navigate to the USB stick and open up the `/HR_US/FLASH/` directory
- Copy your BIOS image to this directory using something like `cp ~/Downloads/BIOS.GIF .` 

## Installing the BIOS update
Prefacing this section with a caveat. For my machine, I changed the boot to allow classic and UEFI boot as I had trouble with it set to only allowing UEFI boot before. I can not be certain this actually made a difference or not but it is worth noting.
- Now that we have the USB stick ready, we can reboot the computer using `sudo reboot`
- On boot, rapid-fire press `F12` (I actually do this)
- Follow the instructions and read the prompts carefully so you understand what is happening. 

## Additional Information
- I had no luck using `.bmp` files.

## References
[0] https://www.thinkwiki.org/wiki/BIOS_Upgrade/X_Series#Approach_11:_Extracting_image_and_imaging_it_to_USB_stick
