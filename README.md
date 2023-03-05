# My home configs, scripts and installation process

### Preparing

Get fresh [Fedora image](https://getfedora.org/en/workstation/download/) and write it to the USB drive:

```sh
sudo dnf install mediawriter
```

### Installing

Start installer.

1. Select English language.
2. Add US and Russian keyboard layouts.
3. Use disk manual mode. Create partitions automatically. Enable Free up space by removing or shrinking existing partitions. Choose Preserve all and Reclaim space.

### Start settings

1. Privacy: disable Automatic Problem Reporting.
2. Enable Third-Party Repositories.

### System settings

1. Setup Firefox.
2. Speed-up DNF by running sudo nano `/etc/dnf/dnf.conf` and adding:

```conf
deltarpm=false
fastestmirror=true
```
3. Disable NVIDIA, Flathub Selection, and PyCharm repositories in Software Center settings.
4. Remove unnecessary packages:

```sh
sudo dnf remove cheese rhythmbox gnome-boxesd orca gnome-contacts gnome-getting-started-docs nautilus-sendto gnome-shell-extension-* gnome-characters gnome-maps gnome-photos simple-scan virtualbox-guest-additions gnome-boxes gnome-tour gnome-connections mediawriter yelp podman
```

5. Add RPM Fusion:

```sh
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Add Flatpak repository:

```sh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```
Enable Flathub repo:

```sh
flatpak remote-modify --enable flathub
```

Install applications from Flatpak:
```sh
flatpak install flathub  org.telegram.desktop org.videolan.VLC org.apache.netbeans
```

6. Update system via Software Center.
7. Disable Software auto-start:

```sh
dconf write /org/gnome/software/allow-updates false
dconf write /org/gnome/software/download-updates false
mkdir -pv ~/.config/autostart && cp /etc/xdg/autostart/org.gnome.Software.desktop ~/.config/autostart/
echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/gnome-software-service.desktop
dconf write /org/gnome/desktop/search-providers/disabled "['org.gnome.Software.desktop']"
echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/org.gnome.Software.desktop
```

8. Setup grub:

Add to `/etc/default/grub`:

```sh
GRUB_TIMEOUT=0
GRUB_TERMINAL_OUTPUT="console"

```
Remove `rhgb quiet` from GRUB_TERMINAL_OUTPUT.

Rebuild GRUB:

```sh
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
```

9. Disable file system scanning:

```sh
dconf write /org/freedesktop/tracker/miner/files/crawling-interval -2
```

10. Install Zsh:

```sh
sudo dnf install zsh util-linux-user
chsh -s /bin/zsh
```

11. Reboot.
12. `rm ~/.bash_history ~/.bash_logout`
13. Settings:
  - Notifications: disable Lock Screen Notifications
  - Search results:
    - Location: enable Downloads, Dev
    - disable Calendar, Clocks, Firefox, Photos, Software, Terminal
  - Multitasking: disable Active Screen Edges
  - Online accounts: add Google
  - Power:
    - Screen Blank: 15 min
    - Automatic Suspend: On battery power: 1 hour
    - Power button behavior: Nothing
    - enable Show Battery Percentage
  - Displays
    - Night Light: enable Sunset to Sunrise
  - Mouse & Touchpad:
    - enable Tap to Click
  - Data & Time:
    - enable Automatic Time Zone
14. Disable Terminal beep:

```sh
dconf write /org/gnome/desktop/sound/event-sounds "false"
```

15. Nautilus: enable Sort Folders Before Files

16. Set correct permissions:

```sh
chmod 744 ~/.ssh
chmod 644 ~/.ssh/*
chmod 600 ~/.ssh/id_ed25519 ~/.ssh/id_rsa
```
17. Install GNOME Tweaks:

```sh
sudo dnf install gnome-tweak-tool
```

- General: enable Over-Amplification
- Keyboard & Mouse: enable Adaptive in Acceleration Profile.
- Top Bar: enable Weekday and Week Numbers.

18. Add icon theme:

```sh
sudo dnf copr enable dusansimic/themes
sudo dnf install morewaita-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'MoreWaita'
```

Set `/usr/share/icons/MoreWaita/places/scalables/folder-code.svg` icon for `~/Dev/`.

### Install soft

* Install micro and its plugins:

```sh
sudo dnf install xclip micro
micro -plugin install editorconfig
```

* Remove nano:

```sh
sudo dnf remove nano
```

* Install kitty terminal from [Kitty site](https://sw.kovidgoyal.net/kitty/binary/) 

```sh
mkdir -p ~/.local/bin/	
```

* KeepassXC

```sh
sudo dnf install keepassxc 
```
 
* Chrome:

```sh
sudo dnf install google-chrome-stable
```

* Development tools

```sh
sudo dnf install git ripgrep bat neovim ripgrep ncdu
```

- Tool for compile:

```sh
sudo dnf install make gcc-c++ gcc make bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel
```

* Install asdf:

```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
```

* Oh my zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

* Docker

```sh
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
    
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl start docker

sudo groupadd docker

sudo usermod -aG docker $USER
```

Log out and log back.

* docker-compose:

```sh
curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o ~/.local/bin/docker-compose
chmod +x ~/.local/bin/docker-compose
```
    
* Packer:

```sh
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
 
* FZF

```sh
 git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

* mkcert

```sh
sudo dnf install nss-tools
curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
chmod +x mkcert-v*-linux-amd64
cp mkcert-v*-linux-amd64 ~/.local/bin/mkcert
```


* Clone environments and copy configs

```sh
git clone git@github.com:arzamaskov/environment.git ~/Dev/environment

# Copy environment
~/Dev/environment/bin/copy-env system
```

* Install asdf-plugins

```sh
asdf plugin-add yarn
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add ruby
asdf install
```

###  PHP

* install PHP

```sh
sudo dnf install php
```

- install Composer

```sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
```

```sh
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
```

```sh
php composer-setup.php
```

```sh
php -r "unlink('composer-setup.php');"
```

```sh
mv composer.phar ~/.local/bin/composer
```

* Install PHP's posix extension.

```sh
sudo dnf install php-process
```

* PsySH

```sh
composer g require psy/psysh:@stable 
```

### Fonts

Download Nerd fonts from [Nerd Fonts site](https://www.nerdfonts.com/font-downloads)

Create a new directory `~/.local/share/fonts/<font-family-name>/` for the new font family.

```sh
mkdir -p ~/.local/share/fonts/JetBrainsMono
```

Copy font files to the new directory.

Update the font cache:

```sh
fc-cache -v
```

**Optional:**

To resolve problem with connect Bluetooth earphones install deprecated package:

```sh
sudo dnf install bluez-deprecated
```

The package **bluez-deprecated** provides deprecated BlueZ utilities that were removed from the main BlueZ package. It includes some older Bluetooth tools, such as hidd (Human Interface Device Daemon) and sdptool (Service Discovery Protocol Tool), which are no longer included in the main BlueZ package since version 5.

The bluez-deprecated package is still available in some Linux distributions, including Fedora, to provide compatibility with older Bluetooth devices or applications that require these deprecated tools. However, it's recommended to use the newer BlueZ tools instead whenever possible, as they provide better support for the latest Bluetooth features and security updates.

Reboot.
