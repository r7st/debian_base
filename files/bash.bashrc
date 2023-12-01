[ -z "$PS1" ] && return
PS1="\u@\h:\w\$ "
[ $USER = root ] && { 
  PS1="\033[0;31m${PS1}\033[0m"
  umask 077
}; export PS1 
HISTTIMEFORMAT="[%F %T] "
export TERM=xterm-256color
unset PROMPT_COMMAND
alias ll="ls -lrtFHAh --color=auto"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
chomp(){ awk '
{
  if ($0~/^[ \t]*$/) next
  else if ($0~/^#/) next
  split($0,Line,"#"); print Line[1]
}
' < $1; }
true
