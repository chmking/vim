# local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# PROMPT='${ret_status} $(kube_ps1) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
# 
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[normal]$fg[blue]%}%n@%m%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[normal]$fg[green]%}%n@%m%{$reset_color%}'
    local user_symbol='$'
fi

local current_dir='%{$terminfo[normal]$fg[blue]%}%~%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

local kube_ps='$(kube_ps1)%{$reset_color%}'

PROMPT="${user_host} ${current_dir} ${kube_ps} ${git_branch}
%B${user_symbol}%b "

# PROMPT="${user_host} ${current_dir} ${git_branch}
# %B${user_symbol}%b "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
