# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

for file in ~/.{bash_aliases,bash_prompt}; do
    [ -r "$file" ] && source "$file"
done
unset file

if [ -t 0 ]; then
    bind '"\e[A":history-search-backward'
    bind '"\e[B":history-search-forward'
fi

function xman() { open x-man-page://$@ ; }
