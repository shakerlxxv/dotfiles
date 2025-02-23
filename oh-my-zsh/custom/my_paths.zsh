export PATH=/opt/utPLSQL-cli/bin:$PATH

export OCI_DIR=/opt/oracle/instantclient_23_3
export ORA_CLIENT=/opt/oracle/instantclient
export OCI_DIR=$ORA_CLIENT
export TNS_ADMIN=$ORA_CLIENT/network/admin
export PATH=$PATH:$ORA_CLIENT

export LIQUIBASE_HOME=/opt/homebrew/opt/liquibase/libexec

export SQLPATH=${HOME}/.sql:${HOME}/Documents/Projects/m2s_oracle_apex/scripts/sql
export SQLCL=/opt/homebrew/Caskroom/sqlcl/24.4.1.042.1221/sqlcl
export PATH=${SQLCL}/bin:"$PATH"
# sqlCL requires JDK11 to include JavaScript engine
alias sql='PATH=/opt/homebrew/opt/openjdk@11/bin/:${PATH} ${SQLCL}/bin/sql'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Your local scripts stuff
export PATH="$PATH:$HOME/local/bin"

# support 2nd homebrew installed under x86 arch /usr/local prefix
#   this was required to install an x86 jdk needed for old Talend Studio
if [[ $(arch) == "i386" ]]; then eval "$(/usr/local/bin/brew shellenv)"; fi
