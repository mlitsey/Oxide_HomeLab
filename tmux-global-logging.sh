#!/usr/bin/env bash

# place in /usr/local/bin/tmux-global-logging.sh
# set permissions: sudo chmod 755 /usr/local/bin/tmux-global-logging.sh
# add to .bashrc or profile 
# /usr/local/bin/tmux-global-logging.sh

# sudo apt install tmux | sudo dnf install tmux
#set -x # enables debugging
#set -e # bash will exit on error
#printf " \n\n Don't forget to check /var/log/syslog or /var/log/cron for cronjob script run times \n\n"


if [ -n "$TMUX_PANE" ] && [ "$TMUX_PANE_LOGGING" != "1" ]; then
          export TMUX_PANE_LOGGING=1
  else
            exit 0
fi

LOGS=$HOME/Logs
LOG_PATH="$LOGS/tmux_$(date +%F_%H.%M.%S).pane${TMUX_PANE//[^0-9]/}.log"

if [[ ! -d "$LOGS" ]]; then
    if mkdir -p "$LOGS"; then
        echo "Created directory: $LOGS"
    else
        echo "ERROR: Failed to create $LOGS" >&2
        exit 1
    fi
else
    echo "Directory already exists: $LOGS"
fi

# use ansifilter to make logs more readable
# sudo apt install ansifilter | sudo dnf install ansifilter
#tmux pipe-pane -t "${TMUX_PANE}" "exec cat - | ansifilter >> $LOG_PATH"

# without ansifilter
tmux pipe-pane -t "${TMUX_PANE}" "exec cat - >> $LOG_PATH"

