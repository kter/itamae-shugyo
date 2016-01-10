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
  @development
)

packages.each do | package |
  package package do
  action :install
  end
end

service "ntpd" do
  action :start
end

service "ntpd" do
  action :enable
end

