#
# Cookbook:: pester_tests_generator
# Recipe:: files_names
#
# Copyright:: 2018, The Authors, All Rights Reserved.

base_path = node[:config][:work_space][:base_path]
file_extension = node[:config][:work_space][:ps_extension]
pester_convention_naming = node[:config][:work_space][:pester_convention_naming]

node[:config][:work_space][:ps_files].each do |file_name|
    template "#{file_name}.#{pester_convention_naming}#{file_extension}" do
      path "#{base_path}/specs/#{file_name}.Tests#{file_extension}"
      source "ps_test_template.erb"
      action :create_if_missing
      variables(
        :file_name => file_name
      )
    end
end
