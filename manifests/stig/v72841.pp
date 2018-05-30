# This class manages V-72841
# PostgreSQL must be configured to prohibit or restrict the use of
# organization-defined functions, ports, protocols, and/or services,
# as defined in the PPSM CAL and vulnerability assessments.
class secure_postgres::stig::v72841 (
  Boolean $enforced = false,
) {
  file_line { 'port':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'port = 5432',
    match => '^#port(\s|=)',;
  }
}
