# Puppet configuration for adding custom request header to nginx server

package { 'nginx':
  ensure => 'installed',
}

exec { 'custom request header':
  command  => 'sudo sed -i "/server {/a \ \ \ \ add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default
	sudo service nginx restart',
  provider => shell,
  require => Package['nginx'],
}
