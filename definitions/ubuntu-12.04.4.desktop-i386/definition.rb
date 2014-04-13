# this file provides the definition for i386 and amd64
# see https://github.com/jedi4ever/veewee/issues/463

spec_common = {
  :cpu_count => '1',
  :memory_size => '1900',     # safe for 4GB Machines
  :video_memory_size => '128', # more is better for VM performance
  :disk_size => '32000',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :iso_download_timeout => "1000",
  :boot_wait => "4",
  :boot_cmd_sequence => [
    '<Esc><Esc><Enter>',
    '/install/vmlinuz preseed/url=http://%IP%:%PORT%/preseed.cfg ',
    'debian-installer=en_US auto locale=en_US kbd-chooser/method=us ',
    'hostname=%NAME% ',
    'fb=false debconf/frontend=noninteractive ',
    'keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=us keyboard-configuration/variant=us console-setup/ask_detect=false ',
    'initrd=/install/initrd.gz -- <Enter>'
],
  :kickstart_port => "7122",
  :kickstart_timeout => "10000",
  :kickstart_file => "preseed.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "shutdown -P now",
  :postinstall_files => [
   "build_time.sh",
   "apt.sh",
   "vbox.sh",
   "sudo.sh",
   "ruby.sh",
   "puppet.sh",
   "vagrant.sh",
   "cleanup.sh"
  ],
  :postinstall_timeout => "10000",
  :virtualbox => {
    :vm_options => [
        'ioapic' => 'on',               # APIC is necessary for multi processor support
        'rtcuseutc' => 'on',            # UTC internal time
        'accelerate3d' => 'on',         # Necessary for X to start the Unity desktop in Ubuntu 12.10+ -- Useful for 12.04, although can slow the VM if host hardware lacks good 3D support
        'clipboard' => 'bidirectional'  # Useful for clipboard sharing between host & guest
    # A Full list of settings can be found here: http://virtualbox.org/manual/ch08.html#idp51057568
    # Or generated based on the current settings of a virtualbox guest, such a machine named: myubuntu
    # VBoxManage showvminfo --machinereadable 'myubuntu'
    ]
  }
}

spec_archs = {
  "i386" => {
    :os_type_id => 'Ubuntu',
    :iso_file => "ubuntu-12.04.4-alternate-i386.iso",
    :iso_src => "http://releases.ubuntu.com/12.04/ubuntu-12.04.4-alternate-i386.iso",
    :iso_md5 => "788435b2778d6c7901f14d8cc3ceb4a7",
  },
  "amd64" => {
    :os_type_id => 'Ubuntu_64',  
    :iso_file => "ubuntu-12.04.4-alternate-amd64.iso",
    :iso_src => "http://releases.ubuntu.com/12.04/ubuntu-12.04.4-alternate-amd64.iso",
    :iso_md5 => "46e0fac240154bf59a11426a47a61363",
  }
}

d = File.expand_path(File.dirname(__FILE__))
m = /.*-(?<arch>.*?)$/.match(d)
Veewee::Definition.declare(spec_common.merge(spec_archs[m[:arch]]))
