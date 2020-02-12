# another-install-script

[![Build Status](https://travis-ci.com/antoinebou13/another-install-script.svg?token=MUq69udyyqAR24bsXgRq&branch=master)](https://travis-ci.com/antoinebou13/another-install-script)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/antoinebou13/another-install-script?style=flat)
![Codecov](https://img.shields.io/codecov/c/github/antoinebou13/another-install-script?style=flat&token=FcTtxpEGhF)
![GitHub repo size](https://img.shields.io/github/repo-size/antoinebou13/another-install-script?style=flat)
![GitHub](https://img.shields.io/github/license/antoinebou13/another-install-script?style=flat)

Another install Script is a W.I.P project/script to install docker container for my personal server

![Another install Script](docs/images/another-install-script.png)


## The story behind the project

I started working on the project because I just bought a VPS to host my TeamSpeak and Minecraft server.
After navigating [r/selfhosting](https://www.reddit.com/r/selfhosted), I saw the multiple of several services/servers that can be simply installed with docker. After learning more on docker and docker-compose to create bash project install script using Test-driven development and documented install script. Also, I found multiple repos that tries to do the same thing with their favorite container [IOStack](https://github.com/gcgarner/IOTstack) and [sovereign](https://github.com/sovereign/sovereign) and [MediaServrDockerCompose](https://github.com/vaeyo/MediaServer-DockerComposeFiles). I am trying to do with this project is to make a simple, extensible and customizable script to add a lot of selfhosted services/servers to easy to install with a simple cli menu. The project is a super easy install script for beginner/intermediate linux power user that want to test quickly interesting docker images of server/service. The project isn't a highly configurable install script with a container orchestrator and general manager for multiple docker.


## How to install

For now only work on ubuntu and only tested on ubuntu18.04

```bash
git clone --recursive https://github.com/antoinebou13/another-install-script.git
cd another-install-script
bash install.sh
```

## List of the services/server

Some services/servers cannot be installed at the same time
Also more configuration needed for certain services/servers

| Name                                                                          | Description                                                                                                           | Docker | Ports                | Web server | Volumes                               | Implemented |
| ----------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | ------ | -------------------- | ---------- | ------------------------------------- | ----------- |
| [airsonic](https://github.com/linuxserver/docker-airsonic)                    | Music and Podcast server                                                                                              | ✔️     | [4040, 1900]         | :4040      | /home/udocker/airsonic/               | ❌           |
| [bitwarden](https://github.com/bitwarden)                                     | Open source password management                                                                                       | ✔️     | [8003]               | :8003      | /home/udocker/bitwarden               | ❌           |
| [bookstack](https://www.bookstackapp.com/)                                    | Simple, self-hosted, easy-to-use platform for organising and storing information                                      | ✔️     | [8004]               | :8004      | /home/udocker/bookstack               | ❌           |
| [calibre](https://github.com/kovidgoyal/calibre)                              | Powerful and easy to use e-book manager                                                                               | ✔️     | [8005]               | :8005      | /home/udocker/calibre                 | ❌           |
| [cloud-torrent](https://github.com/jpillora/cloud-torrent)                    | A self-hosted remote torrent client                                                                                   | ✔️     | [8006]               | :8006      | /home/udocker/cloud-torrent           | ❌           |
| [code-server](https://github.com/cdr/code-server)                             | Run VS Code on a remote server                                                                                        | ✔️     | [8007]               | :8007      | /home/udocker/code-server             | ❌           |
| [couchpotato](https://github.com/CouchPotato/CouchPotatoServer)               | Automatic Movie Downloading via NZBs & Torrents                                                                       | ✔️     | [8008]               | :8008      | /home/udocker/couchpotato             | ❌           |
| [cyberchef](https://github.com/gchq/CyberChef)                                | The Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis                        | ✔️     | [8009]               | :8009      | /home/udocker/cyberchef               | ❌           |
| [deluge](https://github.com/deluge-torrent/deluge)                            | BitTorrent Client                                                                                                     | ✔️     | [8010]               | :8010      | /home/udocker/deluge                  | ❌           |
| [drawio](https://hub.docker.com/r/fjudith/draw.io)                            | Free online diagram software                                                                                          | ✔️     | [8011]               | :8011      | /home/udocker/drawio                  | ❌           |
| [duplicati](https://hub.docker.com/r/linuxserver/duplicati/)                  | Backup software to store encrypted backups                                                                            | ✔️     | [8012]               | :8012      | /home/udocker/duplicati               | ❌           |
| [firefly-iii](https://www.firefly-iii.org/)                                   | A free and open source personal finance manager                                                                       | ✔️     | [8013]               | :8013      | /home/udocker/firefly-iii             | ❌           |
| [freshrss](https://hub.docker.com/r/linuxserver/freshrss)                     | A free, self-hostable aggregator RSS                                                                                  | ✔️     | [8014]               | :8014      | /home/udocker/freshrss                | ❌           |
| [gitea](https://gitea.io/en-us/)                                              | A painless self-hosted Git service                                                                                    | ✔️     | [8015]               | :8015      | /home/udocker/gitea                   | ❌           |
| [gitlab](https://hub.docker.com/r/gitlab/gitlab-ce/)                          | Gitlab service self-hosted                                                                                            | ✔️     | [8016]               | :8016      | /home/udocker/gitlab                  | ❌           |
| [glances](https://nicolargo.github.io/glances/)                               | Cross-platform system monitoring tool written in Python.                                                              | ✔️     | [8017]               | :8017      | /home/udocker/glances                 | ❌           |
| [grafana](https://grafana.com/)                                               | The open source analytics and monitoring solution                                                                     | ✔️     | [8018]               | :8018      | /home/udocker/grafana                 | ❌           |
| [graylog](https://docs.graylog.org/en/3.1/pages/installation/docker.html)     | Free and open source log management                                                                                   | ✔️     | [8019]               | :8019      | /home/udocker/graylog                 | ❌           |
| [guacamole](https://github.com/oznu/docker-guacamole)                         | Apache guacamole is clientless remote desktop gateway                                                                 | ✔️     | [8020]               | :8020      | /home/udocker/guacamole               | ❌           |
| [headphones](https://hub.docker.com/r/linuxserver/headphones/)                | Automated music downloader for NZB and Torrent, written in Python                                                     | ✔️     | [8021]               | :8021      | /home/udocker/headphones              | ❌           |
| [heimdall](https://hub.docker.com/r/linuxserver/heimdall/)                    | An Application dashboard and launcher                                                                                 | ✔️     | [8022]               | :8022      | /home/udocker/heimdall                | ❌           |
| [huginn](https://github.com/huginn/huginn)                                    | Create agents that monitor and act on your behalf                                                                     | ✔️     | [8023]               | :8023      | /home/udocker/huginn                  | ❌           |
| [invidious](https://github.com/omarroth/invidious)                            | alternative front-end to YouTube                                                                                      | ✔️     | [8024]               | :8024      | /home/udocker/invidious               | ❌           |
| [jackett](https://github.com/Jackett/Jackett)                                 | API Support for your favorite torrent trackers                                                                        | ✔️     | [8025]               | :8025      | /home/udocker/jackett                 | ❌           |
| [jellyfin](https://jellyfin.org/)                                             | Free Software Media System also alternative for plex                                                                  | ✔️     | [8026]               | :8026      | /home/udocker/jellyfin                | ❌           |
| [jenkins](https://jenkins.io/)                                                | Open source automation server CI/CD                                                                                   | ✔️     | [8027, 25566]        | :8027      | /home/udocker/jenkins                 | ❌           |
| [jupyterhub](https://github.com/jupyterhub/jupyterhub)                        | Multi-user server for Jupyter notebooks                                                                               | ✔️     | [8028]               | :8028      | /home/udocker/jupyterhub              | ❌           |
| [jupyterlab](https://jupyterlab.readthedocs.io/en/stable/)                    | Single-user server for Jupyter notebooks                                                                              | ✔️     | [8029]               | :8029      | /home/udocker/jupyterlab              | ❌           |
| [keycloak](https://www.keycloak.org/)                                         | Open source identity and access management                                                                            | ✔️     | [8030]               | :8030      | /home/udocker/keycloak                | ❌           |
| [komga](https://github.com/gotson/komga)                                      | Media server for comics/mangas/BDs with API and OPDS support                                                          | ✔️     | [8031]               | :8031      | /home/udocker/komga                   | ❌           |
| [liberapay](https://en.liberapay.com/)                                        | Recurrent donations platform like Patreon                                                                             | ✔️     | [8032]               | :8032      | /home/udocker/liberapay               | ❌           |
| [libresignage](https://github.com/eerotal/LibreSignage)                       | An open source digital signage solution                                                                               | ✔️     | [8033]               | :8033      | /home/udocker/libresignage            | ❌           |
| [lodestone](https://github.com/AnalogJ/lodestone)                             | Personal Document Archiving (DMS, EDMS for Personal/Home Office use)                                                  | ✔️     | [8034]               | :8034      | /home/udocker/lodestone               | ❌           |
| [lychee](https://github.com/electerious/Lychee)                               | A great looking and easy-to-use photo-management-system you can run on your server, to manage and share photos        | ✔️     | [8035]               | :8035      | /home/udocker/lychee                  | ❌           |
| [mailcow](https://mailcow.email/)                                             | Mailserver docker                                                                                                     | ✔️     | [8036]               | :8036      | /home/udocker/mailcow                 | ❌           |
| [mcmyadmin](https://www.mcmyadmin.com/)                                       | Minecraft admin system                                                                                                | ✔️     | [8037, 25565]        | :8037      | /home/udocker/mcmyadmin               | ❌           |
| [medusa](https://github.com/pymedusa/Medusa)                                  | Automatic Video Library Manager for TV Shows                                                                          | ✔️     | [8038]               | :8038      | /home/udocker/medusa                  | ❌           |
| [monica](https://github.com/monicahq/monica)                                  | Personal CRM. Remember everything about your friends and family                                                       | ✔️     | [8039]               | :8039      | /home/udocker/monica                  | ❌           |
| [neko](https://github.com/nurdism/neko)                                       | A self hosted virtual browser (rabb.it clone) that runs in docker.                                                    | ✔️     | [8040]               | :8040      | /home/udocker/neko                    | ❌           |
| [netdata](https://github.com/netdata/netdata)                                 | Real-time performance monitoring, done right!                                                                         | ✔️     | [8041]               | :8041      | /home/udocker/netdata                 | ❌           |
| [nextcloud](https://github.com/nextcloud)                                     | On-premises file share and collaboration platform                                                                     | ✔️     | [8042]               | :8042      | /home/udocker/nextcloud               | ❌           |
| [olaris](https://gitlab.com/olaris/olaris-server)                             | Media Manager and transcoding server                                                                                  | ✔️     | [8043]               | :8043      | /home/udocker/olaris                  | ❌           |
| [open-streaming-platform](https://gitlab.com/Deamos/flask-nginx-rtmp-manager) | A Self-Hosted Video Streaming and Recording Server Using Python, Flask, Nginx-RTMP                                    | ✔️     | [8044]               | :8044      | /home/udocker/open-streaming-platform | ❌           |
| [openldap](https://github.com/osixia/docker-openldap)                         | Open Source implementation of the Lightweight Directory Access Protocol.                                              | ✔️     | [8045]               | :8045      | /home/udocker/openldap                | ❌           |
| [openvpn](https://github.com/kylemanna/docker-openvpn)                        | Open Source VPN                                                                                                       | ✔️     | [8046]               | :8046      | /home/udocker/openvpn                 | ❌           |
| [paperless](https://github.com/the-paperless-project/paperless)               | Scan, index, and archive all of your paper documents                                                                  | ✔️     | [8047]               | :8047      | /home/udocker/paperless               | ❌           |
| [peertube](https://joinpeertube.org/)                                         | Decentralized P2P and free/libre alternative to video broadcasting services                                           | ✔️     | [8048]               | :8048      | /home/udocker/peertube                | ❌           |
| [piwigo](https://hub.docker.com/r/linuxserver/piwigo/)                        | Photo gallery software                                                                                                | ✔️     | [8049]               | :8049      | /home/udocker/piwigo                  | ❌           |
| [plex](https://www.plex.tv/fr/)                                               | Organize, beautify, stream, and share your personal collection of movies, TV, music, and photos                       | ✔️     | [8050]               | :8050      | /home/udocker/plex                    | ❌           |
| [portainer](https://www.portainer.io/)                                        | Build and manage your Docker environments with ease today                                                             | ✔️     | [8051]               | :8051      | /home/udocker/portainer               | ❌           |
| [privatebin](https://privatebin.info/)                                        | A minimalist, open source online pastebin where the server has zero knowledge of pasted data                          | ✔️     | [8052]               | :8052      | /home/udocker/privatebin              | ❌           |
| [pyload](https://pyload.net/)                                                 | Open Source download manager and designed to be extremely lightweight, easily extensible and fully manageable via web | ✔️     | [8053]               | :8053      | /home/udocker/pyload                  | ❌           |
| [qbittorent-vpn](https://hub.docker.com/r/markusmcnugen/qbittorrentvpn/)      | Open Source software alternative to µTorrent with VPN                                                                 | ✔️     | [8054, 7227]         | :8054      | /home/udocker/qbittorent-vpn          | ❌           |
| [recipes](https://github.com/vabene1111/recipes)                              | Django application for managing recipes                                                                               | ✔️     | [8055]               | :8055      | /home/udocker/recipes                 | ❌           |
| [rocketchat](https://rocket.chat/docs/installation/docker-containers/)        | Open Source Team Communication, replace email, HipChat & Slack                                                        | ✔️     | [8056]               | :8056      | /home/udocker/rocketchat              | ❌           |
| [searx](https://github.com/asciimoo/searx)                                    | Privacy-respecting metasearch engine                                                                                  | ✔️     | [8057]               | :8057      | /home/udocker/searx                   | ❌           |
| [shiori](https://github.com/go-shiori/shiori)                                 | Simple bookmark manager built with Go                                                                                 | ✔️     | [8058]               | :8058      | /home/udocker/shiori                  | ❌           |
| [sonarr](https://github.com/smicallef/spiderfoot)                             | Smart PVR for newsgroup and bittorrent users.                                                                         | ✔️     | [8059]               | :8059      | /home/udocker/sonarr                  | ❌           |
| [spiderfoot](https://github.com/smicallef/spiderfoot)                         | Intelligence (OSINT) automation tool                                                                                  | ✔️     | [8060]               | :8060      | /home/udocker/spiderfoot              | ❌           |
| [statping](https://github.com/hunterlong/statping)                            | Status Page for monitoring your websites and applications with beautiful graphs, analytics, and plugins               | ✔️     | [8061]               | :8061      | /home/udocker/statping                | ❌           |
| [syncthing](https://github.com/syncthing/syncthing)                           | Open Source Continuous File Synchronization                                                                           | ✔️     | [8062, 22000, 21027] | :8062      | /home/udocker/syncthing               | ❌           |
| [tautulli](https://github.com/HaveAGitGat/Tdarr)                              | Monitor your Plex Media Server                                                                                        | ✔️     | [8063]               | :8063      | /home/udocker/tautulli                | ❌           |
| [tdarr](https://github.com/HaveAGitGat/Tdarr)                                 | Tdarr Beta -Audio/Video library analytics + transcode automation using FFmpeg/HandBrake + video health checking       | ✔️     | [8064]               | :8064      | /home/udocker/tdarr                   | ❌           |
| [teamspeak](https://github.com/solidnerd/docker-teamspeak)                    | Voice Chat Application                                                                                                | ✔️     | [9987, 10011, 30033] | :8065      | /home/udocker/teamspeak               | ❌           |
| [ubuntuxrdp](https://github.com/danielguerra69/ubuntu-xrdp)                   | An Ubuntu Desktop with xrdp server can be use with Apache Guacamole                                                   | ✔️     | [8066]               | :8066      | /home/udocker/ubuntuxrdp              | ❌           |
| [wallabag](https://github.com/wallabag/wallabag)                              | Save and classify articles, Read them later, Freely                                                                   | ✔️     | [8067]               | :8067      | /home/udocker/wallabag                | ❌           |
| [wireguard](https://github.com/WireGuard)                                     | VPN Server                                                                                                            | ✔️     | [8068]               | :8068      | /home/udocker/wireguard               | ❌           |
|                                                                               |                                                                                                                       |        |                      |            |                                       |             |
| [ansible](https://www.ansible.com/integrations/containers/docker)             | IT Systems automation                                                                                                 | ✔️     | [8002]               | :8002      | ❌                                     | ❌           |
| [cockpit](https://cockpit-project.org/)                                       | Open web-based interface for your servers                                                                             | ❌      | [9090]               | :9090      | ❌                                     | ❌           |

## List of other installed program

- build-essential
- git
- python3
- python3-pip
- wireless-tools
- wpasupplicant
- default-jre
- jq
- net-tools
- [vim](https://www.vim.org/)
- [snapd](https://snapcraft.io/)
- [nnn](https://github.com/jarun/nnn)
- [nmap](https://nmap.org/)
- [wget](https://www.gnu.org/software/wget/)
- [curl](https://github.com/curl/curl)
- [mlocate](https://wiki.archlinux.org/index.php/Mlocate)
- [cmake](https://cmake.org/)
- [docker](https://www.docker.com/)
- [docker-compose](https://docs.docker.com/compose/)
- [dry](https://github.com/moncho/dry)
- [emojify](https://github.com/mrowa44/emojify)
- [signal-cli](https://github.com/AsamK/signal-cli)

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
|   +-- images
|   |   +-- $container_name
|   |   |   |    +-- docker-compose.yml
|   |   |   |    +-- $container_name.sh
|   |   |   |    +-- ...
|   +-- docker.sh
|   +-- container.sh
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
| src/images/$container_name |  The path for docker container with a script and docker-compose  |

## How to run coverage and tests

[Manuel Testing](docs/TESTING.md)

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
cd docs/generator
chmod +x generate_docs.sh
bash generate_docs.sh ../docs.md
```

## Documentation

Go to [docs](docs/docs.md)

## Code of Conduct

Go to [Code of Conduct](.github/CODE_OF_CONDUCT.md)

## Contributing

Go to [Contributing](.github/CONTRIBUTING.md)

## Changelog

Go to [Changelog](docs/CHANGELOG.md)

## License

Go to [License](.github/LICENSE)

## Roadmap

- [] Easier config file or adding yml file to individual folder
- [] More docker container and images
- [] Automatic docker compose and container update
- [] Automatic backup
- [] Automatic testing and better coverage
- [] Versionning
- [] Better cli menu
- [] Rewrite in python
