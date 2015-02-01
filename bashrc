
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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
