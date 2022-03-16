# .bash_profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

CLICOLOR=1
EDITOR=vim
GREP_OPTIONS='--color=auto'
PIPENV_SHELL_FANCY=1
# PIPENV_VENV_IN_PROJECT=1

PATH=$HOME/.local/bin:$PATH

if [ -t 0 ]; then
    if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"
    fi

    if command -v pipx 1>/dev/null 2>&1; then
        eval "$(register-python-argcomplete pipx)"
    fi

    if command -v rbenv 1>/dev/null 2>&1; then
        eval "$(rbenv init -)"
        export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
    fi
fi

export PATH EDITOR CLICOLOR PIPENV_SHELL_FANCY

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
