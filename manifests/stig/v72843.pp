# This class manages V-73223
# Passwords for the built-in Administrator account must be changed at least every 60 days.
class secure_postgres::stig::v72843 (
  Boolean $enforced = false,
) {
  # secure_windows::stig::v72843
  #
  # Information system auditing capability is critical for accurate forensic analysis. Without information about the outcome of events,
  # security personnel cannot make an accurate assessment as to whether an attack was successful or if changes were made to the security
  # state of the system.
  #
  # Event outcomes can include indicators of event success or failure and event-specific results (e.g., the security state of the
  # information system after the event occurred). As such, they also provide a means to measure the impact of an event and help authorized
  # personnel to determine the appropriate response.
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
