#Set vi keybindings
set -o vi

#Turn off stop/resume on interactive shells
[[ $- == *i* ]] && stty -ixon

#Set a standard non-colorized prompt
PS1="${TITLEBAR}\n\u@\h:${os_name}-${arch}:\n\W $ "

#Use features depending on TERM type
case ${TERM} in
xterm*|screen*|rxvt*)
    #Remove __git_ps1 features for solaris
    case ${os_name} in
    solaris*)
        PS1="${TITLEBAR}\n${reset}${LCyan}\u${reset}@${LYellow}\h${reset}:${LGreen}${os_name}-${arch}:${LMagenta}${reset}\n${LRed}\W${reset} $ "
    ;;
    #Use additional features for everything else
    *)
        PS1="${TITLEBAR}\n${reset}${LCyan}\u${reset}@${LYellow}\h${reset}:${LGreen}${os_name}-${arch}:${LMagenta}\$(__git_ps1)${reset}\n${LRed}\W${reset} $ "
    ;;
    esac
;;
esac

export PS1
