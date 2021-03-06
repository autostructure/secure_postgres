# This class manages V-72909
# PostgreSQL must utilize centralized management of the content captured in
# audit records generated by all components of PostgreSQL.
class secure_postgres::stig::v72909 (
  Boolean $enforced = false,
) {
  file_line { 'log_destination':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'log_destination = \'syslog\'',
    match => '^#log_destination(\s|=)',;
  }


  file_line { 'syslog_facility':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'syslog_facility = \'LOCAL0\'',
    match => '^#syslog_facility(\s|=)',;
  }


  file_line { 'syslog_ident':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'syslog_ident = \'postgres\'',
    match => '^#syslog_ident(\s|=)',;
  }
}
