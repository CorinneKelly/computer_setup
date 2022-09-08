initial_setup: setup_terminal install_homebrew
setup: install_core_services install_apps


setup_terminal:
	cp ./.zshrc ~/.zshrc
	cp ./.zshenv ~/.zshenv

install_homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	
setup_homebrew:
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/corinnekelly/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"


install_asdf:
	brew install asdf 
	echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
	brew install gpg gawk

# CORE Tools/global cli
install_core_services: install_node  install_python

install_node:
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf global nodejs latest

#	Apparently these are repetitive
# 	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
#	asdf install nodejs latest

install_python:
	brew install openssl readline
	asdf plugin-add python
	asdf global python system

install_pipenv:
	brew install pipenv

install_mobile_tools: install_expo install_android_studio

install_expo:
	npm install --global expo-cli

install_android_studio:
	brew install --cask android-studio && brew install --cask android-sdk &&  brew install android-ndk 

# APPLICATIONS
install_apps: install_clickup install_slack install_brave install_flux install_vs_code install_docker install_teams install_outlook install_zeplin install_lastpass install_postman install_notion install_zoom install_discord install_figma

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

install_postman:
	brew install --cask postman

install_notion:
	brew install --cask notion

install_zoom:
	brew install --cask zoom

install_linear:
	brew install --cask linear-linear

install_discord:
	brew install --cask discord

install_figma:
	brew install --cask figma