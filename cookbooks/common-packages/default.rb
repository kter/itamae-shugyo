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

group "kter" do
  action :create
  groupname "kter"
  gid 1379
end

user "kter" do
  username "kter"
  gid 1379
  uid 1379
  shell '/bin/zsh'
  home '/home/kter'
  create_home true
  action :create
end

directory "/home/kter/.ssh" do
  action :create
  owner "kter"
  group "kter"
  path "/home/kter/.ssh"
  mode "700"
end

remote_file "/home/kter/.ssh/authorized_keys" do
  owner "kter"
  group "kter"
  source "files/authorized_keys"
end

file "/home/kter/.ssh/authorized_keys" do
  owner "kter"
  group "kter"
  mode "600"
end

execute "echo '%kter ALL=(ALL) ALL' >> /etc/sudoers" do
  not_if "grep '%kter ALL=(ALL) ALL' /etc/sudoers"
end
