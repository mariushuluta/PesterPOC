#
# Cookbook:: pester_tests_generator
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'chefspec'
require 'chefspec/berkshelf'

describe 'pester_tests_generator::default' do
  context 'When all attributes are default, on Windows 10' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'windows', version: '10')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'expects to have recipe files_names included' do
      expect(chef_run).to include_recipe('pester_tests_generator::files_names')
    end
  end
end
