# -*- mode: ruby -*-
# vi: set ft=ruby :
require "./source.rb"

settings = {
  box: "trusty32",
  box_url: "https://cloud-images.ubuntu.com/vagrant/trusty/20140506/trusty-server-cloudimg-i386-vagrant-disk1.box",
  synced_folder: {
    host: "./data",
    guest: "/home/vagrant/data"
  },
  forwarded_ports: [{host: 9000, guest: 9000}, {host: 9001, guest: 9001}]
}

# Look for a Vagrantfile.local to load
local_settings = "#{__FILE__}.local"
if File.exists?(local_settings)
  eval File.read(local_settings)
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = settings[:box]
  config.vm.box_url = settings[:box_url]

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  for port_pair in settings[:forwarded_ports] do
    config.vm.network :forwarded_port, host: port_pair[:host], guest: port_pair[:guest]
  end

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
  config.vm.synced_folder settings[:synced_folder][:host],
                          settings[:synced_folder][:guest]

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with shell scripts
  config.vm.provision "shell" do |shell|
    vagrant_shell_scripts_configure(shell, File.join(File.dirname(__FILE__), "scripts"), "provision.sh")
  end
end
