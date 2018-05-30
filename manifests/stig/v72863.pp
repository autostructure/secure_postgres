# This class manages V-72863
# PostgreSQL must limit the number of concurrent sessions to an
# organization-defined number per user for all accounts and/or account types.
class secure_postgres::stig::v72863 (
  Boolean $enforced = false,
  Integer $max_connections = 100,
) {
  file_line { 'max_connections':
    path  => $::secure_postgres::postgresql_conf,
    line  => "max_connections = ${max_connections}",
    match => '^#max_connections(\s|=)',;
  }
}
