################################################################################
### Do nothing when Bash runs non-interactively
################################################################################

[ -z "$PS1" ] && return


################################################################################
### Options
################################################################################

## Emacs style key bindings
set -o emacs

## Don't exit on Ctrl-D
set -o ignoreeof


################################################################################
### Environment
################################################################################

export SHELL=/bin/bash
export EDITOR=emacs
export PAGER=less

## Set up locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8


################################################################################
### Github directory
################################################################################

GITHUB=$HOME/github


################################################################################
### Path
################################################################################

## Default macOS $PATH
PATH="/usr/bin:/bin:/usr/sbin:/sbin"

## Binaries installed with `brew`
PATH="/usr/local/bin:$PATH"

## My Emacs binaries
PATH="$GITHUB/emacs/bin:$PATH"

## Export updated $PATH
export PATH


################################################################################
### Keys
################################################################################

## Hint: `bind -P` will show all key bindings

## Search history a la tcsh
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'


################################################################################
### Prompt
################################################################################

export PS1='\w $ '


################################################################################
### History
################################################################################

## Append to the history file, don't overwrite it
shopt -s histappend

## Save multi-line commands to the history as one command
shopt -s cmdhist

## Save and reload history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r;"

## Huge history
export HISTSIZE=500000
export HISTFILESIZE=100000

## No duplicates, please
export HISTCONTROL="erasedups:ignoreboth"
