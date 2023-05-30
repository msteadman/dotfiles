# .bash_profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export CLICOLOR=1
export EDITOR=vim
export GREP_OPTIONS='--color=auto'
export PIPENV_SHELL_FANCY=1
# PIPENV_VENV_IN_PROJECT=1

# done here because it modifies PATH
if type brew &>/dev/null; then
    # intel
    eval "$(brew shellenv)"
elif type /opt/homebrew/bin/brew &>/dev/null; then
    # apple silicon
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

PATH=$HOME/.local/bin:$PATH

if [ -t 0 ]; then
    if type brew &>/dev/null; then
        if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
        then
            source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
        else
            for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
            do
                [[ -r "{COMPLETION}" ]] && source "${COMPLETION}"
            done
        fi
    fi

    if command -v pyenv 1>/dev/null 2>&1; then
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
    fi

    if command -v pipx 1>/dev/null 2>&1; then
        eval "$(register-python-argcomplete pipx)"
    fi

    if command -v pipenv 1>/dev/null 2>&1; then
        eval "$(_PIPENV_COMPLETE=bash_source pipenv)"
    fi

    if command -v rbenv 1>/dev/null 2>&1; then
        eval "$(rbenv init -)"
        export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
    fi
fi

export PATH

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
