HOMEBREW_URL = "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


initial_setup: setup_terminal install_homebrew install_nvm
setup: install_core_services install_apps install_github_repos


setup_terminal:
	cp ./.zshrc ~/.zshrc
	cp ./.zshenv ~/.zshenv

install_homebrew:
	/bin/bash -c $(HOMEBREW_URL)
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/corinnekelly/.zprofile && eval "$(/opt/homebrew/bin/brew shellenv)"
	brew update --force --quiet


# CORE Tools/global cli
install_core_services: install_asdf install_node install_expo  install_python

install_asdf:
	brew install coreutils curl git gpg gawk
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

install_node:
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf install nodejs latest
	asdf global nodejs latest

install_python:
	brew install openssl readline
	asdf plugin-add python
	asdf global python system

install_pipenv:
	brew install pipenv

install_expo:
	npm install --global expo-cli


# APPLICATIONS
install_apps: install_clickup install_slack install_zeplin install_brave install_vs_code install_docker install_teams install_flux install_outlook install_android_studio install_postman

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

install_lastpass:
	brew install --cask lastpass

install_android_studio:
	brew install --cask android-studio && brew install --cask android-sdk &&  brew install android-ndk 

install_postman:
	brew install --cask postman
