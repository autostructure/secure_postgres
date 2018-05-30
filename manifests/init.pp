#
# This module secures windows
#
class secure_postgres (
  String $pgdata = '/var/lib/postgresql/data',
  String $postgresql_conf = "${pgdata}/postgresql.conf",
) {
  # Defaults for file_line
  $file_line_postgresql_conf_defaults = {
    path    => $::secure_postgres::postgresql_conf,
  }

  file { $postgresql_conf:
    ensure  => file,
    group   => 'postgres',
    owner   => 'postgres',
    replace => false,
  }

  class { '::secure_postgres::stig::v72841': }
  class { '::secure_postgres::stig::v72843': }
  class { '::secure_postgres::stig::v72847': }
  class { '::secure_postgres::stig::v72851': }
  class { '::secure_postgres::stig::v72863': }
  class { '::secure_postgres::stig::v72885': }
  # class { '::secure_postgres::stig::v72889': }
  class { '::secure_postgres::stig::v72909': }
  # class { '::secure_postgres::stig::v72919': }
}
