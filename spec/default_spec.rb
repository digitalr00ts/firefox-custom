require 'spec_helper'

describe 'firefox-custom_test::default' do
  context 'windows cfg' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2008R2') do
        allow_any_instance_of(Chef::Recipe).to receive(:firefox-custom_cfg-src) { 'https://github.com/ckujau/scripts/raw/master/mozilla/firefox.cfg' }
      end.converge(described_recipe)
    end

    it 'creates local-settings file' do
      expect(chef_run).to create_file("#{ENV['ProgramFiles(x86)']}\\Mozilla Firefox\\defaults\\pref\\local-settings.js")
    end

    it 'creates cfg file' do
      expect(chef_run).to create_file("#{ENV['ProgramFiles(x86)']}\\Mozilla Firefox\\mozilla.cfg")
    end
  end

  context 'mac install of latest version' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'mac_os_x', version: '10.7.4') do
        allow_any_instance_of(Chef::Recipe).to receive(:firefox-custom_cfg-src) { 'https://github.com/ckujau/scripts/raw/master/mozilla/firefox.cfg' }
      end.converge(described_recipe)
    end

#    it 'installs latest version' do
#      expect(chef_run).to install_dmg_package('Firefox').with(
#        source: 'https://download-installer.cdn.mozilla.net/pub/firefox/releases/latest/mac/en-US/Firefox%2032.0.3.dmg',
#        dmg_name: 'firefox'
#      )
#    end
#  end

#  context 'linux install of latest version using package manager' do
#    let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

#    it 'installs latest version' do
#      expect(chef_run).to upgrade_package('firefox').with(
#        version: nil
#      )
#    end

#    it 'updates package manager' do
#      expect(chef_run).to_not run_execute('apt-get update')
#    end
#  end

#  context 'linux install of specific version using package manager' do
#    let(:chef_run) do
#      ChefSpec::SoloRunner.new do |node|
#        node.set['firefox']['version'] = '28.0+build2-0ubuntu2'
#      end.converge(described_recipe)
#    end

#    it 'installs latest version' do
#      expect(chef_run).to upgrade_package('firefox').with(
#        version: '28.0+build2-0ubuntu2'
#      )
#    end
  end
end
