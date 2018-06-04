#
# Cookbook:: pester_tests_generator
# Recipe:: files_names
#
# Copyright:: 2018, The Authors, All Rights Reserved.

base_path = node[:config][:work_space][:base_path]
file_extension = node[:config][:work_space][:ps_extension]

node[:config][:work_space][:ps_files].each do |file_name|
    template "#{base_path}/specs/#{file_name}.Tests#{file_extension}" do
      source "ps_test_template.erb"
      variables(
        :file_name => file_name
      )
    end
end
