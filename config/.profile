# colorize prompt
export PS1='\[\033[01;32m\]\u\[\033[01;33m\]@\[\033[01;36m\]\h\[\033[01;33m\]:\w \[\033[01;35m\]\$ \[\033[00m\]'

# increase history size
HISTSIZE=10000
HISTFILESIZE=10000

# set aliases
alias ll='ls -lh'
alias la='ls -lah'
alias lr='ls -ltrah'

export TERM=xterm-256color # fix terminal issues if using something like Ghostty

# log tmux sessions
/usr/local/bin/tmux-global-logging.sh

. "$HOME/.cargo/env"