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
