require 'spec_helper'

packages = %w(
  vim-enhanced
  zsh
  telnet
  tcpdump
  ntp
  wget
  logwatch
  sysstat
  lsof
  man
)

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe service('ntpd') do
  it { should be_enabled }
  it { should be_running }
end

