
set -x --path PATH "$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.local/share/fnm"

if status is-interactive
    set -x EDITOR vim
    set -x VISUAL vim
    set -x IDE nvim
    set -x TERM st

    # Commands to run in interactive sessions can go here
    # --- Aliases ---
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    alias ls='ls --group-directories-first -F --color=always'
    alias ll='ls -l'
    alias la='ls -A'
    alias l='ls -C'

    alias cp='cp -v'

    alias shcfg="$IDE ~/.config/fish/config.fish"
    alias wmcfg="$IDE ~/dots/conf/.config/sway/config"
    alias termcfg="$IDE ~/dots/conf/.config/foot/foot.ini"
    alias nvcfg="cd ~/dots/conf/.config/nvim/; $IDE"

    set PACMAN "paru"

    alias xi="$PACMAN -Syu"
    alias xr="$PACMAN -Rs"
    alias xs="$PACMAN -Ss"
    alias xf="$PACMAN -F"
    alias xc="$PACMAN -Scc"

    alias dmnt="udisksctl mount -b"
    alias dumnt="udisksctl unmount -b"

    alias brs="brightnessctl set"

    alias sts="stencil start"
    alias stp="stencil push -da"

    alias exa="exa -F --group-directories-first --icons"
    alias tr="trash"
    alias ts="trash-restore"

    alias x="startx"

    alias lg="lazygit"

    # fnm
    fnm env --use-on-cd | source

    #Backup stuff

    set -g backup_targets "~/Music ~/password.kdbx ~/Books ~/dots --exclude dist --exclude build --exclude node_modules --exclude target ~/adev"
    alias bk-update="tar -vcf ~/.backup.tar $backup_targets"

    function sub_add
        set url $1
        set real_url "$(ytfzf --channel-link=$url)"

        echo $real_url >> ~/dots/conf/.config/ytfzf/subscriptions
    end
end

# Start X at login
# if status is-login
#     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#         exec startx -- -keeptty
#     end
# end
