export NVM_DIR=~/.nvm

# android exports
# export ANDROID_HOME=/usr/local/opt/android-sdk
# export ANDROID_NDK_HOME=/usr/local/opt/android-ndk

export ANDROID_HOME=$(brew --prefix)/share/android-sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/19.1.0:$PATH