# personal-vps



[![Build Status](https://travis-ci.com/antoinebou13/personal-vps.svg?token=MUq69udyyqAR24bsXgRq&branch=master)](https://travis-ci.com/antoinebou13/personal-vps)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/antoinebou13/personal-vps?style=flat)
![Codecov](https://img.shields.io/codecov/c/github/antoinebou13/personal-vps?style=flat&token=FcTtxpEGhF)
![GitHub repo size](https://img.shields.io/github/repo-size/antoinebou13/personal-vps?style=flat)
![GitHub](https://img.shields.io/github/license/antoinebou13/personal-vps?style=flat)



## The story behind the project

I started working on the project because I just bought a VPS to host my TeamSpeak and Minecraft server.
After navigating r/selfhosting, I saw the multiple of several services/servers that can be simply installed with docker.
After learning a bit about docker. Also, I found so GitHub repo that tries to do the same thing with their favorite container.
I am trying to do with this project is to make a simple, extensible and customizable script to add most of Heimdall app in this app

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

## How to install 

For now only work on ubuntu and only tested on ubuntu18.04

```bash 
git clone --recursive https://github.com/antoinebou13/personal-vps.git
cd personal-vps
bash setup.sh
```


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
for running and generate the documentation with [shdoc](https://github.com/reconquest/shdoc)
```bash 
git submodule update --init --recursive
git pull --recurse-submodules
git submodule update --remote
cd docs
chmod +x generate_docs.sh
bash generate_docs.sh docs.md

```

## Contribute