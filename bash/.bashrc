# .bashrc

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

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

if [ -f ~/.bash_fns ]; then
. ~/.bash_fns
fi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

##-----------------------------------------------------
## synth-shell-greeter.sh
# if [ -f /home/mel/.config/synth-shell/synth-shell-greeter.sh ] && [ -n "$( echo $- | grep i )" ]; then
# 	source /home/mel/.config/synth-shell/synth-shell-greeter.sh
# fi

##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/mel/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/mel/.config/synth-shell/synth-shell-prompt.sh
fi

##-----------------------------------------------------
## better-ls
# if [ -f /home/mel/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
# 	source /home/mel/.config/synth-shell/better-ls.sh
# fi

##-----------------------------------------------------
## alias
if [ -f /home/mel/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/mel/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f /home/mel/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/mel/.config/synth-shell/better-history.sh
fi
