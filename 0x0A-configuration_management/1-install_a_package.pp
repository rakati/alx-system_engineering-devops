# install flask package using pip
package { 'werkzeug':
    ensure   => '2.2.2',
    provider => 'pip3',
}

package { 'flask':
    ensure   => '2.1.0',
    provider => 'pip3',
    require  => Package['werkzeug']
}
