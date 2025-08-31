#!/bin/bash
# Thanatos Suricata Installer & Rules Deployer

# Check root
if [[ $EUID -ne 0 ]]; then
   echo "Please run as root"
   exit 1
fi

# Display Thanatos banner
if command -v figlet >/dev/null 2>&1; then
    figlet -f slant "Thanatos"
else
    echo "####################################"
    echo "#         THANATOS SURICATA        #"
    echo "####################################"
fi

# Ask for distro to install suricata properly
echo "Which Linux distro are you using?"
select distro in "Debian/Ubuntu" "Fedora/RHEL" "Arch" "Quit"; do
    case $distro in
        "Debian/Ubuntu")
            PKG_INSTALL="apt update && apt install -y suricata git curl figlet"
            break
            ;;
        "Fedora/RHEL")
            PKG_INSTALL="dnf install -y suricata git curl figlet"
            break
            ;;
        "Arch")
            PKG_INSTALL="pacman -Syu --noconfirm suricata git curl figlet"
            break
            ;;
        "Quit")
            exit 0
            ;;
        *)
            echo "Invalid option $REPLY"
            ;;
    esac
done
