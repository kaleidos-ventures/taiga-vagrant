# Vagrantfile for Taiga

## Installation

```sh
curl https://github.com/taigaio/taiga-vagrant/blob/master/install.sh | sh
```
## Usage

* `vagrant up` - Boot and provision the machine.
* `vagrant provision` - Provision an already running machine.
* `vagrant reload --provision` - Restart and provision the machine.
* `vagrant ssh` - *ssh* into the machine.

A `--no-provision` flag can be passed to `up` and `reload` if you don't want
to run provisioners. Likewise, you can pass `--provision` to force
provisioning.

In case of problems run: `vagrant destroy && vagrant up`.

## Dependencies

1. [VirtualBox][vbox]
2. [Vagrant][vagrant]

**Note** if you're using VMware you need the vagrant
[vmware plugin](http://www.vagrantup.com/vmware)

## Terminology

* **Guest Machine**: The virtual machine.
* **Host Machine**: Your computer.

### Accessing the guest machine from your browser

The vm has the ports `9000` and `9001` forwarded.  Either way pay
attention to the `vagrant up` logs because sometimes there's a
collision with the ports and vagrant automatically choose another port
in the host.

If you prefer another ports forwarding configuration, you can always
change them by creating a `Vagrantfile.local` file with the desired
configuration:

```ruby
settings[:forwarded_ports] = [{host: ..., guest: ...}, ...]
```

## Guidelines on writing provisioning scripts ##

* All scripts should live in the `scripts/` directory.
* `scripts/utils.sh` is used as a library module that contains
  utilities to the rest of scripts.
* After writing your script, you must add it to `scripts/provision.sh`
  using the erb-syntax `<%= source 'my-script.sh' %>` and you must
  position it in the appropiate place if you're depending on other
  scripts.
* Scripts beginning by an underscore `_` are ignored by git so they
  don't get committed to the repo, but! they're still executed if you
  include them in a `scripts/_custom.sh` using the same erb-syntax,
  useful if you want some personal configuration in your instance.

## Provision environment ##

When writing a provisioner script you can access a global *env*
variable that may contain useful information for you to use.  For
example, the `shell.sh` provisioner uses the `env[:shell_profile]`
variable to know what shell configuration file the user of the guest
machine is using (.bashrc, .bash_profile, .zshrc, ...).

[vbox]: https://www.virtualbox.org/wiki/Downloads "VirtualBox downloads"
[vmw]: https://www.virtualbox.org/wiki/Downloads "VMware website"
[vagrant]: http://downloads.vagrantup.com/ "Vagrant downloads"
