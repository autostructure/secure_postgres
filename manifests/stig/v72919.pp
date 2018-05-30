# This class manages V-72919
# PostgreSQL must generate audit records when categorized information
# (e.g., classification levels/security levels) is accessed.
class secure_postgres::stig::v72919 (
  Boolean $enforced = false,
) {
  file_line { 'pgaudit.log':
    path  => $::secure_postgres::postgresql_conf,
    line  => 'pgaudit.log = \'ddl, write, role\'',
    match => '^#pgaudit.log(\s|=)',;
  }
}
