# dotfiles

My dotfiles repo.

Zsh aliases, helpers, custom Prezto (p10k) prompt with fasd enabled.
iEx (Elixir) and Erlang shell init scripts.

## Setup

Follow https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html

1. `alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"`
2. `echo ".dotfiles.git" >> .gitignore`
3. `git clone --bare https://www.github.com/metdinov/dotfiles.git $HOME/.dotfiles.git`
4. `dotfiles checkout`
5. `dotfiles config --local status.showUntrackedFiles no`
