#
# Cookbook:: bird
# Recipe:: ipv4 
#
# Copyright:: 2017, Nate Catelli, All Rights Reserved.

template "#{node['bird']['conf_directory']}/bird.conf" do
  source 'bird.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  notifies :restart, "service[#{node['bird']['service']['ipv4']}]", :delayed
end

service node['bird']['service']['ipv4'] do
  action [:start, :enable]
end
