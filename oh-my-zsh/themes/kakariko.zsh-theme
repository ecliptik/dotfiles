#Set title correctly
case $TERM in
  xterm*|screen*)
    precmd () {print -Pn "\e]0;%m:%~\a"}
    ;;
esac

PROMPT=$'%{$reset_color%}
%{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info)%}%{$fg_bold[magenta]%}%m%{$reset_color%}
%{$fg_bold[magenta]%}ム%{$reset_color%} '

PROMPT2="%{$fg_bold[magenta]%}%_> %{$reset_color%}"

ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg_bold[yellow]%}( "
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$fg_bold[yellow]%}"
