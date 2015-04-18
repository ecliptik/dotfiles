#Set our umask
umask 002

#haDetermine OS information
os_name=`uname -s`
arch=`uname -m`

#Turn off stop/resume on interactive shells
[[ $- == *i* ]] && stty -ixon

#Load sources
pre_sources="${HOME}/env/vars"
common_sources="${HOME}/env/functions \
                ${HOME}/env/aliases \
                ${HOME}/env/.gpg_config \
                ${HOME}/env/local"

if [ "$BASH" ]; then
    shell_sources="${HOME}/env/bash_colors \
                  /etc/bash_completion \
                  /usr/local/etc/bash_completion \
                  /etc/bash_completion.d/git \
                  ${HOME}/bin/google-cloud-sdk/path.bash.inc \
                  ${HOME}/bin/google-cloud-sdk/completion.bash.inc \
                  ${HOME}/env/bashrc"
fi

if [ "${ZSH_VERSION}" ]; then
    #Set zsh similar to bash to use ${sources} in a for loop below
    set -o shwordsplit
    HOSTNAME=`hostname`
    shell_sources="${HOME}/env/zshrc"
fi

sources="${pre_sources} ${shell_sources} ${common_sources}"

#Build sources list
for sourcefile in ${sources}; do
    if [ -f ${sourcefile} ]; then
        source "${sourcefile}"
    fi
done
