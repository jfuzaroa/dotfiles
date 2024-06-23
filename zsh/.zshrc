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
