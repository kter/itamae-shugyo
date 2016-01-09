require 'spec_helper'

packages = %w(
  vim-enhanced
  zsh
)

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

