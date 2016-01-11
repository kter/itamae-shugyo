git "/user/local/src/libevent" do
  repository "https://github.com/libevent/libevent"
  destination "/usr/local/src/libevent"
  user "root"
end

execute "cd /usr/local/src/libevent && sh autogen.sh && ./configure && make && make install" do
  user "root"
end

git "/user/local/src/tmux.git" do
  repository "https://github.com/tmux/tmux.git"
  destination "/usr/local/src/tmux.git"
  user "root"
end

package "ncurses-devel" do
  user "root"
  action :install
end

execute "echo /usr/local/lib > /etc/ld.so.conf.d/libevent.conf" do
  only_if "ldconfig"
  user "root"
end

execute "cd /usr/local/src/tmux.git && sh autogen.sh && ./configure && make && make install" do
  user "root"
end

git "/home/kter/.tmux/plugins/tpm" do
  repository "https://github.com/tmux-plugins/tpm"
  destination "/home/kter/.tmux/plugins/tpm"
  user "kter"
end
