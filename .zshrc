# /etc/profile

#Set our umask
umask 022

# Set our default path
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/home/h0wser/.local/bin:/home/h0wser/go/bin:/home/h0wser/scripts/:/home/h0wser/.gem/ruby/2.2.0/bin/"
export PATH

export GOPATH="/home/h0wser/go"

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Source global bash config
if test "$PS1" && test "$BASH" && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

# PROMPT N SHIT
autoload -U colors && colors
autoload -U promptinit
promptinit

setopt prompt_subst

# Set prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*'	formats "%{$fg[yellow]%}(%b) %{$reset_color%}"

precmd() {
	vcs_info
	RPROMPT="${vcs_info_msg_0_}[%?]" 
}

bindkey -v

PROMPT="%{$fg[red]%}[%n@%M] %{$reset_color%}- %{$fg[red]%}[%6~]%{$reset_color%} - %{$fg[red]%}[%*]%{$reset_color%}"$'\n'"> "

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias ls='ls -F --format=single-column --color=always --group-directories-first'
eval `dircolors -b ~/.dir_colors`

alias please='sudo $(history -p !!)'
alias sudo='sudo '

alias r='nvim ~/.zshrc && source ~/.zshrc'

alias py2='python2'
alias py3='python'

alias :q='exit'
alias c='clear'

alias pac='yaourt'

alias runescape='java -jar ~/Orion/OSBuddy.jar > /dev/null 2>&1 &'

alias tmux="tmux -2" # forces 256 colors in tmux :) 
alias tmux-dev="~/dotfiles/tmux-dev.sh"

# media control via command line
alias play="playerctl play-pause"
alias next="playerctl next"
alias prev="playerctl previous"

alias title="printf '\033];%s\07\n'"

alias start="sudo systemctl start "
alias restart="sudo systemctl restart "
alias status="sudo systemctl status "

alias swe="setxkbmap se && xset r rate 200 60"
alias donken="top"

alias restart-mopidy="killall mopidy; nohup mopidy --config ~/.config/mopidy/ > /dev/null &"

alias vim="nvim"

p() { cd "/home/h0wser/projects/$1"; }

alias sdcard="sudo mount /dev/mmcblk0p1 ~/media/sdcard"

export EDITOR=nvim
export BROWSER=chromium

#ssh() {
#	[ -t 2 ] && xtermcontrol --fg "#ffaaff"
#	command ssh "$@"
#	[ -t 2 ] && xtermcontrol --fg "#dddddd"
#}

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/h0wser/.zshrc'

autoload -Uz compinit
compinit

[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

# bspwm
export PANEL_FIFO="/tmp/panel-fifo"
# End of lines added by compinstall
