# computer_setup

Scripts to help setup new laptop

## Pre Setup

1. Run `xcode-select --install`
2. Add your new computer to your github account:

  Replace `$REPLACE_YOUR_GIT_EMAIL$` with your git hub email in quotes ex: `"email@domain.com"`

  i.  Run `ssh-keygen -t rsa -b 4096 -C $REPLACE_YOUR_GIT_EMAIL$ && eval "$(ssh-agent -s)" && ssh-add -K ~/.ssh/id_rsa && pbcopy < ~/.ssh/id_rsa.pub`
  ii.  In your github profile go to: `Settings > SSH and GPG Keys > New SSH Key` and paste your copied ssh key into the key field


## Setup
3. Run `cd ~/Documents  && git clone git@github.com:CorinneKelly/computer_setup.git && cd computer_setup`
4. Run `make initial_setup`
5. Once new that finishes and anew terminal window pops up, run `make setup` in the new terminal window

