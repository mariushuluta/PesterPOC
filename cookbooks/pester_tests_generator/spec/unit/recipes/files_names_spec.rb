#
# Cookbook:: pester_tests_generator
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'
require 'chefspec'
require 'chefspec/berkshelf'

describe 'pester_tests_generator::files_names' do
  context 'When all attributes are default, on windows' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '10')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates a template if is missing' do
      expect(chef_run).to create_template_if_missing('serviceValidator.Tests.ps1')
    end
  end
end
