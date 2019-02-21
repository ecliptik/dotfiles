# Dotfiles

## Using This Environment

These dotfiles are intended to live within ${HOME}/dotfiles, although this can be configured in .profile and configure.sh.

### Initial Configuration

The script configure.sh attempts to install a set of frequently used packages (for Ubuntu/Debian) and creates the proper dotfile links to files in this repository.

### Shell Configuration Files

Both zsh and bash shell dotfiles are designed share as much commonalaties as possible and provide a similar environment on Ubuntu, Debian, OSX, Red Hat, and Solaris systems.

The central dotfile that ties everything together is .profile, which both .zshrc and .bashrc are symlinked to. This file determins the operating system and shell and then sets additional configuration depending on what the system environment is.

- For zsh [zim](https://github.com/zimfw/zimfw) is used for shell customization
- For bash bash-completion is enabled when available
- Shell specific configuration is done in zshrc and bashrc
- Additional shell/OS shared configuration may be done in vars, functions, and local files and can overrides zim and bash-completion

## Dot Files

List of dotfiles and short description

- .Xdefaults
    - configuration for X client applications
- .bashrc
    - symlink to bashrc
- .gpg_config
    - configuration file for GPG and SSH
- .muttrc
    - configuration file for mutt
- .profile
    - central zsh and bash configuration
- .tmux.conf
    - configuration file for tmux
- .vimrc
    - configuration file for vim
- .zshrc
    - configuration file for zshrc
- aliases
    - common shell aliases
- bash_colors
    - ANSI colors for bash shell
- bashrc
    - configuration file for bash shell
- functions
    - common shell functions
- vars
    - common shell variables
- local
    - local configuration files not stored on github

## Dot Dirs

List of dot directories and short description

- .fluxbox
    - configuration files for fluxbox
- .screenlayout
    - configuration files for xrandr
- .zim
    - local copy of zim
- plugins
    - tmux plugins
- scripts
    - various scripts to make things easier
