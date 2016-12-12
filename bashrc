# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# give preference to the brew installed binaries over the Xcode command line tools
export PATH=/usr/local/bin:$PATH
export PATH=/opt/subversion/bin:$PATH
export PATH=/opt/oracle/instantclient:$PATH

export DYLD_LIBRARY_PATH=/opt/oracle/instantclient/:$DYLD_LIBRARY_PATH

export EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias gvim='mvim'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias bec='bundle exec cucumber'
alias ll='ls -al'
alias ls='ls -F'
alias less='less -r'
alias be='bundle exec'
alias cuke='bundle exec cucumber'
alias spec='bundle exec rspec'
alias svna="svn add \`svn status | grep \? | awk '{print \$2}'\`"
alias ec='emacsclient -n'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PROJECTS=/Users/bshaver/Documents/Projects

function rbv() {
  _filename=$1
  find $PROJECTS/VSGNNE.svn/tags -name ${_filename} | grep -iv rollback
}

function rbvc() {
  _filename=$1
  _rb_file=`find $PROJECTS/VSGNNE.svn/tags -name ${_filename} | grep -v rollback | tail -1`
  cp -p ${_rb_file} $PROJECTS/apex/apex_scripts/release/rollback/
}
