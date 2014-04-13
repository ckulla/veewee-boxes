# Template Manifest #

This file explains the goals of this template definition. For details
about the function of veewee template files, see the documentation on
how to [Customize Definitions](../../doc/customize.md).

### Overview ###

**Template Name:**
`Ubuntu-12.04.4-desktop-i386`

**Box Objective:**
The aim is to setup a vanilla `Ubuntu 32-bit (i386) desktop` plus setup
what's needed for veewee automation, VirtualBox guest additions, and to
install the foundation so that `puppet` customize as needed.

Please note that a amd64 box can be creating by copying / symlink files
to a directory ubuntu-12.04.4-desktop-amd64. The definition.rb looks
at the parent directory to detect the architecture.

#### System Details ####

* **Version:**                  Ubuntu 12.04.4 Desktop
* **Locale:**                   en_US
* **Keyboard layout:**          US
* **Timezone:**                 UTC
* **Extra Language Support:**   none
* **Machine:**                  1.9GB RAM, 30GB HD
* **VirtualBox Config:**        IO_APIC ON, UTC time, 3D acceleration, Shared clipboard.
* **Deviations from a vanilla Ubuntu Desktop:**
   * Add `vagrant` user and add to `admin group`, disable password
     requirement for `admin group` to run `sudo` commands.
   * Install VirtualBox `Guest Additions`
   * Install `Ruby`
   * Install `Puppet`
   * Remove LibreOffice and Thunderbird to save some space

### CHANGELOG ###

* Modified definition.rb to support i386 and amd64 box creation
* Removed chef from original definition
* Removed LibreOffice and Thunderbird to save some space
