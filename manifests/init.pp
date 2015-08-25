# remote_syslog2
#
# Parameters:
#
#   [*config_file*]            - path to configuration
#   [*destination_port*]       - destination syslog port
#   [*destination_protocol*]   - chose between unencrypted 'tcp' or 'tls'
#   [*destination_host*]       - destination syslog hostname or IP
#   [*exclude_files*]          - files excluded from being sent
#   [*exclude_patterns*]       - log messages that you do not want to be sent
#   [*files*]                  - filenames to log
#   [*hostname*]               - local hostname to send from
#   [*new_file_check_interval] - how often to check for new files
#   [*service_ensure]          - enable remote_syslog2
#   [*service_provider]        - service provider
#   [*temp_dir]                - temp path used at installation
#   [*version]                 - remote_syslog2 release
#
# Usage:
#
#   $files = ['/var/log/mysqld.log', '/var/log/httpd/access_log']
#   class { 'remote_syslog2':
#     destination_port => 55555,
#     files            => $files,
#   }
#
class remote_syslog2 (
  $destination_port,
  $files,
  $config_file             = $remote_syslog2::params::config_file,
  $destination_protocol    = $remote_syslog2::params::destination_protocol,
  $destination_host        = $remote_syslog2::params::destination_host,
  $exclude_files           = $remote_syslog2::params::exclude_files,
  $exclude_patterns        = $remote_syslog2::params::exclude_patterns,
  $hostname                = $remote_syslog2::params::hostname,
  $install_dir             = $remote_syslog2::params::install_dir,
  $new_file_check_interval = $remote_syslog2::params::new_file_check_interval,
  $service_ensure          = $remote_syslog2::params::service_ensure,
  $service_file            = $remote_syslog2::params::service_file,
  $temp_dir                = $remote_syslog2::params::temp_dir,
  $version                 = $remote_syslog2::params::version,
) inherits remote_syslog2::params {

  validate_absolute_path($temp_dir)
  validate_absolute_path($install_dir)
  validate_numeric($destination_port, 65535, 0)
  validate_re($new_file_check_interval, '[0-9]+')
  validate_string($version)
  validate_string($hostname)
  validate_string($service_ensure)

  if empty($files) {
    fail('files must be an array with at least one element')
  }

  include remote_syslog2::install, remote_syslog2::config, remote_syslog2::service
}
