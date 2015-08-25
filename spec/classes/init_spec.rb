require 'spec_helper'

describe 'remote_syslog2' do
  context 'with defaults' do
    it { should contain_class('remote_syslog2::install') }
    it { should contain_class('remote_syslog2::config') }
    it { should contain_class('remote_syslog2::service') }
  end
end
