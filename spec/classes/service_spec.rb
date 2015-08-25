require 'spec_helper'

describe 'remote_syslog2::service' do

  describe 'on Ubuntu use upstart' do
    let(:facts) { {:osfamily => 'Debian', :operatingsystem => 'Ubuntu'} }

    it { should contain_service('remote_syslog2').with(
      :ensure   => 'running',
      :provider => 'upstart',
    )}
  end
end
