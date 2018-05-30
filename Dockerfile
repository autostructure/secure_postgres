FROM postgres:latest

COPY files/docker-entrypoint.sh /docker-entrypoint.sh
COPY . /etc/puppetlabs/code/environments/production/modules/secure_postgres

RUN cp /usr/share/postgresql/postgresql.conf.sample /etc/postgresql/postgresql.conf && \
    apt-get -y update && \
    apt-get install -y wget && \
    wget https://apt.puppetlabs.com/puppet5-release-stretch.deb && \
    dpkg -i puppet5-release-stretch.deb && \
    apt-get -y update && \
    apt-get -y install puppet-agent && \
    /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib && \
    /opt/puppetlabs/bin/puppet apply -e "class { '::secure_postgres': postgresql_conf => '/etc/postgresql/postgresql.conf' }" && \
    rm -rf /opt/puppetlabs/puppet/cache && \
    rm -rf /etc/puppetlabs/code/environments/production/modules && \
    apt-get remove --purge -y wget puppet-agent && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
