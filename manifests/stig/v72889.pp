# This class manages V-72889
# PostgreSQL must reveal detailed error messages only to the ISSO, ISSM, SA and DBA.
class secure_postgres::stig::v72889 (
  Boolean $enforced = false,
) {
  file_line { 'client_min_messages':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'client_min_messages = notice',
    match => '^#client_min_messages(\s|=)',;
  }
}
