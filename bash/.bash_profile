# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
