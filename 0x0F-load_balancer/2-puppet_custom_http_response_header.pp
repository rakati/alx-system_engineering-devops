# Puppet configuration for configuring nginx server

http {
  add_header X-Served-By $hostname;
}
