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

## Activate i-search by pressing C-s
stty -ixon


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

export GITHUB=$HOME/github


################################################################################
### Path
################################################################################

## Add my Emacs binaries to $PATH
PATH="$GITHUB/emacs/bin:$PATH"

## Export updated $PATH
export PATH


################################################################################
### Aliases
################################################################################

# alias ag="ag --path-to-ignore=$GITHUB/dotfiles/.ignore_global"


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

add_git_branch_to_prompt() {
    branch=$(git branch 2>/dev/null | sed -n '/\* /s///p')
    if [ -n "$branch" ]; then
        echo "($branch)"
    fi
}

export PS1="\w \$(add_git_branch_to_prompt)\$ "


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
