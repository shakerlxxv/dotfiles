export PATH=/opt/homebrew/Caskroom/sqlcl/23.4.0.023.2321/sqlcl/bin:"$PATH"

export PATH=/opt/utPLSQL-cli/bin:$PATH

export OCI_DIR=/opt/oracle/instantclient_11_2
export ORA_CLIENT=/opt/oracle/instantclient
export OCI_DIR=$ORA_CLIENT
export TNS_ADMIN=$ORA_CLIENT/network/admin
export PATH=$PATH:$ORA_CLIENT

export SQLPATH=${HOME}/.sql:${HOME}/Documents/Projects/m2s_oracle_apex/scripts/sql
export PATH=/opt/homebrew/Caskroom/sqlcl/24.1.0.087.0929/sqlcl/bin:"$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Your local scripts stuff
export PATH="$PATH:$HOME/local/bin"
