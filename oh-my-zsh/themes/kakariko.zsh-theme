#Set title correctly
case $TERM in
  xterm*|screen*)
    precmd () {print -Pn "\e]0;%m:%~\a"}
    ;;
esac

PROMPT=$'
%{$fg[cyan]%}%/%{$reset_color%} $(git_prompt_info)%{$fg_bold[black]%}[%m]%{$reset_color%} %{$fg_bold[black]%}%{$reset_color%}
%{$fg_bold[black]%}ム%{$reset_color%} '

PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"

ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="✓"
