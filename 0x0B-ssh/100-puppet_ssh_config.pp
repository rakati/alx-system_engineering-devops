# Puppet configuration for changing ssh config file

file_line { 'setIdenticationFile':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school',
  match => '^#?IdentityFile',
}

file_line { 'NoPasswordAuthentication':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
  match => '^#?PasswordAuthentication',
}
