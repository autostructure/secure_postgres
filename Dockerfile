FROM postgres:latest

# COPY cmd_wrapper.sh /root/cmd_wrapper.sh

RUN apt-get -y update && \
    apt-get install -y wget && \
    wget https://apt.puppetlabs.com/puppet5-release-stretch.deb && \
    dpkg -i puppet5-release-stretch.deb && \
    apt-get -y update && \
    apt-get -y install puppet-agent && \
    /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib && \
    apt-get remove --purge -y wget puppet-agent && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# && \
#     /opt/puppetlabs/bin/puppet module install autostructure-laravel && \
#     /opt/puppetlabs/bin/puppet apply -e 'include ::laravel' && \
#     yum clean all && \
#     rm -rf /var/cache/yum
#
# CMD ["/root/cmd_wrapper.sh"]
