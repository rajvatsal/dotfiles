# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


# ▗▄▄▄▖▗▖ ▗▖▗▖  ▗▖ ▗▄▄▖▗▄▄▄▖▗▄▄▄▖ ▗▄▖ ▗▖  ▗▖ ▗▄▄▖
# ▐▌   ▐▌ ▐▌▐▛▚▖▐▌▐▌     █    █  ▐▌ ▐▌▐▛▚▖▐▌▐▌   
# ▐▛▀▀▘▐▌ ▐▌▐▌ ▝▜▌▐▌     █    █  ▐▌ ▐▌▐▌ ▝▜▌ ▝▀▚▖
# ▐▌   ▝▚▄▞▘▐▌  ▐▌▝▚▄▄▖  █  ▗▄█▄▖▝▚▄▞▘▐▌  ▐▌▗▄▄▞▘
#                                                
#                                                

# Get absolute path
function gap () {
  echo "$(pwd)/${1}"
  return 0
}

# Relative swaybg
function rswaybg () {
  argc=${#@}
  if [[ ${argc} -lt 1 ]]; then
    echo "Error: no arguments passed"
    echo "USAGE: setbg path/to/background/file"
    return 1
  fi

  abs_path="$(gap $1)"

  if [ -f "$abs_path" ]; then
    swaymsg 'output' eDP-1 bg $abs_path fill
  else
    echo "Error: no such file dude"
    echo "Path: ${abs_path}"
    return 1
  fi
}


# ▗▄▄▄▖▗▖  ▗▖▗▖  ▗▖
# ▐▌   ▐▛▚▖▐▌▐▌  ▐▌
# ▐▛▀▀▘▐▌ ▝▜▌▐▌  ▐▌
# ▐▙▄▄▖▐▌  ▐▌ ▝▚▞▘ 
#                  
#                  

. ~/.bash_env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
