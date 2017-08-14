#!/bin/zsh

ABS_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

powerline_precmd() {
  PS1="$(${ABS_DIR}/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
  install_powerline_precmd
fi
