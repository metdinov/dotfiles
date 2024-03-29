# dotfiles
# To setup:
# $> git init --bare $HOME/.dotfiles.git
# $> dotfiles config --local status.showUntrackedFiles no
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# system
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cp='cp -iv'
alias ports='lsof -i -n -P | less'
alias htop='htop -t'
alias myip="curl http://ipecho.net/plain; echo"
alias less='less -R'
alias serve='python3 -m http.server'

# get top process eating memory
alias mem5='ps aux | sort -nr -k 4 | head -5'
alias mem10='ps aux | sort -nr -k 4 | head -10'

# get top process eating cpu ##
alias cpu5='ps aux | sort -nr -k 3 | head -5'
alias cpu10='ps aux | sort -nr -k 3 | head -10'

# List largest directories
alias dir5='du -cksh * | sort -hr | head -n 5'
alias dir10='du -cksh * | sort -hr | head -n 10'

# :facepalm:
alias cls='clear'
alias vim='nvim'

# copy uuid4
alias uuid="uuidgen | tr 'A-Z' 'a-z' | tr -d '\n'| pbcopy"

# jq | less
alias jql='jq -C | less -R'

# sloc count
alias loc='scc --no-cocomo'

# rg search hidden files
alias rg='rg --hidden'

# zoxide
# alias v='z > vim' 	 # quick opening files with vim

# git
alias tig='gitui'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gst='git stash'
alias gl='git --no-pager log --pretty=format:'\''%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit -n 15'
alias gc='git commit'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git checkout $(git branch | fzf)'
alias gba='git checkout --track $(git branch -r | fzf)'
alias gcb='git checkout -b'
alias gr='git reset'
alias grf='git checkout HEAD --'
alias grh='git reset --hard'
alias ga='git add'
alias gu='git add -u'
alias gp='git pull --rebase'
alias gup='git push'
alias gdm='git checkout -q main && git fetch -q --prune && git branch -vv | awk "/: gone]/{print $1}" | cut -d" " -f3 | xargs git branch -D'
alias gdg='git branch -vv | grep ": gone]" | xargs git branch -D'

# Git command to find files altered by some commit. Defaults to using last commit.
# USAGE: $ gf <commit_id>
function gf() {
    if [[ -n "$@" ]]; then
        git diff-tree --no-commit-id --name-only -r "$@"
    else
        git diff-tree --no-commit-id --name-only -r HEAD
    fi
}

# docker
alias d='docker'
alias dc='docker compose'
alias dcup='docker compose up'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs'

# kubectl
# deprecated, using https://github.com/zimfw/k now
# alias k='kubectl'
# alias kg='kubectl get'
# alias ka='kubectl apply -f'
# alias kd='kubectl describe'
# alias kl='kubectl logs'
# alias kdel='kubectl delete'
# alias ke='kubectl edit'
# alias kx='kubectl exec'
# alias kpf='kubectl port-forward'
alias bb='kubectl run busybox --image=busybox:1.28 --rm -it --restart=Never --command --'
alias bcurl='kubectl run busybox-curl --image=radial/busyboxplus:curl -it --rm --restart=Never --command -- curl -s'

# aws
alias awsv='aws-vault exec pti_dev_developer --'
alias awsdc='aws-vault exec pti_dev_developer -- docker compose'

# get resources in a given node
function krn() {
    case "$#" in
    1) kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName="$1" ;;
    2) kubectl get "$1" --all-namespaces -o wide --field-selector spec.nodeName="$2" ;;
    *)
        echo "Wrong number of arguments"
        return 1
        ;;
    esac
}
