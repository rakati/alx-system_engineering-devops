# Puppet script for fix a bug in our LAMP web-stack
# the bug is an errata in file extension, writing '.phpp' in in place of '.php'

exec { 'fix_php_setting_file':
  command => 'sed -i s/.phpp/.php/ /var/www/html/wp-settings.php',
  path    => '/bin/'
}
