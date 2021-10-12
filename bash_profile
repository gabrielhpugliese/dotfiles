export LANG="en_US.UTF-8"

# coloured bash
source ~/.bash_prompt.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


# TMUX
alias tmux='tmux -2'
export TERM='xterm-256color'

# vim
export EDITOR=vim
export VISUAL=vim
alias vim='/usr/local/bin/nvim'
alias vi='/usr/local/bin/nvim'

# android
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools:/usr/local/opt/openjdk@11/bin:$PATH
alias adb-list='watch -n1 adb devices -l'
alias list-avd='emulator -list-avds'
alias start-avd='~/Library/Android/sdk/tools/emulator -avd Nexus_6P_API_27'
alias android-connect="adb forward tcp:5555 tcp:5555 && adb tcpip 5555 && sleep 5 && adb connect $(adb shell "ip addr show wlan0 | grep -e wlan0$ | cut -d\" \" -f 6 | cut -d/ -f 1"):5555"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# headphones
alias pairhp="blueutil --unpair 9c-97-89-e5-43-b8 && blueutil --pair 9c-97-89-e5-43-b8"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$(yarn global bin):$PATH"
