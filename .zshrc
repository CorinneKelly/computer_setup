# ___________GIT___________
  # vars
  # This variable configures git to not require a message when you merge.
export GIT_MERGE_AUTOEDIT='no'

  # alias
alias gcl="git clone"
alias gst="git status"
alias gl="git pull"
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

# ex: setup-git email@domain.com
function setup_git() {
  git_email=$1
  ssh-keygen -t rsa -b 4096 -C git_email && eval "$(ssh-agent -s)" && ssh-add --apple-use-keychain ~/.ssh/id_rsa && pbcopy < ~/.ssh/id_rsa.pub
}

function gpu() {
	git push --set-upstream origin $(git branch --show-current)
}


# ___________G CLOUD___________
  # The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/corinnekelly/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/corinnekelly/Downloads/google-cloud-sdk/path.bash.inc'; fi

  # The next line enables shell command completion for gcloud.
if [ -f '/Users/corinnekelly/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/corinnekelly/Downloads/google-cloud-sdk/completion.bash.inc'; fi



# _______POWERFLEX HELPERS_________
# ex: `ssh_pf leenw` will log you into leenw VM (assuming you're pub id is listed there)
function ssh_pf() {
  hostname=$1
  ssh -i ~/.ssh/id_rsa "ubuntu@$hostname.powerflex.com"
}


# _______RN HELPERS_________
function reset_cache(){
  watchman watch-del-all && rm -rf node_modules && npm install && rm -rf /tmp/metro-* && npm start --reset-cache
}


# _______Terminal Setup_________
# This function is called in your prompt to output your active git branch.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# This function styles your terminal
function set_prompt_style {
  # Define the prompt character
  local   CHAR="🤓 👉 "

  # Define some local colors
  local   RED="\[\e[0;31m\]"
  local   BLUE="\[\e[0;34m\]"
  local   PURPLE="\[\e[0;35m\]"
  local   GREEN="\[\e[0;32m\]"
  local   bold=$(tput bold)

  # Define a variable to reset the text color
  local   RESET="\[\e[0m\]"

  # Here is where we actually export the PS1 Variable which stores the text for your prompt
  autoload -U colors && colors
  export PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "$'\n'
  # export PS1="\[\e]2;\u@\h\a[$BLUE\T$RESET] \$(parse_git_branch) $PURPLE\W\n$CHAR $RESET"
}

function ssh_with_key() {
  ssh-add --apple-use-keychain ~/.ssh/id_rsa
}

#can also just save and open a new tab
function reset(){
  source ~/.zshrc && source ~/.zshenv
}

# Case-Insensitive Auto Completion
set completion-ignore-case on


set_prompt_style
ssh_with_key


# ______________NVM SETUP_____________
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
