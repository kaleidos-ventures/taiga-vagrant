# -*- mode: ruby -*-
# vi: set ft=ruby :
require "./source.rb"

ROOT_PATH = File.dirname(__FILE__)

VAGRANTFILE_API_VERSION = "2"

def configure_extra(config)
end

def configure(config)
  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, host: 8000, guest: 8000
  config.vm.network :forwarded_port, host: 9001, guest: 9001

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./data", "/home/vagrant/data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    # Boot with headless mode
    vb.gui = false

    host = RbConfig::CONFIG['host_os']

    # Giving a quarter of system memory to VM and access to all available cpu cores
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes, converting to MB...
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo returns KB, converting to MB...
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else
      # hardcoding values for windows...
      cpus = 2
      mem = 1024
    end

    vb.customize ["modifyvm", :id, "--memory", mem]
    vb.customize ["modifyvm", :id, "--cpus", cpus]
  end

  # Provisioning
  config.vm.provision "shell" do |shell|
    vagrant_shell_scripts_configure(
      shell,
      File.join(ROOT_PATH, "scripts"),
      "provision.sh",
      {}
    )
  end
end

# Look for a Vagrantfile.local to load
local_vagrantfile = "#{__FILE__}.local"
if File.exists?(local_vagrantfile)
  eval File.read(local_vagrantfile)
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  configure config
  configure_extra config
end
