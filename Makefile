HOMEBREW_URL = "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


initial_setup: setup_terminal install_homebrew install_nvm
setup: install_core_services install_apps install_github_repos


setup_terminal:
	cp ./.zshrc ~/.zshrc
	cp ./.zshenv ~/.zshenv
	source ~/.zshenv && source ~/.zshrc

install_homebrew:
	/bin/bash -c $(HOMEBREW_URL)
	brew update --force --quiet


# CORE Tools/global cli
install_core_services: install_node install_expo install_pyenv install_python

install_nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
	open -a Terminal ~/Documents/computer_setup

install_node:
	. $$NVM_DIR/nvm.sh && nvm install --lts --latest-npm  && nvm use --lts

install_pyenv:
	brew install pyenv
	echo 'eval "$$(pyenv init --path)"' >> ~/.zprofile
	echo 'eval "$$(pyenv init -)"' >> ~/.zshrc

# 3.7.12 is currently pf_api version
install_python:
	pyenv install 3:latest


install_expo:
	. $$NVM_DIR/nvm.sh && nvm exec npm install --global expo-cli


# APPLICATIONS
install_apps: install_clickup install_slack install_zeplin install_brave install_vs_code install_docker install_teams install_flux install_outlook

install_clickup:
	brew install --cask clickup

install_slack:
	brew install --cask slack

install_brave:
	brew install --cask brave-browser

install_flux:
	brew install --cask flux

install_vs_code:
	brew install --cask visual-studio-code
	# cp ./vs_code_settings.json ~/Library/Application\ Support/Code/User/settings.json

install_docker:
	brew install --cask docker	

install_teams:
	brew install --cask microsoft-teams

install_outlook:
	brew install --cask microsoft-outlook

install_zeplin:
	brew install --cask zeplin



# REPOS
github_repos: create_pf_folder install_pf_mobile install_pf_api install_pf_pay

create_pf_folder:
	cd ../ && mkdir PowerFlex && cd PowerFlex

install_pf_mobile:
	git clone git@github.com:edf-re/powerflex_client_app.git

install_pf_api:
	git clone git@github.com:edf-re/powerflex_api.git

install_pf_pay:
	git clone git@github.com:edf-re/powerflex_payments_api.git

