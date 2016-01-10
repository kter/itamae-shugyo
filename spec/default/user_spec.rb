require 'spec_helper'

describe user('kter') do
  it { should exist }
  it { should belong_to_group 'kter' }
  it { should have_uid 1379 }
  it { should have_home_directory '/home/kter' }
  it { should have_login_shell '/bin/zsh' }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbDlgqZbRItJK6+1jtL7MyeM3/aVeiMQxhrHuP+xkXtbDa9co4U+Bjv9HPPPSmuCxn6gWQygpLE1K0xqUejAiRYbz+FNwGXcXi57g0JjPM3uASCbesAxYdRQ/BSXdktRezWtzvesxwq1Rl9FnoVlhNmSDmpckkfIf5bLo3BgyP5rUUoeB9aMptq1RDpjMooiSGsNoFQISme8SiTmZMSyGBWbfTDquTi9s5imq13XK7rPeBnWBSxYDNUhvvmAm9XrmDgxijzCul1F0/yOOxNCPXUFZM8+3mwGTJzzO7EnPva55Qtmo//gWacifSmCOKE3eepCRNtrQ8U+AosMbz1LrX' }
end

describe file('/etc/sudoers') do
  it { should contain '%kter ALL=(ALL) ALL' }
end

describe command('date') do
  its(:stdout) { should match /JST/ }
end

describe file('/home/kter/.dotfiles') do
  it { should be_directory } 
  it { should be_owned_by "kter" }
end


