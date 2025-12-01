# My Book

🧰 Under building...

---

### Steps

- [General Things](#General)
- [chmod](#chmod)
- [iperf](#iperf)
- [multicast](#Multicast)
- [cURL](#cURL)
- [iwlwifi](#iwlwifi)

---
### General
General information for new installations and whatever:

- For `dust` notification with `i3lock`:
If you do not want to get notification with screen lock, just enable this option in the `picom.conf`:
```
unredir-if-possible = true
```

- If you need _Nerd Giphs_, you can download it [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip).
- `QT` Theme with defaul `GTK` (basic):
```
$ sudo apt install -y qt5-style-plugins
$ sudoedit /etc/environment
$ # add QT_QPA_PLATFORMTHEME=gtk2
```
- For DPI:
```
$ echo 'Xft.dpi: 120' >> .Xresources
$ # other options are: 96, 120, 141, 144, 168, 192
```
2. General Information

- Base64
> Encode: `echo -n {123} |base64`
> Decode: `echo -n {xpto} |base64 --decode`

- Other convertions
> Hexadecimal to decimal: `echo $(())`
> Decimal to Hexadecimal: `printf '%x\n {10}`

- Firmware package name (for Debian-based)
> Install `apt-file`
> Update the list with `apt-file update`
> Then: `apt-file search --package-only /firmware/package`

- NTFS
> `sudo mkfs.ntfs -f /dev/sd{}`

- Lib-virt
> Run it without sudo: `sudo usermod -a -G libvirt {username}`

3. For fun with **Arch-based**

- Alternative to `lxappearance`:
> `$ sudo pacman -S nwg-look`

- For some Flatpak apps that requires web:
> `$ sudo pacman -S xdg-desktop-portal-gtk`

---
### chmod

Here are some examples of how to use the chmod command in numeric mode:

- Give the file’s owner read and write permissions and only read permissions to group members and all other users:
```
chmod 644 dirname
```

- Give the file’s owner read, write and execute permissions, read and execute permissions to group members and no permissions to all other users:
```
chmod 750 dirname
```

- Give read, write, and execute permissions, and a sticky bit to a given directory:
```
chmod 1777 dirname
```

- Recursively set read, write, and execute permissions to the file owner and no permissions for all other users on a given directory:
```
chmod -R 700 dirname
```

---
### Iperf

Example:
```
iperf -B 10.50.3.170 -c 234.50.98.102 -u -T 32 -t 5 -b 100M -p 8000
```

!! Need to be improved...

---
### Multicast
(in portuguese)

_Diretório: `/etc/sysctl.d/`_

> Habilitar o roteamento multicast para IPv4.
Isso permite que o sistema opere como um roteador multicast, encaminhando pacotes multicast entre interfaces.
```
net.ipv4.conf.all.mc_forwarding = 1
```

> Habilitar o roteamento multicast para IPv6.
Assim como para IPv4, habilita o encaminhamento de pacotes multicast entre interfaces no IPv6.
```
net.ipv6.conf.all.mc_forwarding = 1
```

> Definir o tamanho máximo do buffer de recepção para soquetes.
Um valor maior permite que o kernel lide melhor com surtos de tráfego multicast, reduzindo a perda de pacotes.
```
net.core.rmem_max = 26214400
```

> Definir o tamanho máximo do buffer de envio para soquetes.
Assim como o buffer de recepção, um buffer de envio maior pode ajudar a acomodar tráfego intenso, melhorando a performance de transmissão.
```
net.core.wmem_max = 26214400
```

Estas configurações são aplicadas imediatamente após o carregamento deste arquivo pelo sistema no boot.
Para aplicar manualmente as alterações sem reiniciar, use o comando: `sudo sysctl --system`

---
### cURL
- Login usign curl on FTP or SFTP:
```
curl  -P - --insecure "ftp://82.45.34.23:21/" --user "testuser:testpassword"

curl  -k "sftp://83.46.38.23:22/" --user "testuser:testpassword"
```

- Upload using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/" --user "testuser:testpassword" -T "C:\test\testfile.xml" --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/" --user "testuser:testpassword" -T "C:\test\testfile.xml" --ftp-create-dirs
```

- Download using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/testfile.xml" --user "testuser:testpassword" -o "C:\test\testfile.xml" --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/testfile.xml" --user "testuser:testpassword" -o "C:\test\testfile.xml" --ftp-create-dirs
```

- Rename using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/" --user "testuser:testpassword" -Q "-RNFR /CurlPutTest/testfile.xml"  -Q "-RNTO /CurlPutTest/testfile.xml.tmp"   --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/" --user "testuser:testpassword" -Q "-RENAME ‘/CurlPutTest/testfile.xml’  ‘/CurlPutTest/testfile.xml.tmp’"   --ftp-create-dirs
```

- Delete using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/testfile.xml" --user "testuser:testpassword" -Q "–DELE  /CurlPutTest/testfile.xml" --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/ " --user "testuser:testpassword" -Q "–RM /CurlPutTest/testfile.xml" --ftp-create-dirs
```

- Make directory using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/test" --user "testuser:testpassword" -Q "-MKD /CurlPutTest/test"  --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/test " --user "testuser:testpassword" -Q "–MKDIR /CurlPutTest/Test" --ftp-create-dirs
```

- Remove directory using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/test" --user "testuser:testpassword" -Q "-RMD /CurlPutTest/test"  --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/test " --user "testuser:testpassword" -Q "–RMDIR /CurlPutTest/Test" --ftp-create-dirs
```

---
### iwlwifi
- Check the Wi-Fi card status:
```
sudo iwconfig wlp1s0 power off/on
```
- Scan to check the ESSID:
```
sudo iwlist wlp1s0 scan |grep ESSID
```
- Generate the correct data for it:
```
sudo wpa_passphrase "2.4G" "1234567890" > 2g.conf
```
- Try to connect:
```
sudo wpa_supplicant -i wlp1s0 -c 2G.conf -D wext,nl80211
```
- Maybe it's necessary to shutdown the networking service:
```
sudo systemctl shutdown networking.service
```
- If it worked, you need to add a background param:
```
sudo wpa_supplicant -B -i wlp1s0 -c 2G.conf -D wext,nl80211
```
- Run the DHCP
```
sudo dhclient wlp1s0
```
- For Dell (weird issue):
```
sudo lsmod | grep -o -e ^iwlmvm -e ^iwldvm -e ^iwlwifi | xargs sudo rmmod && sleep 3 && sudo modprobe iwlwifi swcrypto=0
```
---
