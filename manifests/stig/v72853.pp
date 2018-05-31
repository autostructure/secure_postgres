# This class manages V-72853

class secure_postgres::stig::v72853 (
  Boolean $enforced = false,
) {

  # TODO NOTES:
  # Note: The following instructions use the PGDATA and PGVER environment variables. See supplementary content APPENDIX-F for instructions on configuring PGDATA and APPENDIX-H for PGVER.

  # As the database administrator (shown here as "postgres"), change the ownership and permissions of configuration files in PGDATA:

  #$ sudo su - postgres
  #$ chown postgres:postgres ${PGDATA?}/postgresql.conf
  #$ chmod 0600 ${PGDATA?}/postgresql.conf 

  # As the server administrator, change the ownership and permissions of shared objects in /usr/pgsql-${PGVER?}/*.so

  #$ sudo chown root:root /usr/pgsql-${PGVER?}/lib/*.so
  #$ sudo chmod 0755 /usr/pgsql-${PGVER?}/lib/*.so

  # As the service administrator, change the ownership and permissions of executables in /usr/pgsql-${PGVER?}/bin:

  #$ sudo chown root:root /usr/pgsql-${PGVER?}/bin/*
  #$ sudo chmod 0755 /usr/pgsql-${PGVER?}/bin/*
}
