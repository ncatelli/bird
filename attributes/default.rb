default['bird']['ipv4'] = true
default['bird']['ipv6'] = false

case node['platform']
when 'debian', 'ubuntu'
  default['bird']['package'] = 'bird'
  default['bird']['conf_directory'] = '/etc/bird'
  default['bird']['service']['ipv4'] = 'bird'
  default['bird']['service']['ipv6'] = 'bird6'

  default['bird']['conf']['ipv4']['router-id'] = node['ipaddress'] 
  default['bird']['conf']['ipv4']['log'] = {
    'syslog' => 'all'
  }

  default['bird']['conf']['ipv4']['filter'] = {}
  default['bird']['conf']['ipv4']['protocol'] = {
    'kernel' => {
      'metric' => 64,
      'import' => 'none'
    },
    'device' => {}
  }

  default['bird']['conf']['ipv6']['router-id'] = node['ipaddress']
  default['bird']['conf']['ipv6']['log'] = {
    'syslog' => 'all'
  }

  default['bird']['conf']['ipv6']['filter'] = {}
  default['bird']['conf']['ipv6']['protocol'] = {
    'kernel' => {
      'metric' => 64,
      'import' => 'none'
    },
    'device' => {}
  }
end
