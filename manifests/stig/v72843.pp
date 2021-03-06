# This class manages V-72843
# PostgreSQL must produce audit records containing sufficient information to
# establish the outcome (success or failure) of the events.
class secure_postgres::stig::v72843 (
  Boolean $enforced = false,
) {
  file_line {
    default:
      * => $secure_postgres::file_line_postgresql_conf_defaults,;

    'pgaudit.log_catalog':
      line  => 'pgaudit.log_catalog=\'on\'',
      match => '^#pgaudit.log_catalog(\s|=)',;

    'pgaudit.log_level':
      line  => 'pgaudit.log_level=\'log\'',
      match => '^#pgaudit.log_level(\s|=)',;

    'pgaudit.log_parameter':
      line  => 'pgaudit.log_parameter=\'on\'',
      match => '^#pgaudit.log_parameter(\s|=)',;

    'pgaudit.log_statement_once':
      line  => 'pgaudit.log_statement_once=\'off\'',
      match => '^#pgaudit.log_statement_once(\s|=)',;

    'pgaudit.log':
      line  => 'pgaudit.log=\'all, -misc\'',
      match => '^#pgaudit.log(\s|=)',;

    'log_line_prefix':
      line  => 'log_line_prefix = \'< %m %u %d %e: >\'',
      match => '^#log_line_prefix(\s|=)',;

    'log_error_verbosity':
      line  => 'log_error_verbosity = default',
      match => '^#log_error_verbosity(\s|=)',;
  }
}
