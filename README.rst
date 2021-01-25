CameraDisplayOS
================

This project shows 4 RTMP streams from security cameras on a monitor, using omxplayer.

Configuration
-------------

Edit ``/boot/cameras.txt`` with the RTMP URLs for your cameras. ONVIF Device Manager is a good tool for finding the URLs of ONVIF cameras.

SSH is enabled and the password for the pi user should be changed.

Optionally connect a button between GPIO16 and ground to manually restart the camera software if it stops working due to network hickups without having to reboot the whole RPi.


Building
--------

Build on a Ubuntu, Debian or Raspbian system with::

    sudo apt install coreutils p7zip-full qemu-user-static
    git clone https://github.com/guysoft/CustomPiOS.git
    git clone https://github.com/grantemsley/CameraDisplayOS.git
    cd CameraDisplayOS/src/image
    wget -c --trust-server-names 'https://downloads.raspberrypi.org/raspios_lite_armhf_latest'
    cd ..
    ../../CustomPiOS/src/update-custompios-paths
    sudo modprobe loop
    sudo bash -x ./build_dist

Customizing
-----------

Most relevant settings are exposed in ``src/config``. Copy ``config`` to ``config.local`` and edit to your liking before building.

There are several extra modules included here where you might also change things:

The button module installs the python script that monitors a button press on GPIO16 and runs a script.

The minimize module removes unnecessary packages, utilities and documentation. It shaves about 600MB off the size of the image, but leaves you with a system missing many normal commands and all documentation. You shouldn't distribute images build with minimize enabled, since they are also missing all the license files.

The pxe module removes the swap creation and partition resizing features that aren't needed when using the images only for network booting. It also adds the ability to reboot the pi by creating a file called ``reboot`` in the root of it's NFS share.

deploytopi.sh
-------------

This script is probably only useful to me. It relies on my `rpi-boot-server <https://github.com/grantemsley/rpi-boot-server>`_ setup and a home automation relay flashed with `Tasmota <https://tasmota.github.io/docs/>`_ to build the image, extract it and put it on the nfs server, and reboot an actually raspberry pi for testing on real hardware.
