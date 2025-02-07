# Manual Installation

1. Clone the repository
```
git clone https://github.com/AdisonCavani/distro-grub-themes.git
```

2. Create themes directory
```
sudo mkdir /location/to/grub/themes
```
Obs: Usually it's `/boot/grub`

3. Copy theme
```
sudo cp -r <theme_name>/ /location/to/grub/themes
```

4. Edit GRUB config
```
sudo vim /etc/default/grub
```
So, uncomment this line and set your display resolution:
```
GRUB_GFXMODE=1920x1080
```
Make sure `GRUB_TERMINAL_OUTPUT="console"` is commented out!

Add the path of your theme:
```
GRUB_THEME="BOOT_GRUB_LOCATION/themes/<theme_name>/theme.txt"
```

5. Update GRUB config
```
sudo update-grub
```
