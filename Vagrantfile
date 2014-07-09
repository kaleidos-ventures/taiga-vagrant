# -*- mode: ruby -*-
# vi: set ft=ruby :
require "./source.rb"

settings = {
    box: "trusty64",
    box_url: "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box",
  synced_folder: {
    host: "./data",
    guest: "/home/vagrant/data"
  },
  forwarded_ports: [{host: 8000, guest: 8000},
                    {host: 8001, guest: 15672},
                    {host: 9001, guest: 8080}],
  provision_env: {}
}

# Look for a Vagrantfile.local to load
local_settings = "#{__FILE__}.local"
if File.exists?(local_settings)
  eval File.read(local_settings)
end

ROOT_PATH = File.dirname(__FILE__)

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

  # Provisioning
  files = []
  Dir.glob("config/*") {|entry| files << entry if File.file?(entry)}
  Dir.glob("config/custom/*") {|entry| files << entry if File.file?(entry)}

  files.each do |file|
    config.vm.provision "file", :source => file, :destination => ".#{File.basename(file)}"
  end

  config.vm.provision "shell" do |shell|
    vagrant_shell_scripts_configure(
      shell,
      File.join(ROOT_PATH, "scripts"),
      "provision.sh",
      settings[:provision_env]
    )
  end
end
