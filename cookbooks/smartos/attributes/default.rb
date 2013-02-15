# SmartOS Base Recipes Attributes

#default[:hostname]  	= ""

## NTP (Default to NTP Pool Servers)
default[:ntp][:servers] = ["0.pool.ntp.org", "1.pool.ntp.org", "4.pool.ntp.org"]

## SSH Pub/Priv Keys for root
#default[:ssh][:pubkey]                         = "http://path/to/id_dsa.pub"
#default[:ssh][:privkey]                        = "http://path/to/id_dsa"
#default[:ssh][:authorized_keys]                = ["..",".."]

## DNS (Default to OpenDNS)
default[:dns][:search]          = "smartos.org"
default[:dns][:nameservers]     = ["208.67.220.220", "208.67.222.222"]

# default[:package][:carbonx][:name] = "py27-carbon-0.9.10"
# default[:package][:carbonx][:version] = "0.9.10"