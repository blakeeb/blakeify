#local user='%{$terminfo[bold]$fg[green]%}%n@%{$terminfo[bold]$fg[green]%}%m%{$reset_color%}'
local user='%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}'
local pwd='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local rvm=''
if which rvm-prompt &> /dev/null; then
  if rvm-prompt i v g &> /dev/null; then
    rvm='%{$terminfo[bold]$fg[red]%}$(rvm-prompt i v g)%{$reset_color%}'
  fi
else
  if which rbenv &> /dev/null; then
    if rbenv version &> /dev/null; then
      rvm='%{$terminfo[bold]$fg[red]%}$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%}'
    fi
  fi
fi
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%} $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$terminfo[bold]$fg[blue]%} ~"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} x"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} >"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} *"

PROMPT="${user} ${pwd}
> "

#RPROMPT="${return_code} ${git_branch} ${rvm}"
RPROMPT="${git_branch} ${rvm}"
