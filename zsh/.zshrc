# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh/

ZSH_THEME="blackmesa"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages)

source $ZSH/oh-my-zsh.sh

LS_FLAGS='-h --group-directories-first --color=auto'

## Aliases ##
alias open="xdg-open &>/dev/null"
alias o=open
opd () {
	open "$@" & disown
}

alias ls="ls $LS_FLAGS"
alias sl=ls
alias l='ls -l'
alias list='ls -1 -R'
alias ll='ls -gA'
alias lr='ll -R'
alias cdd='cd ..'
alias cdb='cd -'
alias rmdir='rm -r'
alias cpdir='cp -r'
alias cpwd='pwd | xclip'
alias diff='diff --color=auto'
alias grep='grep -n --color=auto'
alias sudovim='sudo -E vim'