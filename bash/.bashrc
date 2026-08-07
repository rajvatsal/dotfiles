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

# Get absolute path
function gap () {
  echo "$(pwd)/${1}"
  return 0
}

# Relative swaybg
# TODO: Allow ability to add arguments for displays you want to set background for
function rswaybg () {
  argc=${#@}
  if [[ ${argc} -lt 1 ]]; then
    echo "Error: no arguments passed"
    echo "USAGE:S setbg path/to/background/file"
    return 1
  fi

  first_char="${1:0:1}"
  if [[ "$first_char" == "/" ]]; then
    abs_path=$1
  else
    abs_path="$(gap $1)"
  fi

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

. ~/.bash_env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# opencode
export PATH=/home/vatsal/.opencode/bin:$PATH

alias dvm_login=~/repos/work/dataring/scripts/ssh-server

# >>> Claude Code Router CLI >>>
# Added by Claude Code Router. Enables the ccr-app command in new shells.
case ":$PATH:" in
  *":$HOME/.claude-code-router/bin:"*) ;;
  *) export PATH="$HOME/.claude-code-router/bin:$PATH" ;;
esac
# <<< Claude Code Router CLI <<<

# javm
eval "$(javm init bash)"
