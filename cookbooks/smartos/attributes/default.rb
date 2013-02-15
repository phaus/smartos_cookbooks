# SmartOS Base Recipes Attributes

#default[:hostname]  	= ""

## NTP (Default to NTP Pool Servers)
default[:ntp][:servers] = ["0.pool.ntp.org", "1.pool.ntp.org", "2.pool.ntp.org"]

## SSH Pub/Priv Keys for root
#default[:ssh][:pubkey]                         = "http://path/to/id_dsa.pub"
#default[:ssh][:privkey]                        = "http://path/to/id_dsa"
default[:ssh][:authorized_keys]                = ["ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuh+pT8hiP9Sl4K0OGGiiIdZlJbDzIYD0rYM3FfOtVXP2L3lbfjJV2e90u6C6rI6TBfuzJKxKWYz1TwO73bln4Xz4miY7gqu6R8mvWwLejYNGEE9KBc2EP9R5YhetTGWrjub4AMiSuB6dvw3WzdKAj6Ng2NGZludCy+NCjExUlX/WgGmymFMrTYLSV4WyKjOYc4QA6FBCX87DjiulQVfTIWuesrQIm6zG4RSwe76gxnXPrKkT06jt38pX/W4CFUXmGwqIVRZ5jJk30mE13EA2/V2yh0y+ksbY3bSyqUzU7wQQjXjQJQf9rIHbJvR5cgqxL53kpywmeUzbYScGYaVpQQ== m.goetzke@curasystems.de"]

## DNS (Default to OpenDNS)
default[:dns][:search]          = "curasystems.local"
default[:dns][:nameservers]     = ["208.67.220.220", "208.67.222.222"]

# default[:package][:carbonx][:name] = "py27-carbon-0.9.10"
# default[:package][:carbonx][:version] = "0.9.10"

default[:chef_source][:url]	= "http://192.168.3.114:8080"