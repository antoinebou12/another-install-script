# another-install-script

[![Build Status](https://travis-ci.com/antoinebou13/another-install-script.svg?token=MUq69udyyqAR24bsXgRq&branch=master)](https://travis-ci.com/antoinebou13/another-install-script)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/antoinebou13/another-install-script?style=flat)
![Codecov](https://img.shields.io/codecov/c/github/antoinebou13/another-install-script?style=flat&token=FcTtxpEGhF)
![GitHub repo size](https://img.shields.io/github/repo-size/antoinebou13/another-install-script?style=flat)
![GitHub](https://img.shields.io/github/license/antoinebou13/another-install-script?style=flat)

Another install Script is a W.I.P project/script to install docker container for my personal server

## The story behind the project

I started working on the project because I just bought a VPS to host my TeamSpeak and Minecraft server.
After navigating [r/selfhosting](https://www.reddit.com/r/selfhosted), I saw the multiple of several services/servers that can be simply installed with docker.After learning more on docker and docker-compose to create bash project install script using Test-driven development and documented. Also, I found so GitHub repo that tries to do the same thing with their favorite container [IOStack](https://github.com/gcgarner/IOTstack).I am trying to do with this project is to make a simple, extensible and customizable script to add most of Heimdall appand other selfhosted services/servers to easy to install with a simple cli menu.

## How to install

For now only work on ubuntu and only tested on ubuntu18.04

```bash
git clone --recursive https://github.com/antoinebou13/personal-vps.git
cd personal-vps
bash setup.sh
```

## List of the services/server

Some services/server cannot be installed at the same time

| Name                                                                      | Docker | Ports              | Volumes | Web server | Default |
| ------------------------------------------------------------------------- | ------ | ------------------ | ------- | ---------- | ------- |
| [ansible](https://github.com/ansible/ansible)                             | ✔️     |                    |         |            |         |
| [cloud_torrent](https://github.com/jpillora/cloud-torrent)                | ✔️     |                    |         | :6889      |         |
| [deluge](https://github.com/linuxserver/docker-deluge)                    | ✔️     |                    |         |            |         |
| [firefly-iii](https://github.com/firefly-iii/firefly-iii)                 | ✔️     |                    |         |            |         |
| [gitea](https://github.com/go-gitea/gitea)                                | ✔️     |                    |         |            |         |
| [gitlab](https://docs.gitlab.com/ee/install/docker.html)                  | ✔️     |                    |         |            |         |
| [grafana](https://github.com/grafana/grafana)                             | ✔️     |                    |         |            |         |
| [hlsxmltv](https://github.com/deanochips/HLS-XMLTV-Docker)                | ✔️     |                    |         |            |         |
| [heimdall](https://github.com/linuxserver/docker-heimdall)                | ✔️     |                    |         | :8080      | ✔️      |
| [huginn](https://github.com/huginn/huginn)                                | ✔️     |                    |         |            |         |
| [jackett](https://github.com/Jackett/Jackett)                             | ✔️     |                    |         |            |         |
| [jellyfin](https://github.com/linuxserver/docker-jellyfin)                | ✔️     |                    |         | :8096      | ✔️      |
| [jenkins](https://github.com/jenkinsci/docker)                            | ✔️     | 8001,25566         |         | :8001      |         |
| [jupyterhub](https://github.com/jupyterhub/jupyterhub)                    | ✔️     |                    |         | :9000      |         |
| [keycloak](https://hub.docker.com/r/jboss/keycloak)                       | ✔️     |                    |         |            |         |
| [komga](https://github.com/gotson/komga)                                  | ✔️     |                    |         |            |         |
| [libresignage](https://github.com/eerotal/LibreSignage)                   | ✔️     |                    |         |            |         |
| [lidarr](https://lidarr.audio/)                                           | ✔️     |                    |         |            |         |
| [mailcow](https://github.com/mailcow/mailcow-dockerized)                  | ✔️     |                    |         |            | ✔️      |
| [mcmyadmin](https://github.com/linuxserver-archive/docker-mcmyadmin2)     | ✔️     | 8065, 25565        |         | :8065      |         |
| [medusa](https://github.com/linuxserver/docker-medusa)                    | ✔️     |                    |         | :8081      | ✔️      |
| [monica](https://github.com/monicahq/monica)                              | ✔️     |                    |         |            |         |
| [mopidy](https://mopidy.com/)                                             | ✔️     |                    |         |            |         |
| [neko](https://github.com/nurdism/neko)                                   | ✔️     |                    |         |            |         |
| [netdata](https://github.com/netdata/netdata)                             | ✔️     |                    |         |            |         |
| [olaris](https://gitlab.com/olaris/olaris-server)                         | ✔️     |                    |         |            |         |
| [nextcloud](https://nextcloud.com/)                                       | ✔️     |                    |         |            |         |
| [openvpn](https://github.com/kylemanna/docker-openvpn)                    | ✔️     |                    |         |            | ✔️      |
| [paperless](https://github.com/the-paperless-project/paperless)           | ✔️     |                    |         |            |         |
| [pihole](https://pi-hole.net/)                                            | ✔️     |                    |         |            |         |
| [pyload](https://pyload.net/)                                             | ✔️     | 8000,7227          |         |            |         |
| [qbittorrent-vpn](https://github.com/MarkusMcNugen/docker-qBittorrentvpn) | ✔️     |                    |         |            |         |
| [radarr](https://github.com/Radarr/Radarr)                                | ✔️     |                    |         |            |         |
| [recalBox](https://github.com/recalbox/recalbox-docker-build)             | ✔️     |                    |         |            |         |
| [sabnzbd](https://sabnzbd.org/)                                           | ✔️     |                    |         |            |         |
| [shidori](https://github.com/go-shiori/shiori)                            | ✔️     |                    |         |            |         |
| [sonarr](https://sonarr.tv/)                                              | ✔️     |                    |         |            |         |
| [statping](https://github.com/hunterlong/statping)                        | ✔️     | 8084               |         | :8084      | ✔️      |
| [syncthing](https://github.com/syncthing/syncthing)                       | ✔️     | 8384,22000, 21027  |         | :8384      | ✔️      |
| [tautulli](https://github.com/Tautulli/Tautulli)                          | ✔️     |                    |         |            |         |
| [tdarr](https://github.com/HaveAGitGat/Tdarr)                             | ✔️     |                    |         |            |         |
| [teamspeak](https://github.com/solidnerd/docker-teamspeak)                | ✔️     | 9987, 10011, 30033 |         |            |         |
| [traefik](https://github.com/containous/traefik)                          | ✔️     |                    |         |            |         |
| [wallabag](https://github.com/wallabag/wallabag)                          | ✔️     |                    |         |            |         |
| [cockpit](https://cockpit-project.org/)                                   | ❌      | 9090               |         | :9090      | ✔️      |

## List of other installed program

* build-essential
* zip
* unzip
* git
* python3
* python3-pip
* alsa-utils
* wireless-tools
* wpasupplicant
* default-jre
* jq
* [vim](https://www.vim.org/)
* [snapd](https://snapcraft.io/)
* [bat](https://github.com/sharkdp/bat)
* [nnn](https://github.com/jarun/nnn)
* [nmap](https://nmap.org/)
* [wget](https://www.gnu.org/software/wget/)
* [curl](https://github.com/curl/curl)
* [bats](https://github.com/bats-core/bats-core)
* [mlocate](https://wiki.archlinux.org/index.php/Mlocate)
* [mutt](https://gitlab.com/muttmua/mutt)
* [cmake](https://cmake.org/)
* [docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)
* [dry](https://github.com/moncho/dry)
* [emojify](https://github.com/mrowa44/emojify)
* [signal-cli](https://github.com/AsamK/signal-cli)

## Project Structure

A simple project overview to with the explaination of each important file

```bash
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

| Path                       |                           Explanation                            |
| -------------------------- | :--------------------------------------------------------------: |
| docs                       | The directory for the documentation for the code and the project |
| docs/vendor                |         The vendor program to generate the documentation         |
| src                        |              The path for the code for the project               |
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
bash coverage.sh
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

Go to [License](.github/LICENSE)