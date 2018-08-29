# prompt
export PS1="\u@\h:\w\$ "

# aliases
alias ls='ls -G'
alias vi='vim'

# site option
if [[ -s "$HOME/.bashrc.site" ]]  ; then source "$HOME/.bashrc.site" ; fi
