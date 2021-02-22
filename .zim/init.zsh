zimfw() { source ${HOME}/.zim/zimfw.zsh "${@}" }
fpath=(${HOME}/git/dotfiles/.zim/modules/git/functions ${HOME}/git/dotfiles/.zim/modules/utility/functions ${HOME}/git/dotfiles/.zim/modules/git-info/functions ${fpath})
autoload -Uz git-branch-current git-branch-delete-interactive git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd coalesce git-action git-info
source ${HOME}/git/dotfiles/.zim/modules/environment/init.zsh
source ${HOME}/git/dotfiles/.zim/modules/git/init.zsh
source ${HOME}/git/dotfiles/.zim/modules/input/init.zsh
source ${HOME}/git/dotfiles/.zim/modules/termtitle/init.zsh
source ${HOME}/git/dotfiles/.zim/modules/utility/init.zsh
source ${HOME}/git/dotfiles/.zim/modules/zsh-completions/zsh-completions.plugin.zsh
source ${HOME}/git/dotfiles/.zim/modules/completion/init.zsh
source ${HOME}/git/dotfiles/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/git/dotfiles/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
