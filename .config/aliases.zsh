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

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias v='f -e vim' 	 # quick opening files with vim

# git
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged' 
alias gst='git stash'
alias gl='git --no-pager log --pretty=format:'\''%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'' --abbrev-commit -n 15'
alias gc='git commit'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch -v'
alias gcb='git checkout -b'
alias gr='git reset'
alias grf='git checkout HEAD --'
alias grh='git reset --hard'
alias ga='git add'
alias gu='git add -u'
alias gp='git pull --rebase'
alias gup='git push'
alias gdm='git checkout -q master && git fetch -q --prune && git branch -vv | awk "/: gone]/{print $1}" | cut -d" " -f3 | xargs git branch -D'
alias gdg='git branch -vv | grep ": gone]" | xargs git branch -D' 

# Git command to find files altered by some commit. Defaults to using last commit.
# USAGE: $ gf <commit_id>
function gf() {
        if [[ -n "$@" ]]; then
                git diff-tree --no-commit-id --name-only -r "$@";
        else
                git diff-tree --no-commit-id --name-only -r HEAD;
        fi;
}

# kubectl
alias k='kubectl'
alias kg='kubectl get'
alias ka='kubectl apply -f'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias kdel='kubectl delete'
alias ke='kubectl edit'
alias kx='kubectl exec'
alias kpf='kubectl port-forward'
alias bb='kubectl run busybox --image=busybox:1.28 --rm -it --restart=Never --command --'
alias bcurl='kubectl run busybox-curl --image=radial/busyboxplus:curl -it --rm --restart=Never --command -- curl -s'

# get resources in a given node
function krn() {
	case "$#" in
	1) kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName="$1" ;;
	2) kubectl get "$1" --all-namespaces -o wide --field-selector spec.nodeName="$2" ;;
	*) echo "Wrong number of arguments"
	   return 1
	   ;;
	esac
}
