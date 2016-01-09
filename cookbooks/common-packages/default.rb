packages = %w(
  vim-enhanced
  zsh
)

packages.each do | package |
  package package do
  action :install
  end
end
