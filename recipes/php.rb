#
# Cookbook Name:: newrelic
# Recipe:: php
#
# Copyright 2011, Skystack Limited
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
require_recipe "newrelic::default"

package "newrelic-php5" do
  action :install
  options "--force-yes"
end

execute "run_newrelic-installer" do
  command "/tmp/newrelic-installer;touch /opt/skystack/tmp/executed-newrelic-installer;"
  action :nothing
  only_if do ! File.exists?( "/opt/skystack/tmp/executed-newrelic-installer" ) end
end

bash "newrelic-installer" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
#!/bin/bash
NR_INSTALL_SILENT=true
NR_INSTALL_KEY=#{node[:newrelic][:license_key]}

if [ -e /usr/bin/newrelic-install ]; then
  /usr/bin/newrelic-install install
fi

EOH
  notifies :run, resources(:execute => "run_newrelic-installer")
end

directory '/etc/newrelic' do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

template "/etc/php5/conf.d/newrelic.ini" do
  source "newrelic.ini.erb"
  notifies :restart, resources(:service => "newrelic-daemon"), :delayed
end

template "/etc/newrelic/newrelic.cfg" do
  source "newrelic.cfg.erb"
  variables(
    :license_key => node[:newrelic][:license_key],
    :loglevel => node[:newrelic][:loglevel],
    :logfile => node[:newrelic][:logfile],
    :pidfile => node[:newrelic][:pidfile],
    :collector => node[:newrelic][:daemon][:collector_host]
  )
  notifies :restart, resources(:service => "newrelic-daemon"), :delayed
end




