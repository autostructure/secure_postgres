# This class manages V-73223
# Passwords for the built-in Administrator account must be changed at least every 60 days.
class secure_postgres::stig::v72847 (
  Boolean $enforced = false,
) {
  # secure_windows::stig::v72841
  #
  # In order to prevent unauthorized connection of devices, unauthorized transfer of information, or unauthorized tunneling (i.e., embedding
  # of data types within data types), organizations must disable or restrict unused or unnecessary physical and logical
  # ports/protocols/services on information systems.
  #
  # Applications are capable of providing a wide variety of functions and services. Some of the functions and services provided by default
  # may not be necessary to support essential organizational operations. Additionally, it is sometimes convenient to provide multiple
  # services from a single component (e.g., email and web services); however, doing so increases risk over limiting the services provided by
  # any one component.
  #
  # To support the requirements and principles of least functionality, the application must support the organizational requirements
  # providing only essential capabilities and limiting the use of ports, protocols, and/or services to only those required, authorized, and
  # approved to conduct official business or to address authorized quality of life issues.
  #
  # Database Management Systems using ports, protocols, and services deemed unsafe are open to attack through those ports, protocols, and
  # services. This can allow unauthorized access to the database and through the database to other components of the information system.

  file_line { 'log_file_mode':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'log_file_mode = 0600',
    match => '^#log_file_mode(\s|=)',;
  }
}
