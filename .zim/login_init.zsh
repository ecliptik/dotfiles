() {
  setopt LOCAL_OPTIONS CASE_GLOB EXTENDED_GLOB
  autoload -Uz zrecompile
  local zdumpfile zfile

  # Compile the completion cache; significant speedup
  zstyle -s ':zim:completion' dumpfile 'zdumpfile' || zdumpfile=${ZDOTDIR:-${HOME}}/.zcompdump
  if [[ -f ${zdumpfile} ]]; then
    zrecompile -p ${1} ${zdumpfile} || return 1
  fi

  # Compile Zsh startup files
  for zfile in ${ZDOTDIR:-${HOME}}/.z(shenv|profile|shrc|login|logout)(N-.); do
    zrecompile -p ${1} ${zfile} || return 1
  done

  # Compile Zim scripts
  for zfile in /${HOME}/.zim/(^*test*/)#*.zsh(|-theme)(N-.); do
    zrecompile -p ${1} ${zfile} || return 1
  done

  if [[ ${1} != -q ]] print -P 'Done with compile.'
} "${@}"
