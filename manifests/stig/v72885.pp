# This class manages V-72885
# The audit information produced by PostgreSQL must be protected from unauthorized deletion.
class secure_postgres::stig::v72885 (
  Boolean $enforced = false,
) {
  file_line { 'log_timezone':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'log_timezone=\'UTC\'',
    match => '^#log_timezone(\s|=)',;
  }
}
