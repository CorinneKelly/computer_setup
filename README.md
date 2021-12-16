# computer_setup

Scripts to help setup new laptop

## Pre Setup

1. Run `xcode-select --install`
2. Add your new computer to your github account:
   
    ### Github Setup

        *Replace `$REPLACE_YOUR_GIT_EMAIL$` with your git hub email in quotes ex: `"email@domain.com"`*

    1.  Run `ssh-keygen -t rsa -b 4096 -C $REPLACE_YOUR_GIT_EMAIL$ && eval "$(ssh-agent -s)" && ssh-add -K ~/.ssh/id_rsa && pbcopy < ~/.ssh/id_rsa.pub`


    2.  In your github profile go to: `Settings > SSH and GPG Keys > New SSH Key` and paste your copied ssh key into the key field
    
    3. Run `git config --global user.name "Your Name"`
  
    4. Run `git config --global user.email you@example.com`

    


## Setup
1. Run `cd ~/Documents  && git clone git@github.com:CorinneKelly/computer_setup.git && cd computer_setup`
2. Run `make initial_setup`
3. Once new that finishes and anew terminal window pops up, run `make setup` in the new terminal window

