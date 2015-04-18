# Unified Enivronment Configuration

## Using This Environment

This repository is intended to live within ${HOME}/env and almost all files depend on this path.

### Initial Configuration

The script configure.sh attempts to install a set of frequently used packages (for Ubuntu/Debian) and creates the proper links to this configuration repository in ${HOME}. It should be used on initial use of this repository and is unused afterwards.

### Shell Configuration Files

Both zsh and bash shell configurations are designed share as much commonalaties as possible and provide a similar environment on Ubuntu, Debian, OSX, Red Hat, and Solaris systems.

The central file that ties everything together is .profile, with both .zshrc and .bashrc are symlinked to. This file determins the operating system and shell and then sets additional configurations depending on what the system environment is.

- For zsh [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is used for shell customization
- For bash bash-completion is enabled when available
- Shell specific configuration is done in zshrc and bashrc
- Additional shell/OS shared configuration may be done in vars, functions, and local files and can overrides oh-my-zsh and bash-completion

## Files

List of files in repository and short description

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
    -symlink to zshrc
- aliases
    - common shell aliases
- bash_colors
    - ANSI colors for bash shell
- bashrc
    - configuration file for bash shell
- configure.sh
    - initial system configuration
- functions
    - common shell functions
- vars
    - common shell variables
- zshrc
    - configuration file for zsh shell
- local
    - local configuration files not stored on github

## Directories

List of directories in repository and short description

- .fluxbox
    - configuration files for fluxbox
- .screenlayout
    - configuration files for xrandr
- oh-my-zsh
    - local copy of oh-my-zsh configurations
- plugins
    - tmux plugins


