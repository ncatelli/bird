#
# Cookbook:: bird
# Recipe:: default
#
# Copyright:: 2017, Nate Catelli, All Rights Reserved.

sysctl_set 'net.ipv4.ip_forward=1' do
  key 'net.ipv4.ip_forward'
  value '1'
  action :set
end

package node['bird']['package'] do
  action :install
end

directory node['bird']['conf_directory'] do
  owner 'root'
  group  'root'
  mode '0755'
  action :create
end

if node['bird']['ipv4']
  include_recipe 'bird::ipv4'
end

if node['bird']['ipv6']
  include_recipe 'bird::ipv6'
end
