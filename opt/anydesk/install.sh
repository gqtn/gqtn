#!/bin/bash
set -Eeo pipefail
trap 'echo "Error occurred at line $LINENO"; exit 1' ERR

command_exists()
{
    command -v "$1" > /dev/null 2>&1
}

install_service() {
    local name="${1#anydesk-}"
    local prog_name="anydesk${name:+-$name}"
    local tmp_dir="$(mktemp -d -t "${prog_name}_XXXXXX")"

    cp -r * ${tmp_dir}/
    pushd $tmp_dir > /dev/null

    echo -e "#!/bin/bash\n\n"                                  > anydesk-global-settings
    echo -e "pkexec /usr/bin/${prog_name} --admin-settings\n" >> anydesk-global-settings

    if [[ -n "$name" ]]; then
        sed -i "s/anydesk/${prog_name}/g"    systemd/anydesk.service
        sed -i "s/AnyDesk/AnyDesk ${name}/g" systemd/anydesk.service

        sed -i "s/anydesk/${prog_name}/g"    anydesk.desktop
        sed -i "s/AnyDesk/AnyDesk ${name}/g" anydesk.desktop

        sed -i "s/com\.anydesk\.anydesk/com\.anydesk\.${prog_name}/g" polkit-1/com.anydesk.anydesk.policy
        sed -i "s/\/usr\/bin\/anydesk/\/usr\/bin\/${prog_name}/g"     polkit-1/com.anydesk.anydesk.policy

        find icons -name "anydesk.png" -type f -execdir bash -c 'mv "$1" "${2}.png"' _ "{}" "$prog_name" \;
        find icons -name "anydesk.svg" -type f -execdir bash -c 'mv "$1" "${2}.svg"' _ "{}" "$prog_name" \;
    fi

    sudo chown -R root:root .
    sudo chmod -R 644 .
    sudo chmod 755 anydesk
    sudo chmod 755 anydesk-global-settings

    remove_service $prog_name

    sudo cp anydesk                              /usr/bin/$prog_name
    sudo cp anydesk-global-settings              /usr/bin/${prog_name}-global-settings
    sudo cp anydesk.desktop                      /usr/share/applications/${prog_name}.desktop
    sudo cp polkit-1/com.anydesk.anydesk.policy  /usr/share/polkit-1/actions/com.anydesk.${prog_name}.policy
    sudo cp -r icons                             /usr/share/
    sudo cp systemd/anydesk.service              /etc/systemd/system/${prog_name}.service

    sudo systemctl daemon-reload
    sudo systemctl -q enable ${prog_name}.service
    sudo systemctl start ${prog_name}.service

    command_exists update-menus              && sudo update-menus
    command_exists update-desktop-database   && sudo update-desktop-database
    command_exists xdg-desktop-menu          && sudo xdg-desktop-menu forceupdate
}

remove_service() {
    local name="${1#anydesk-}"
    local prog_name="anydesk${name:+-$name}"

    sudo systemctl stop ${prog_name}.service                                   > /dev/null 2>&1 || true
    sudo systemctl -q disable ${prog_name}.service                             > /dev/null 2>&1 || true

    sudo rm /usr/bin/$prog_name                                                > /dev/null 2>&1 || true
    sudo rm /usr/bin/${prog_name}-global-settings                              > /dev/null 2>&1 || true
    sudo rm /usr/share/applications/${prog_name}.desktop                       > /dev/null 2>&1 || true
    sudo rm /usr/share/polkit-1/actions/com.anydesk.${prog_name}.policy        > /dev/null 2>&1 || true
    sudo rm /etc/systemd/system/${prog_name}.service                           > /dev/null 2>&1 || true
    sudo find /usr/share/icons/hicolor/ -name "${prog_name}.*" -type f -delete > /dev/null 2>&1 || true
}

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

A helper script to install or remove anydesk service.

Options:
  --install [CUSTOM NAME]    Install anydesk files to the default/recommended locations
  --remove  [CUSTOM NAME]    Remove existing anydesk installation

[CUSTOM NAME] is an optional program name or suffix used to customize anydesk service name and installation files.
Use it when you have anydesk Custom Client and you would like to install and run it alongside with the default installed client.

Examples:
  ./$(basename "$0") --install               Install default anydesk service.
  ./$(basename "$0") --remove                Remove default installed anydesk service.
  ./$(basename "$0") --install homeoffice    Install anydesk service with "anydesk-homeoffice" name. Equivalent to '--install anydesk-homeoffice'
  ./$(basename "$0") --install homeoffice    Remove anydesk service that was installed with "anydesk-homeoffice" name. Equivalent to '--remove anydesk-homeoffice'
EOF
    exit 1
}

case "$1" in
    --install)
        install_service "$2"
        ;;
    --remove)
        remove_service "$2"
        ;;
    *)
        usage
        ;;
esac
