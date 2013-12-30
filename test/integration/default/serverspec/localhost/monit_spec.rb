require 'spec_helper'

describe 'Monit Daemon' do
  it 'is installed' do
    expect(package('monit')).to be_installed
  end

  it 'is enabled' do
    expect(service('monit')).to be_enabled
  end

  it 'is running' do
    expect(process('monit')).to be_running
  end

  it 'is listening on port 2812' do
    expect(port(2812)).to be_listening
  end

  it 'is monitoring sshd' do
    expect(command('sudo monit status').stdout).to match /sshd/
  end
end
