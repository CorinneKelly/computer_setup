# computer_setup

Scripts to help setup new laptop

Before you can run these scripts, you need to run the following:

1. `xcode-select --install`
2. Add your new computer to your github account:

Replace `$REPLACE_YOUR_GIT_EMAIL$` with your git hub email in quotes ex: `"email@domain.com"`

    1.  Run `ssh-keygen -t rsa -b 4096 -C $REPLACE_YOUR_GIT_EMAIL$ && eval "$(ssh-agent -s)" && ssh-add -K ~/.ssh/id_rsa && pbcopy < ~/.ssh/id_rsa.pub`
    2.  In your github profile go to: `Settings > SSH and GPG Keys > New SSH Key` and paste your copied ssh key into the key field
    3. Go to desired folders and run `git clone git@github.com:CorinneKelly/computer_setup.git`
    4. CD into computer_setup and run `make setup`
