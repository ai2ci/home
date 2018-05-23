# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

#
# shopt -s cdable_vars
# export projects='/home/artur/projects'
cd /home/artur/projects

findRecursive() {
    grep -rnw "$1"  -e "$2" --include="$3" --exclude="$4"
}
findRecursiveInJs() {
    grep -rnw "$1"  -e "$2" --include='*.js' --exclude='*.spec.js'
}

alias search=findRecursive
alias searchinjs=findRecursiveInJs


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}                                                                                                                                                                                                                                                                               

PROMPT_DIR="[\[\033[32m\]\w\[\033[00m\]]"
PROMPT_GIT_BRANCH="(\[\033[33m\]\$(parse_git_branch)\[\033[00m\])"
PROMPT_USER="\[\033[1;36m\]\u\[\033[0m\]"
PROMPT_SIGN="\[\033[1;33m\]-> \[\033[0m\]"

PS1="$PROMPT_DIR $PROMPT_GIT_BRANCH \n$PROMPT_USER$PROMPT_SIGN"     
