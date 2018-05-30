# This class manages V-72847
# The audit information produced by PostgreSQL must be protected from unauthorized modification.
class secure_postgres::stig::v72847 (
  Boolean $enforced = false,
) {
  file_line { 'log_file_mode':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'log_file_mode = 0600',
    match => '^#log_file_mode(\s|=)',;
  }
}
