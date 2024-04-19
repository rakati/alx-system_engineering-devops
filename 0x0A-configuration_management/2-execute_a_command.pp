# kill a process using pkill
exec { 'pkill':
    command => 'pkill -f killmenow',
    path    => '/usr/bin',
}
