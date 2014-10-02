# Vagrantfile for Taiga

NOTICE: this is a major refactor of taiga-vagrant, and it now uses taiga-scripts
as provisioning scripts. If you prefer the old version, go to `old` tag.

## Installation

```sh
git clone https://github.com/taigaio/taiga-vagrant.git
cd taiga-vagrant
vagrant up
```

##  Usage

After installing, the taiga service is now up and running, and you can access it going
with your browser to: `http://localhost:8000`.

## Development Usage

If you are developer and you want run it using devserver instead of nginx for serving everything,
enters to the virtual machine using ssh:

```sh
vagrant ssh
```

To launch taiga-front and taiga-back http devservers:
```sh
taiga-runserver
```

That command will:
* Stops gunicorn service.
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
