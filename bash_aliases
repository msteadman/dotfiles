# .bash_aliases

alias rm='rm -i'    # idiot check
alias cp='cp -i'
alias mv='mv -i'

alias ll='ls -lAh'
alias la='ls -A'
alias ld='ls -l | grep "^d"'

alias grep='grep --color'
alias ping='ping -c 5'

alias tree='tree -C -I ".DS_Store|\.git|\.svn|*.pyc|__pycache__|_site|.sass-cache|.venv" -a'
alias ytdl='youtube-dl --format mp4'

alias cdvirtualenv='cd $VIRTUAL_ENV'
alias cdproject='cd $(cat $VIRTUAL_ENV/.project)'

alias mkd2='open -a Marked\ 2.app'
