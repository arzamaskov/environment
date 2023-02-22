# My home configs, scripts and installation process

## How I install my system

### Preparing

Get fresh [Fedora image](https://getfedora.org/en/workstation/download/){:target="blank"} and write it to the USB drive:

```sh
sudo dnf install mediawriter
```

### BIOS

Boot to BIOS and set supervisor password. Block changing boot without password.

### Install

Start installer.

1. Select English language.
2. Add US and Russian keyboard layouts.
3. Use disk manual mode. Create partitions automatically.

### System update

Remove unnecessary packages:

```sh
sudo dnf remove cheese rhythmbox gnome-boxesd orca gnome-contacts gnome-getting-started-docs gnome-shell-extension-* gnome-characters gnome-maps gnome-photos simple-scan virtualbox-guest-additions gnome-boxes gnome-tour gnome-connections mediawriter yelp podman
```

Add RPM Fusion:

```sh
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Add Flatpak repository:

```sh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Install applications from Flatpak:
```sh
flatpak install flathub  org.telegram.desktop org.videolan.VLC org.apache.netbeans
```

Add Flatpak Beta repository:
```sh
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
```

Update system via Software Center.

Disable Software auto-start:

```sh
dconf write /org/gnome/software/allow-updates false
dconf write /org/gnome/software/download-updates false
mkdir -pv ~/.config/autostart && cp /etc/xdg/autostart/org.gnome.Software.desktop ~/.config/autostart/
echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/gnome-software-service.desktop
dconf write /org/gnome/desktop/search-providers/disabled "['org.gnome.Software.desktop']"
echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/org.gnome.Software.desktop
```

### Base settings:

Add to `/etc/default/grub`:

```sh
GRUB_TIMEOUT=0
GRUB_TERMINAL_OUTPUT="console"

```
Remove `quiet splash` settings.

Rebuild GRUB:

```sh
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
```

Disable file system scanning:

```sh
dconf write /org/freedesktop/tracker/miner/files/crawling-interval -2
```

### Install development soft

Install tools:

```sh
sudo dnf install git ripgrep bat neovim
```

Install Zsh:

```sh
sudo dnf install zsh util-linux-user
```

### Terminal

```sh
chsh -s /bin/zsh
```

Logout.

Install Oh my zsh:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install Kitty:

```sh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
mkdir -p ~/.local/bin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
```

### Personal files

Clone config files:

```sh
git clone git@github.com:arzamaskov/environment.git ~/Dev/environment
```

Copy configs:

```sh
~/Dev/environment/bin/copy-env system
```

Change permissions:

```sh
chmod 744 ~/.ssh
chmod 644 ~/.ssh/*
chmod 600 ~/.ssh/id_ed25519 ~/.ssh/id_rsa
```

```sh
rm ~/.bash_history ~/.bash_logout
```

### GNOME settings

Open settings:

- **Background:** use standard GNOME wallpaper.
- **Notifications:** disable Lock Screen Notifications.
- **Search:** enable: Application Search, Search Location, Files, Calculator, Settings.
- **Multitasking:** disable Active Screen Edges.
- **Online Accounts:** add Google account.
- **Power:** Show Battery Percentage.
- **Mouse & Touchpad:** enable Tap to Click.

Disable Terminal beep:

```sh
dconf write /org/gnome/desktop/sound/event-sounds "false"
```

Nautilus:

- Enable Sort folders before files.


Install GNOME Tweaks:

```sh
sudo dnf install gnome-tweak-tool
```

- **General:** enable Over-Amplification.
- **Top Bar:** enable Date.
- **Keyboard & Mouse:** enable Adaptive in Acceleration Profile.

Add icons:

```sh
sudo dnf copr enable dusansimic/themes
sudo dnf install morewaita-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'MoreWaita'
```
Set `/usr/share/icons/MoreWaita/places/scalables/folder-code.svg` icon for `~/Dev/`.

### Additional Software

Install Chrome:

```sh
sudo dnf install google-chrome-stable
```

Install tools for compile:

```sh
sudo dnf install make gcc-c++ gcc make bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel
```

Install asdf:

```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
```
