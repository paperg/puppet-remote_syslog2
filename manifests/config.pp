class remote_syslog2::config inherits remote_syslog2 {

  file { $remote_syslog2::params::config_file:
    mode    => '0664',
    content => template($remote_syslog2::params::config_file_template),
    require => Class['remote_syslog2::install'],
    notify  => Class['remote_syslog2::service'],
  }

  file { $remote_syslog2::params::service_file:
    mode    => '0765',
    content => template($remote_syslog2::params::service_template),
    require => Class['remote_syslog2::install'],
    notify  => Class['remote_syslog2::service'],
  }
}
