# dotfiles

My dotfiles repo.

Zsh aliases, helpers, custom [Zim](https://zimfw.sh/docs/install) (p10k) prompt with fasd enabled.
iEx (Elixir) and Erlang shell init scripts.

## Setup

Follow https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html

1. `alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"`
2. `echo ".dotfiles.git" >> .gitignore`
3. `git clone --bare https://www.github.com/metdinov/dotfiles.git $HOME/.dotfiles.git`
4. `dotfiles checkout`
5. `dotfiles config --local status.showUntrackedFiles no`

## Tools

After setup, you ~should~ could install the following tools:

- [brew](https://brew.sh) - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- [direnv](https://direnv.net) - `brew install direnv`
- [asdf](https://github.com/asdf-vm/asdf) - `brew install asdf`
- [pyenv](https://github.com/pyenv/pyenv) - `brew install pyenv`
- [fzf](https://github.com/junegunn/fzf) - `brew install fzf` (completions with `$(brew --prefix)/opt/fzf/install`)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - `brew install ripgrep`
- [7z](https://github.com/jinfeihan57/p7zip) - `brew install p7zip`
- [tree](http://mama.indstate.edu/users/ice/tree/) - `brew install tree`
- [bat](https://github.com/sharkdp/bat) - `brew install bat`
- [exa](https://the.exa.website) - `brew install exa`
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - `brew install diff-so-fancy`
- [shellcheck](https://github.com/koalaman/shellcheck) - `brew install shellcheck`
