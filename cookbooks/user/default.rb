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

link "/etc/localtime" do
  to "/usr/share/zoneinfo/Asia/Tokyo"
  force true
end

package "ncurses-libs.i686" do
  action :install
end

package "ld-linux.so.2" do
  action :install
end

git "/home/kter/.dotfiles" do
  # repository "git@github.com:kter/settings.git"
  repository "https://github.com/kter/settings.git"
  destination "/home/kter/.dotfiles"
  user "kter"
end

execute "/home/kter/.dotfiles/init.sh" do
  user "kter"
end

execute "curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh" do
  user "kter"
end

package "epel-release" do
  action :install
end

package "xclip" do
  options "--enablerepo=epel"
  action :install
end

package "xsel" do
  options "--enablerepo=epel"
  action :install
end

execute "git config --global user.name kter && git config --global user.email me@kter.jp" do
  user "kter"
end

execute "curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug" do
  user "kter"
end
