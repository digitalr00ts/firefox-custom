#
# Cookbook Name:: firefox-custom
# Recipe:: default
#
# Copyright (C) 2015 digitalr00ts
#

include_recipe 'firefox'

if platform_family?('windows')
  remote_file "#{ENV['ProgramFiles(x86)']}\\Mozilla Firefox\\mozilla.cfg" do
    source node['firefox-custom']['cfg_src'] 
    action :create
  end
  remote_file "#{ENV['ProgramFiles(x86)']}\\Mozilla Firefox\\defaults\\pref\\local-settings.js" do
    source node['firefox-custom']['local-settings_src']
    action :create
  end
elsif platform_family?('mac_os_x')
  log "Not yet supported"
else # assume linux platform
  log "Not yet supprted"
end
