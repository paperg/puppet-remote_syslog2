class remote_syslog2::service {

  if ! ($remote_syslog2::params::service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  service { 'remote_syslog2':
    ensure   => $remote_syslog2::params::service_ensure,
    provider => $remote_syslog2::params::service_provider,
    require  => Class['remote_syslog2::config'],
  }
}
