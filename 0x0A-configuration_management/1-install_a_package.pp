# install flask package using pip

package { flask:
    ensure   => 'installed',
    provider => pip3,
    name     => 'flask==2.1.0'
}
