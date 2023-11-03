# elk::filebeat
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include elk::filebeat
# Filebeat prospectors - expects array of structured data
# [ {
#   "type" => "log",
#   "paths" => [
#      "/var/log/puppetlabs/puppetserver/puppetserver.log.json",
#      "/var/log/puppetlabs/puppetserver/puppetserver-access.log.json",
#    ],
#   "json_keys_under_root" => true
# } ] 

class elk::filebeat (
  $prospectors     = [],
  $logstash_server = '127.0.0.1',
  $logstash_port   = '5044',
){
  # this will include the elastic_stack repo in the server's apt repositories, has nothing to do with the git repos
  include elastic_stack::repo
  # install filebeat package
  package{'filebeat':
    ensure => present,
  }
  # run filebeat service
  service{'filebeat':
    ensure  => running,
    enable  => true,
    require => Package['filebeat'],
  }
  
}
