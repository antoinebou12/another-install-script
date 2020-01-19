# personal-vps





## How to install 

```bash 
git clone --recursive https://github.com/antoinebou13/personal-vps.git
git submodule update --init --recursive
git pull --recurse-submodules
git submodule update --remote
```



## How to generate the documentation

```bash 
cd docs
chmod +x generate_docs.sh
bash generate_docs.sh docs.md

```