# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

for FILE in ~/bashrc/*; do
	source $FILE
done

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

unset rc
. "$HOME/.cargo/env"

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Android dev
export ANDROID_HOME=$HOME/android
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH

export PATH="$PATH:$HOME/.foundry/bin"
eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"

# opencode
export PATH=$HOME/.opencode/bin:$PATH

# Overwrite terminal prompt
PROMPT_COMMAND[0]='printf "\e]0;%s\a" "${CUSTOM_TERM_TITLE:-${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}}"'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
