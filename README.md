# another-install-script

[![Build Status](https://travis-ci.com/antoinebou13/another-install-script.svg?token=MUq69udyyqAR24bsXgRq&branch=master)](https://travis-ci.com/antoinebou13/another-install-script)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/antoinebou13/another-install-script?style=flat)
![Codecov](https://img.shields.io/codecov/c/github/antoinebou13/another-install-script?style=flat&token=FcTtxpEGhF)
![GitHub repo size](https://img.shields.io/github/repo-size/antoinebou13/another-install-script?style=flat)
![GitHub](https://img.shields.io/github/license/antoinebou13/another-install-script?style=flat)

Another install Script is a W.I.P project/script to install docker container for my personal server

## The story behind the project

I started working on the project because I just bought a VPS to host my TeamSpeak and Minecraft server.
After navigating r/selfhosting, I saw the multiple of several services/servers that can be simply installed with docker.
After learning a bit about docker. Also, I found so GitHub repo that tries to do the same thing with their favorite container.
I am trying to do with this project is to make a simple, extensible and customizable script to add most of Heimdall app in this app.

## How to install 

For now only work on ubuntu and only tested on ubuntu18.04

```bash 
git clone --recursive https://github.com/antoinebou13/personal-vps.git
cd personal-vps
bash setup.sh
```



## List of the services/server


| Name                                                                  | Docker | Ports              | Volumes | Web server | Default |
|-----------------------------------------------------------------------|--------|--------------------|---------|------------|---------|
| [cloud_torrent](https://github.com/jpillora/cloud-torrent)            |    ✔️   |                    |         | :6889      |         |
| [heimdall](https://github.com/linuxserver/docker-heimdall)            |    ✔️   |                    |         | :8080      |    ✔️    |
| [huginn](https://github.com/huginn/huginn)                            |    ✔️   |                    |         | :          |         |
| [jellyfin](https://github.com/linuxserver/docker-jellyfin)            |    ✔️   |                    |         | :8096      |    ✔️    |
| [jenkins](https://github.com/jenkinsci/docker)                        |    ✔️   | 8001,25566         |         | :8001      |         |
| [jupyterhub](https://github.com/jupyterhub/jupyterhub)                |    ✔️   |                    |         | :9000      |         |
| [mailcow](https://github.com/mailcow/mailcow-dockerized)              |    ✔️   |                    |         |            |    ✔️    |
| [mcmyadmin](https://github.com/linuxserver-archive/docker-mcmyadmin2) |    ✔️   | 8065, 25565        |         | :8065      |         |
| [medusa](https://github.com/linuxserver/docker-medusa)                |    ✔️   |                    |         | :8081      |    ✔️    |
| [openvpn](https://github.com/kylemanna/docker-openvpn)                |    ✔️   |                    |         |            |    ✔️    |
| [pyload](https://github.com/linuxserver/docker-pyload)                |    ✔️   | 8000,7227          |         |            |         |
| [recalBox](https://github.com/recalbox/recalbox-docker-build)         |    ✔️   |                    |         |            |         |
| [statping](https://github.com/hunterlong/statping)                    |    ✔️   | 8084               |         | :8084      |    ✔️    |
| [syncthing](https://github.com/syncthing/syncthing)                   |    ✔️   | 8384,22000, 21027  |         | :8384      |    ✔️    |
| [teamspeak](https://github.com/solidnerd/docker-teamspeak)            |    ✔️   | 9987, 10011, 30033 |         |            |         |
| [cockpit](https://cockpit-project.org/)                               |    ❌   | 9090               |         | :9090      |    ✔️    |


## List of other installed program

    - build-essential
    - zip
    - unzip
    - git
    - python3
    - python3-pip
    - alsa-utils
    - wireless-tools
    - wpasupplicant
    - [vim](https://www.vim.org/)
    - [snapd](https://snapcraft.io/)
    - [bat](https://github.com/sharkdp/bat)
    - [nnn](https://github.com/jarun/nnn)
    - [nmap](https://nmap.org/)
    - [wget](https://www.gnu.org/software/wget/)
    - [curl](https://github.com/curl/curl)
    - [bats](https://github.com/bats-core/bats-core)
    - [mlocate](https://wiki.archlinux.org/index.php/Mlocate)
    - [mutt](https://gitlab.com/muttmua/mutt)
    - [cmake](https://cmake.org/)
    - [docker](https://www.docker.com/)
    - [docker-compose](https://docs.docker.com/compose/)
    - [dry](https://github.com/moncho/dry)
    - [emojify](https://github.com/mrowa44/emojify)

## Project Structure

A simple project overview to with the explaination of each important file

```
+-- ansible
|   +-- vagrant
|       +-- ...
|   +-- ansible.sh
+-- docs
|   +-- vendor
|       +-- ...
|   +-- docs.md
|   +-- generate_docs.md
+-- etc
|   +-- ...
+-- src
|   +-- docker
|   |   +-- images
|   |   |   +-- $container_name
|   |   |   |    +-- docker-compose.yml
|   |   |   |    +-- $container_name.sh
|   |   |   |    +-- ...
|   |   +-- docker.sh
|   |   +-- container.sh
|   +-- install.sh
|   +-- menu.sh
|   +-- utils.sh
+-- setup.sh
+-- uninstall.sh
```

| Path                       |                            Explanation                           |
|----------------------------|:----------------------------------------------------------------:|
| ansible                    |  Ansible playbook script to install the project and for testing  |
| ansible/vagrant            |             Vagrant to test the ansible installation             |
| docs                       | The directory for the documentation for the code and the project |
| docs/vendor                |         The vendor program to generate the documentation         |
| src                        |               The path for the code for the project              |
| src/docker                 |              The path for all docker related script              |
| src/docker/$container_name |  The path for docker container with a script and docker-compose  |


## How to run coverage and tests

For running the [bats](https://github.com/bats-core/bats-core) tests 

```bash
cd tests
bash test.sh
```

For running and generate with [kcov](https://github.com/SimonKagstrom/kcov)
```bash 
cd tests
source coverage.sh
use_kcov
```


## How to generate the documentation

For running and generate the documentation with [shdoc](https://github.com/reconquest/shdoc)

```bash 
git submodule update --init --recursive
git pull --recurse-submodules
git submodule update --remote
cd docs
chmod +x generate_docs.sh
bash generate_docs.sh docs.md
```

Go to [docs](docs/docs.md)

## Code of Conduct

Go to [Code of Conduct](.github/CODE_OF_CONDUCT.md)

## Contributing

Go to [Contributing](.github/CONTRIBUTING.md)

## Changelog

Go to [Changelog](docs/CHANGELOG.md)

## License

Go to [License](License.md)