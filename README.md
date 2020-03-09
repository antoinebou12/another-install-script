# another-install-script

![GitHub top language](https://img.shields.io/github/languages/top/antoinebou13/another-install-script)
[![Build Status](https://travis-ci.com/antoinebou13/another-install-script.svg?token=MUq69udyyqAR24bsXgRq&branch=master)](https://travis-ci.com/antoinebou13/another-install-script)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/antoinebou13/another-install-script)
[![codecov](https://codecov.io/gh/antoinebou13/another-install-script/branch/master/graph/badge.svg?token=FcTtxpEGhF)](https://codecov.io/gh/antoinebou13/another-install-script)
![GitHub repo size](https://img.shields.io/github/repo-size/antoinebou13/another-install-script)
![GitHub](https://img.shields.io/github/license/antoinebou13/another-install-script)

Another install Script is a W.I.P project/script to install docker container for my personal server

![Another install Script](docs/images/another-install-script.png)

## The story behind the project

I started working on the project because I just bought a VPS to host my TeamSpeak and Minecraft server.
After navigating [r/selfhosting](https://www.reddit.com/r/selfhosted), I saw the multiple of several services/servers that can be simply installed with docker. After learning more on docker and docker-compose to create bash project install script using Test-driven development and documented install script. Also, I found multiple repos that tries to do the same thing with their favorite container [IOStack](https://github.com/gcgarner/IOTstack) and [sovereign](https://github.com/sovereign/sovereign) and [MediaServerDockerCompose](https://github.com/vaeyo/MediaServer-DockerComposeFiles). I am trying to do with this project is to make a simple, extensible and customizable script to add a lot of selfhosted services/servers to easy to install with a simple cli menu. The project is a super easy install script for beginner/intermediate linux power user that want to test quickly interesting docker containers of server/service. The project isn't a highly configurable install script with a container orchestrator and general manager for multiple docker.

## How to install

For now only work on ubuntu and only tested on ubuntu18.04

```bash
git clone --recursive https://github.com/antoinebou13/another-install-script.git
cd another-install-script
sudo bash another-install-script.sh
```

### Uninstall

```bash
cd another-install-script
sudo bash install.sh
```

## List of the services/server

Some services/servers cannot be installed at the same time
Also more configuration needed for certain services/servers

<details>
<summary>List</summary>
<br>
Go to the <a href="https://drive.google.com/file/d/1s2Il9qeJdZj-NYnzfveIW-HfnRhwkce-/view?usp=sharing">Google Sheet</a>
</details>



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
- firefox
- [vim](https://www.vim.org/)
- [snapd](https://snapcraft.io/)
- [nmap](https://nmap.org/)
- [wget](https://www.gnu.org/software/wget/)
- [curl](https://github.com/curl/curl)
- [mlocate](https://wiki.archlinux.org/index.php/Mlocate)
- [cmake](https://cmake.org/)
- [docker](https://www.docker.com/)
- [docker-compose](https://docs.docker.com/compose/)
- [dry](https://github.com/moncho/dry)
- [emojify](https://github.com/mrowa44/emojify)

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
|   +-- containers
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

| Path                        |                           Explanation                            |
| --------------------------- | :--------------------------------------------------------------: |
| docs                        | The directory for the documentation for the code and the project |
| docs/vendor                 |         The vendor program to generate the documentation         |
| src                         |              The path for the code for the project               |
| src/containers/\$container_name |  The path for docker container with a script and docker-compose  |

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

Go to [Documentation](docs/docs.md)

## Code of Conduct

Go to [Code of Conduct](.github/CODE_OF_CONDUCT.md)

## Contributing

![Please Contribute for Bernie](docs/images/contribution.png)

Go to [Contributing](.github/CONTRIBUTING.md)

## Changelog

Go to [Changelog](docs/CHANGELOG.md)

## License

Go to [License](.github/LICENSE)

## Roadmap

- [] Auto vm creation for ci and personnal use
- [] Add traefik reverse proxy with subdomain for each docker container
- [] Easier config file or adding yml file to individual folder
- [] More docker containers
- [] Automatic docker compose and containers update
- [] Automatic backups
- [] Automatic testing and better coverage
- [] Versionning
- [] Better cli menu
- [] Rewrite in python
