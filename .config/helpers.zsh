# Reload .zshrc pressing ctrl-a
bindkey -s '^a' 'source ~/.zshrc\n'

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Open directory in VS Code using fzf
c() {
  local dir=${1:-$PWD}
  if [ -d "${dir}" ]; then
    ls -1A ${dir} | fzf | xargs -I ox code "${dir}/"ox
  else
    echo "${dir} not found"
    return 1
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fo - open selected file
fo() {
  local out file key
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    open "$file" 
  fi
}

# Make a directory, then go there
md() {
    test -n "$1" || return
    mkdir -p "$1" && cd "$1"
}

# Print $PATH one element per line
path() {
    echo $PATH | tr ':' '\n'
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg [^.]*; 
	fi;
}

# Run `dig` and display the most useful info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Find What is Using a Particular Port
# USAGE: $ whoisport 80
function port() {
	lsof -i:$1
}

# Git command to find files altered by some commit. Defaults to using last commit.
# USAGE: $ gf <commit_id>
function gf() {
	if [[ -n "$@" ]]; then
		git diff-tree --no-commit-id --name-only -r "$@";
	else
		git diff-tree --no-commit-id --name-only -r HEAD;
	fi;
}
