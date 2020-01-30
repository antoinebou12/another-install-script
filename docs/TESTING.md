# Testing

[Download Ubuntu server](https://ubuntu.com/download/server)

## Manuel Testing

Using virtual machine you can test the install script manually

### VirtualBox

[Virtualbox](https://www.virtualbox.org/wiki/Downloads)

- ![Create virtualbox vm](images/virtualbox_create_vm.png)
- ![Add iso to vm](images/virtualbox_create_vm.png)
- Install the minimal installation of ubuntu
- Restart VM

```bash
sudo apt-get install bats

git clone --recursive https://github.com/antoinebou13/another-install-script.git
cd another-install-script

cd tests
bash tests.sh
cd ..

bash install.sh
```

### Qemu


```bash
sudo apt-get install qemu-kvm qemu virt-manager virt-viewer libvirt-bin
qemu-img create -f qcow2 ubuntu.qcow 20G
qemu-system-x86_64 -hda ubuntu.qcow -boot d -cdrom </path_to_iso> -m 2000
# Install the minimal installation of ubuntu
qemu -hda ubuntu.qcow -m 2000

sudo apt-get install bats

git clone --recursive https://github.com/antoinebou13/another-install-script.git
cd another-install-script

cd tests
bash tests.sh
cd ..

bash install.sh
```
