# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/jamoroso/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Zsh Autosuggestions color
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=110'

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Add Anaconda to $PATH
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/anaconda3/bin:/usr/local/sbin:$PATH"

# Add Cargo to $PATH
export PATH="$PATH:$HOME/.cargo/bin"

# Add Ponyup to $PATH
export PATH="$PATH:$HOME/.local/share/ponyup/bin"

# Go env setup
# export GOPATH="${HOME}/.go"
# export GOROOT="/usr/local/opt/go/libexec"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Aliases
[[ -f ~/.config/aliases.zsh ]] && source ~/.config/aliases.zsh

# Helpers
[[ -f ~/.config/helpers.zsh ]] && source ~/.config/helpers.zsh

# Set default editor
export EDITOR=$(which vim)

# Disable correction
unsetopt CORRECT

# Erlang & Elixir
# Output Unicode strings and enable shell history
export ERL_AFLAGS="+pc unicode -kernel shell_history enabled"

# fzf settings
export FZF_DEFAULT_OPTS='--reverse --height=40%' 
# export FZF_DEFAULT_OPTS='--reverse --height=40% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files'

# OpenSSL link flags
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# opam configuration
test -r /Users/jamoroso/.opam/opam-init/init.zsh && . /Users/jamoroso/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# direnv hook
eval "$(direnv hook zsh)"

# OpenJDK
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Android SDK
export ANT_HOME="/usr/local/opt/ant"
export MAVEN_HOME="/usr/local/opt/maven"
export GRADLE_HOME="/usr/local/opt/gradle"
export ANDROID_HOME="/Users/jamoroso/Library/Android/sdk/"

# asdf completions
. /opt/homebrew/opt/asdf/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gcloud completions
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jamoroso/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jamoroso/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/jamoroso/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jamoroso/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "/Users/jamoroso/.ghcup/env" ] && source "/Users/jamoroso/.ghcup/env" # ghcup-env

eval "$(pyenv init -)"
