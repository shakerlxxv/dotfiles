# Get the aliases and functions
if [ -f ~/.bashrc ]; then
            . ~/.bashrc
fi

export ORA_CLIENT=/opt/oracle/instantclient
export OCI_DIR=$ORA_CLIENT
export TNS_ADMIN=$ORA_CLIENT/network/admin
export PATH=$PATH:$ORA_CLIENT
export JAVA_HOME=`test -x /usr/libexec/java_home && /usr/libexec/java_home -v 1.8`
export R_HOME=/Library/Frameworks/R.framework/Resources
export SVN_VSGNNE=/Users/bshaver/Documents/Projects/VSGNNE.svn
# for homebrew
export PATH="/usr/local/sbin:$PATH"
# for SQLcl
export PATH=${PATH}:/opt/oracle/sqlcl/bin
export SQLPATH=${HOME}/.sql:${HOME}/Documents/Projects/m2s_oracle_apex/scripts/sql

# ----------------
# from http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function proml {
 local    BLUE="\[\033[0;34m\]"
 local    RED="\[\033[0;31m\]"
 local LIGHT_RED="\[\033[1;31m\]"
 local   GREEN="\[\033[0;32m\]"
 local LIGHT_GREEN="\[\033[1;32m\]"
 local   WHITE="\[\033[1;37m\]"
 local LIGHT_GRAY="\[\033[0;37m\]"
 case $TERM in
  xterm*)
  TITLEBAR='\[\033]0;\u@\h:\w\007\]'
  ;;
  *)
  TITLEBAR=""
  ;;
 esac

#style 1
PS1="${TITLEBAR}\
$BLUE[$RED\$(date +%H:%M)$BLUE]\
$BLUE[$RED\u@\h:\w$GREEN\$(parse_git_branch)$BLUE]\
$LIGHT_GRAY\n\$ "

#style 2
# PS1="${TITLEBAR}\
# $GREEN[\$(date +%H:%M)]\
# [\u@\h:\w\$(parse_git_branch)]\
# \$$WHITE "

PS2='> '
PS4='+ '
}
proml
# ----------------

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Setting PATH for JRuby 1.7.4
# The orginal version is saved in .bash_profile.jrubysave
PATH="${PATH}:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
export PATH


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#-------------------------------------------------------------------------------
# bash completion installed from homebrew
#   /usr/local/etc/bash_completion.d
#-------------------------------------------------------------------------------
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# added by Anaconda3 5.1.0 installer
export PATH="/Users/bshaver/anaconda3/bin:$PATH"
