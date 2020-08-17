zimfw() { source /Users/mwaltz/.zim/zimfw.zsh "${@}" }
fpath=(/Users/mwaltz/Documents/git/dotfiles/.zim/modules/git/functions /Users/mwaltz/Documents/git/dotfiles/.zim/modules/utility/functions /Users/mwaltz/Documents/git/dotfiles/.zim/modules/git-info/functions ${fpath})
autoload -Uz git-alias-lookup git-branch-current git-branch-delete-interactive git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw coalesce git-action git-info
source /Users/mwaltz/Documents/git/dotfiles/.zim/modules/environment/init.zsh
source /Users/mwaltz/Documents/git/dotfiles/.zim/modules/git/init.zsh
source /Users/mwaltz/Documents/git/dotfiles/.zim/modules/input/init.zsh
source /Users/mwaltz/Documents/git/dotfiles/.zim/modules/termtitle/init.zsh
source /Users/mwaltz/Documents/git/dotfiles/.zim/modules/utility/init.zsh
source /Users/mwaltz/Documents/git/dotfiles/.zim/modules/zsh-completions/zsh-completions.plugin.zsh
source /Users/mwaltz/Documents/git/dotfiles/.zim/modules/completion/init.zsh
source /Users/mwaltz/Documents/git/dotfiles/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/mwaltz/Documents/git/dotfiles/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
