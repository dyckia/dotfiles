# Setting Anaconda(Python 2.7) as default by changing PATH
export PATH="~/anaconda/bin:$PATH"

# Enable tab completion in git
source ~/Projects/dotfiles/git_completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/Projects/dotfiles/git_prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"

# Make ls colorful
export CLICOLOR=1 
export LSCOLORS=exfxhxhxcxhxhxhxhxhxhx  

# true color
alias ssh='TERM=xterm-256color ssh'

# set default editor to vim
export EDITOR='vim'

# custom cd
function cd {
    builtin cd "$@" && ls -F
    }

# some aliases
alias ll='ls -l'
alias la='ls -a'
alias cl='clear'
alias sb='source ~/.bash_profile'
alias ..='cd ..'
alias project='cd ~/Projects'
alias tl='tmux ls' 
alias editbash='vim ~/.bash_profile'
alias editvim='vim ~/.vimrc'
alias edittmux='vim ~/.tmux.conf'
