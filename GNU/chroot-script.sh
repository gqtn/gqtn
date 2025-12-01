### Quick script to `chroot` in Arch Linux system (using Debian)

```
# Arch Chroot
arch(){
    banner=$(figlet "Starting...")
    echo "$banner"
    sleep 1
    sudo mount --bind /mnt/arch /mnt/arch
    sudo /mnt/arch/bin/arch-chroot /mnt/arch

    banner_off=$(figlet "Closing...")
    echo "$banner_off"
    sleep 1
    sudo umount /mnt/arch
    sleep 1
    duf /
}
```

### Information
1. First, install the `debootstrap` version of your prefered system (like Arch)
2. Create a directory in the reserved locale (like `/mnt/arch`)
3. Descompact the `debootstrap` version on the reserved locale
4. Put this script in your `$HOME/.bashrc` or `$HOME/.bash_aliases` and reload it
5. Enjoy! :)

> Note: `figlet` and `duf` isn't necessary.
> So, the important is:
> ```
> sudo mount --bind /mnt/arch /mnt/arch
> sudo /mnt/arch/bin/arch-chroot /mnt/arch
> ```
