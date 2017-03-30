#
# Cookbook:: lnx_wrkstn_base
# Recipe:: install_terrafrom
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'unzip'

remote_file '/home/ubuntu/terraform.zip' do
  source node['lnx_wrkstn_base']['terraform_url']
  owner 'root'
  group 'root'
  checksum node['lnx_wrkstn_base']['terraform_checksum']
end

execute 'unzip_terraform' do
  command 'unzip -q -o /home/ubuntu/terraform.zip -d /usr/local/bin'
  action :run
  not_if { File.exist?('/usr/local/bin/terraform') }
end
