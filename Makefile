
setup:
	make initial_setup
	reset
	make install_core_services
	make install_apps
	make install_github_repos

initial_setup: setup_terminal install_homebrew

setup_terminal:
	cp ./.zshrc ~/.zshrc
	cp ./.zshenv ~/.zshenv

install_homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update


# CORE Tools/global cli
install_core_services: install_nvm install_node install_expo install_pyenv install_python

install_nvm:
	brew install nvm

install_node:
	nvm install node

# needs to be installed before you can use any dev tools like git
# install_xcode_tools:
# 	xcode-select --install

install_pyenv:
	brew install pyenv
	echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
	echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# 3.7.12 is currently pf_api version
install_python:
	pyenv 3:latest
	pyenv 3.7.12:latest

install_expo:
	npm install --global expo-cli



# APPLICATIONS
install_apps: install_clickup install_slack install_zeplin install_brave install_vs_code install_docker install_teams

install_clickup:
	brew install --cask clickup

install_slack:
	brew install --cask slack

install_brave:
	brew install --cask brave-browser

install_vs_code:
	brew install --cask visual-studio-code
	cp ./vs_code_settings.json ~/Library/Application\ Support/Code/User/settings.json

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
	cd ~/Documents && mkdr PowerFlex && cd PowerFlex

install_pf_mobile:
	git clone git@github.com:edf-re/powerflex_client_app.git

install_pf_api:
	git clone git@github.com:edf-re/powerflex_api.git

install_pf_pay:
	git clone git@github.com:edf-re/powerflex_payments_api.git
