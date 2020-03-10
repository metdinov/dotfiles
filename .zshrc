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

export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/anaconda3/bin:/usr/local/sbin:$PATH"

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

. /Users/jamoroso/.kerl/installs/22.1/activate
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fzf settings
export FZF_DEFAULT_OPTS='--reverse --height=40%' 
# export FZF_DEFAULT_OPTS='--reverse --height=40% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files'

# OpenSSL link flags
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# Catalina SDK path
export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

# opam configuration
test -r /Users/jamoroso/.opam/opam-init/init.zsh && . /Users/jamoroso/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# direnv hook
eval "$(direnv hook zsh)"
