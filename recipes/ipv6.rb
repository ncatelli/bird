#
# Cookbook:: bird
# Recipe:: ipv6 
#
# Copyright:: 2017, Nate Catelli, All Rights Reserved.

template "#{node['bird']['conf_directory']}/bird6.conf" do
  source 'bird6.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  notifies :restart, "service[#{node['bird']['service']['ipv6']}]", :delayed
end

service node['bird']['service']['ipv6'] do
  action [:start, :enable]
end
