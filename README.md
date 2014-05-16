# Vagrantfile for Taiga

## Installation

```sh
curl https://raw.githubusercontent.com/taigaio/taiga-vagrant/master/install.sh | sh
```

## Usage

After installing you can boot the website using:

```sh
vagrant ssh
```

To launch taiga-front and taiga-back http servers:
```sh
taiga-runserver
```

That command will:
* Create a tmux session named **taiga**.
* Create a tmux window named **servers** in that session.
* Split that window.
* Launch taiga-front http server in one split and taiga-back http server in the other.
* Attach to the tmux session.

To detach from the session use `<prefix> d` (the default prefix is `C-b`).

To display the servers window whenver you want just run `taiga-runserver` again.

## Dependencies ##

1. [VirtualBox][vbox]
2. [Vagrant][vagrant]

**Note** if you're using VMware you need the vagrant
[vmware plugin](http://www.vagrantup.com/vmware)

## Documentation

Please, take a look at the [wiki](https://github.com/taigaio/taiga-vagrant/wiki)

[vbox]: https://www.virtualbox.org/wiki/Downloads "VirtualBox downloads"
[vmw]: https://www.virtualbox.org/wiki/Downloads "VMware website"
[vagrant]: http://downloads.vagrantup.com/ "Vagrant downloads"
