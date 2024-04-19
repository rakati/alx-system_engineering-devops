# install flask package using pip
package { 'flask':
    ensure   => 'absent',
    provider => 'pip3',
}
