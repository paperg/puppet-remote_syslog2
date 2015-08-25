require 'spec_helper'

describe 'remote_syslog2::config' do
  it { should contain_file('/etc/log_files.yml') }

  context 'on Ubuntu' do
    let(:facts) { {:osfamily => 'Debian', :operatingsystem => 'Ubuntu'} }

    it { should contain_file('/etc/init.d/remote_syslog2').with({
        'content' => /pre-start exec/})
    }
  end

  context 'on Debian' do
    let(:facts) { {:osfamily => 'Debian'} }

    it { should contain_file('/etc/init.d/remote_syslog2').with({
        'content' => /### BEGIN INIT INFO/})
    }
  end
end
