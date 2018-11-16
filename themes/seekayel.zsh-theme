local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

function aws_profile() {
  if [[ HW_AWS_EXPIRATION && "$(date +%FT%TZ)" > "$HW_AWS_EXPIRATION" ]]; then
    unset HW_AWS_PROFILE
    unset HW_AWS_EXPIRATION
  fi

  if [ "$HW_AWS_PROFILE" ]; then
    echo "%{$fg_bold[green]%}[$HW_AWS_PROFILE]%{$reset_color%} "
  fi
}

PROMPT='$(aws_profile)${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
RPROMPT='[%*]'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
