set -xl BASE_PKGS base base-devel linux linux-firmware networkmanager vim tmux elinks fish lvm2

set -x PACMAN_PKGS nm-connection-editor networkmanager-openvpn ttf-droid pipewire pipewire-alsa pipewire-pule \
    pipewire-jack wireplumber firefox keepassxc mpd ncmpcpp mpc mpv mako sway swaylock swayidle swaybg \
    polkit wlroots tlp acpi neovim python-neovim brightnessctl go rustup ripgrep btop foot fuzzel \
    zathura zathura-pdf-mupdf zathura-djvu gimp inkscape krita imv xdg-desktop-portal xdg-desktop-portal-wlr \
    lxqt-policykit lx-appearance copyq yt-dlp grim slurp swappy qt5-wayland qt6-wayland nemo gvfs udisks2

set -xl AUR_PKGS pacseek google-chrome nerd-fonts-jetbrains-mono
