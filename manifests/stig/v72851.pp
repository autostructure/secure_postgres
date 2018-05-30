# This class manages V-72851
# PostgreSQL must provide non-privileged users with error messages that provide
# information necessary for corrective actions without revealing information that
# could be exploited by adversaries.
class secure_postgres::stig::v72851 (
  Boolean $enforced = false,
) {
  file_line { 'client_min_messages':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'client_min_messages = error',
    match => '^#client_min_messages(\s|=)',;
  }
}
