#
# User configuration sourced by interactive shells
#

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

#Set our git repository location
dotfiles="${HOME}/dotfiles"

#Set a umask
umask 002

#Determine OS information variables to use elsewhere
os_name=`uname -s`
arch=`uname -m`

#Turn off stop/resume on interactive shells to avoid odd behavior with tmux
[[ $- == *i* ]] && stty -ixon

#Setup our shell source files
##This is the sources file to load before anything else to setup and dependencies other source files may need
pre_sources="${dotfiles}/vars"

##Sources shared by both zsh and bash
common_sources="${dotfiles}/functions \
                ${dotfiles}/aliases \
                ${dotfiles}/.gpg_config \
                ${HOME}/local \
                ${HOME}/.demandbase"


##zsh specific sources
if [ "${ZSH_VERSION}" ]; then
    #Set zsh similar to bash to use ${sources} in a for loop below
    set -o shwordsplit
    HOSTNAME=`hostname`
    shell_sources="${dotfiles}/zshrc"

    #Enable backwards search
    bindkey '^R' history-incremental-pattern-search-backward

    #Vim command line editor
    autoload -z edit-command-line
    zle -N edit-command-line
    bindkey -M vicmd v edit-command-line

    #Remove vim mode lags
    export KEYTIMEOUT=1
fi

#Use jenv to select java versions
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#Set awscli path
export PATH="/usr/local/opt/awscli@1/bin:$PATH"

#Build a list of sources with common_sources as overrides
sources="${pre_sources} ${shell_sources} ${common_sources}"

#Build a file list and load any that exist
for sourcefile in ${sources}; do
    if [ -f ${sourcefile} ]; then
        source "${sourcefile}"
    fi
done

autoload -U promptinit; promptinit
prompt spaceship

#Setup pyenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
