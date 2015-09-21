export ORA_CLIENT=/opt/oracle/instantclient
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$ORA_CLIENT/
export TNS_ADMIN=$ORA_CLIENT/network/admin
export PATH=$PATH:$ORA_CLIENT
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export R_HOME=/Library/Frameworks/R.framework/Resources

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
# PS1="${TITLEBAR}\
# $BLUE[$RED\$(date +%H:%M)$BLUE]\
# $BLUE[$RED\u@\h:\w$GREEN\$(parse_git_branch)$BLUE]\
# $LIGHT_GRAY\$ "

#style 2
PS1="${TITLEBAR}\
$GREEN[\$(date +%H:%M)]\
[\u@\h:\w\$(parse_git_branch)]\
\$$WHITE "

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

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
            . ~/.bashrc
fi
