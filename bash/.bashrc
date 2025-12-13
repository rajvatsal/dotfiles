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


function setbg () {
  argc=${#@}
  if [[ ${argc} -lt 1 ]]; then
    echo "Error: no arguments passed"
    echo "USAGE: setbg path/to/background/file"
    return 1
  fi

  file_name=$(echo $1 | rev | cut -d '/' -f 1 | rev)
  file_path_len=$((${#1}-${#file_name}))

  if [[ "$file_path_len" -eq 0 ]]; then
    abs_path="$(pwd)/${file_name}"
  else
    file_path=${1:0:file_path_len}
    abs_path="$(cd "$file_path" | pwd)/${file_name}"
  fi

  if [ -f "$abs_path" ]; then
    swaymsg 'output' eDP-1 bg $abs_path fill
  else
    echo "Error: no such file dude"
    return 1
  fi
}

. ~/.bash_env
