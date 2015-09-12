#
# Cookbook Name:: firefox-custom
# Recipe:: default
#
# Copyright (C) 2015 digitalr00ts
#

include_recipe 'firefox'

cookbook_file 'local-settings.js' do
  action :create
  case node['platform']
  when 'windows'
    path "#{ENV['ProgramFiles(x86)']}\\Mozilla Firefox\\defaults\\pref\\local-settings.js"
  when 'mac_os_x'
    if node['firefox']['version'] == 'latest' || node['firefox']['version'] >= 34
      path '/Applications/Firefox.app/Contents/MacOS/defaults/local-settings.js'
    else
      path '/Applications/Firefox.app/Contents/MacOS/defaults/pref/local-settings.js'
    end
  else # assume Linux or Unix
    path '/usr/lib/firefox/browser/defaults/preferences/local-settings.js'
  end
  source 'local-settings.js'
end

if node['firefox-custom']['cfg-src'].nil? || node['firefox-custom']['cfg-src'].strip.empty? || !defined?(node['firefox-custom']['cfg-src'])
  cookbook_file 'mozilla.cfg' do
    action :create
    case node['platform']
    when 'windows'
      path "#{ENV['ProgramFiles(x86)']}\\Mozilla Firefox\\mozilla.cfg"
    when 'mac_os_x'
      path '/Applications/Firefox.app/Contents/MacOS/mozilla.cfg'
    else # assume Linux or Unix
      path '/usr/lib/firefox/mozilla.cfg'
    end
    source 'mozilla.cfg'
  end
else
  remote_file 'mozilla.cfg' do
    action :create
    case node['platform']
    when 'windows'
      path "#{ENV['ProgramFiles(x86)']}\\Mozilla Firefox\\mozilla.cfg"
    when 'mac_os_x'
      path '/Applications/Firefox.app/Contents/MacOS/mozilla.cfg'
    else # assume Linux or Unix
      path '/usr/lib/firefox/mozilla.cfg'
    end
    source node['firefox-custom']['cfg-src']
  end
end
