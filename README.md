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



## How to install 

```bash 
git clone --recursive https://github.com/antoinebou13/personal-vps.git
git submodule update --init --recursive
git pull --recurse-submodules
git submodule update --remote
```


## How to run coverage and tests

For running the bats tests 
```bash 
cd tests
bash test.sh
```

For running coverge with kcov
```bash 
cd tests
source coverage
use_kcov
```


## How to generate the documentation

```bash 
cd docs
chmod +x generate_docs.sh
bash generate_docs.sh docs.md

```

## Contribute