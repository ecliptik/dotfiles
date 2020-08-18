zimfw() { source ${HOME}/.zim/zimfw.zsh "${@}" }
fpath=(${HOME}/Documents/git/dotfiles/.zim/modules/git/functions ${HOME}/Documents/git/dotfiles/.zim/modules/utility/functions ${HOME}/Documents/git/dotfiles/.zim/modules/git-info/functions ${fpath})
autoload -Uz git-alias-lookup git-branch-current git-branch-current 2 git-branch-delete-interactive git-branch-delete-interactive 2 git-dir git-dir 2 git-ignore-add git-ignore-add 2 git-root git-root 2 git-stash-clear-interactive git-stash-clear-interactive 2 git-stash-recover git-stash-recover 2 git-submodule-move git-submodule-move 2 git-submodule-remove git-submodule-remove 2 mkcd mkcd 2 mkpw coalesce coalesce 2 git-action git-action 2 git-info git-info 2
source ${HOME}/Documents/git/dotfiles/.zim/modules/environment/init.zsh
source ${HOME}/Documents/git/dotfiles/.zim/modules/git/init.zsh
source ${HOME}/Documents/git/dotfiles/.zim/modules/input/init.zsh
source ${HOME}/Documents/git/dotfiles/.zim/modules/termtitle/init.zsh
source ${HOME}/Documents/git/dotfiles/.zim/modules/utility/init.zsh
source ${HOME}/Documents/git/dotfiles/.zim/modules/zsh-completions/zsh-completions.plugin.zsh
source ${HOME}/Documents/git/dotfiles/.zim/modules/completion/init.zsh
source ${HOME}/Documents/git/dotfiles/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/Documents/git/dotfiles/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
