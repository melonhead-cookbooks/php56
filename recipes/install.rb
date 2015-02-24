# Encoding: utf-8
#
# Cookbook Name:: php56
# Recipe:: install
#
# Copyright 2014, Pardot, a Salesforce.com company
#
case node['platform_family']
when 'rhel', 'fedora'
  package 'php' do
    options '--enablerepo=epel'
    action :install
    only_if { node['platform_version'].to_i >= 6 }
  end

  node['php56']['extensions'].each do |extension, marked|
    if marked
      package extension do
        options '--enablerepo=epel'
        action :install
        only_if { node['platform_version'].to_i >= 6 }
      end
    end
  end
end
