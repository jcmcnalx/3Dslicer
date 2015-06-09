-------
#3DSlicer
  - Slicer 4 is the latest version of 3D Slicer, a free, comprehensive software platform for medical image analysis and visualization developed with NIH support.
  - http://www.slicer.org/
  - Current Version 4.4
  - Authors
    - http://www.slicer.org/pages/Acknowledgments

--------

The 3Dslicer Dockerfile and indentity.sh script will create an Ubuntu 14.04 container capable of displaying the 3Dslicer tool over X11.

Requirements
--------

- Linux server or workstation with Xorg installation
  - [Docker](https://www.docker.com//) >= 1.5
  - X11 enabled terminal program (if not using Linux desktop such as KDE/GDM..etc)
    Recommend http://mobaxterm.mobatek.net/

Installation
-------
Download Git repository
- git clone https://github.com/jcmcnalx/3Dslicer.git

Cd into downloaded repo
- cd 3Dslicer

Execute identity.sh in same directory as Dockerfile
- ./identity.sh

Build Docker container
  - docker build -t YOUR_CONTAINER_NAME .

Note: The container is built using Phusion's Ubuntu 14.04 baseimage
http://phusion.github.io/baseimage-docker/

Run container
--------
Once built run the container with options to mount your home directory and invoke X11 display
  - $ docker run -it -v /home/USERNAME:/home/USERNAME -e DISPLAY -v /home/USERNAME/.Xauthority:/home/USERNAME/.Xauthority --net=host YOUR_CONTAINER_NAME /bin/bash
  - Replace USERNAME with your username

Run 3Dslicer
  - $ slicer

You should see a splashscreen as illustrated in the screen captures folder.  If you receive an error associated with cannot connect to X server then you have to review the docker run steps.

Loading and saving data can be achieved by downloading the sample data in addition to working with your own data accessible in your container mounted home directory.  See screen caputures

Non-GUI tools are usable without the Slicer GUI.  See 3DSlicer documentation for these tools and usage.

3DSlicer official documentation  http://www.slicer.org/slicerWiki/index.php/Documentation/4.4

----------
Tested on Docker hosts:
  - Ubuntu 14.04
  - CentOS 6.x
  - RHEL 6.x
  - Boot2docker Windows
    - Unable to get X11 to work
