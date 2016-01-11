require 'spec_helper'

describe command('/usr/local/bin/tmux -V') do
  its(:stdout) { should match /tmux 2.2/ }
end

describe file('/home/kter/.dotfiles') do
  it { should be_directory } 
  it { should be_owned_by "kter" }
end


