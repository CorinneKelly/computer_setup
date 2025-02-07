# ___________GIT___________
# vars
# This variable configures git to not require a message when you merge.

export GIT_MERGE_AUTOEDIT='no'

  # alias
alias gcl="git clone"
alias gs="git status"
alias gpf="git pull --ff-only"
alias gp="git push"
alias gd="git diff | subl"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"
alias gcam="git commit -am"
alias gbb="git branch -b"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gaa="git add ."
alias latest="git branch --sort=-committerdate | head -n 10"
alias python="python3"
alias pip="pip3"

# ex: setup-git email@domain.com
function setup_git() {
  git_email=$1
  ssh-keygen -t rsa -b 4096 -C git_email && eval "$(ssh-agent -s)" && ssh-add --apple-use-keychain ~/.ssh/id_rsa && pbcopy < ~/.ssh/id_rsa.pub
}

function gpu() {
	git push --set-upstream origin $(git branch --show-current)
}

function gitfind() {
  git branch --list "*$1*" --sort=-committerdate
}


# ___________G CLOUD___________
  # The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/corinnekelly/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/corinnekelly/Downloads/google-cloud-sdk/path.bash.inc'; fi

  # The next line enables shell command completion for gcloud.
if [ -f '/Users/corinnekelly/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/corinnekelly/Downloads/google-cloud-sdk/completion.bash.inc'; fi


# _______RN HELPERS_________
function reset_cache(){
  watchman watch-del-all && rm -rf node_modules && npm install && rm -rf /tmp/metro-* && npm start --reset-cache
}


# _______Terminal Setup_________

# This function is called in your prompt to output your active git branch.
function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# This function styles your terminal
# Define the prompt character
local   CHAR="🤓 👉 "

# Here is where we actually export the PS1 Variable which stores the text for your prompt
autoload -U colors && colors
setopt prompt_subst
export PS1='%F{blue}[20%D %*%B% ] %F{cyan}%}%~% %F{magenta}$(parse_git_branch)'$'\n'$CHAR$reset_color

# Case-Insensitive Auto Completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

#can also just save and open a new tab
function reset(){
  source ~/.zshrc && source ~/.zshenv && source ~/.zprofile
}


# ______________NVM SETUP_____________
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ______________INIT PROFILE_____________
autoload -Uz compinit && compinit
